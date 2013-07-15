
_     = require 'underscore/underscore'

User            = require 'zooniverse/models/user'
Subject         = require 'zooniverse/models/subject'
Favorite        = require 'zooniverse/models/favorite'
Classification  = require 'zooniverse/models/classification'

browserDialog = require 'zooniverse/controllers/browser-dialog'

Page            = require 'controllers/page'
Annotation      = require 'controllers/Annotation'
QuickDashboard  = require 'controllers/quick_dashboard'
QuickGuide      = require 'controllers/quick_guide'
Counters        = require 'controllers/counters'

Counter = require 'models/counter'

{Tutorial}  = require 'zootorial'
{Dialog}    = require 'zootorial'
{Step}      = require 'zootorial'

TutorialSubject   = require 'lib/tutorial_subject'
TutorialSteps     = require 'lib/tutorial_steps'
TutorialDashboard = require 'lib/tutorial_dashboard'
TutorialTalk      = require 'lib/tutorial_talk'

TalkIntegration = require 'lib/talk_integration'
CreateFeedback  = require 'lib/create_feedback'


class Classifier extends Page
  @include TalkIntegration
  @include CreateFeedback
  
  el: $('.classifier')
  className: 'classifier'
  template: require 'views/classifier'
  subjectTemplate: require 'views/subject'
  subjectDimension: 440
  dashboardCollection: 'Dashboard'
  
  maxAnnotations: 5
  
  subjectGroup: '5154a3783ae74086ab000001'
  simulationGroup: '5154a3783ae74086ab000002'
  
  
  elements:
    '.mask'                     : 'maskEl'
    '.viewer'                   : 'viewerEl'
    '.subjects'                 : 'subjectsEl'
    'svg.primary'               : 'svg'
    '.remove-all'               : 'removeAllEl'
  
  events:
    'click a[data-type="heart"]:nth(0)'       : 'onFavorite'
    'click a[data-type="dashboard"]:nth(0)'   : 'onDashboard'
    'click a[data-type="finish"]:nth(0)'      : 'onFinish'
    'click .annotation'                       : 'onAnnotation'
    'click g'                                 : 'stopPropagation'
    'click .remove-all'                       : 'removeAnnotations'
  
  
  constructor: ->
    super
    
    @html @template
    
    # Initialize Quick Guide
    @quickGuide = new QuickGuide({el: @el.find('.quick-guide')})
    
    # Conditionally load Quick Dashboard
    userAgent = browserDialog.testAgent(navigator.userAgent)
    unless userAgent.browser is 'msie'
      @viewer = new QuickDashboard({el: @el.find('.viewer')[0], classifier: @})
      @viewer.bind 'ready', @setupMouseControls
      @viewer.bind 'close', @onViewerClose
    
    # Create new controller for counters
    new Counters({el: @el.find('.stats')})
    
    # Store the counter model
    @counter = Counter.first()
    
    User.on 'change', @onUserChange
    
    # Dialog for warning of over excessive annotations
    @warningDialog = new Dialog
      content: "That's a lot of markers! Remember, lenses are rare."
      attachment: 'center center .annotation center center'
    
    # Reset variables before new classification
    @reset()
    
    # Start with subject group
    Subject.group = @subjectGroup
    
    # Storage for Talk collection ids
    @talkIds = {}
    
    # Setup offscreen canvas and context for mask
    @canvas = document.createElement('canvas')
    @ctx = @canvas.getContext('2d')
  
  active: ->
    super
    
    # Trick zootorial to show when page is active.
    $(window).resize()
  
  # Reset variables for a classification
  reset: ->
    @setSimulationRatio()
    
    @annotations      = {}
    @annotationIndex  = 0
    @annotationCount  = 0
    @removeOnCount    = 0
    @hasAnnotation    = false
    @hasWarned        = false
    @preset           = null
    @feedbackShown    = false
    @xDown            = null
    @yDown            = null
    @isAnnotatable    = true
    
    delete @classification
    
    @isTrainingSubject  = false
    @isLensMarked       = false
    
    @warningDialog.close()
  
  # Called when the user changes.  Lots going on here:
  # 1) Determine tutorial state
  # 2) Check talk collection
  # 3) Set user counters
  onUserChange: (e, user) =>
    
    # Reset subjects
    Subject.instances = []
    $('.subjects').empty()
    @svg.empty()
    Subject.off 'fetch', @appendSubjects
    Subject.off 'select', @onSubjectSelect
    Subject.off 'no-more', @onNoMoreSubjects
    
    # Clean up for when user signs out while using QD
    if @viewer?
      @viewer.trigger 'close'
      @viewer.clearCache()
    
    # Unbind Talk event and clean collection ids
    @unbind 'addToTalk'
    @talkIds = {}
    
    # Set default counts
    @counter.updateAttributes({'classified': 0, 'potentials': 0, 'favorites': 0})
    
    if user?
      
      # Set up three collections (My Dashboard, My Candidates and My Simulations)
      names = ['My Dashboard', 'My Candidates', 'My Simulations']
      descriptions = [
        'All Space Warp images examined in the Quick Dashboard.',
        'Gravitational lens candidates.',
        'Simulated gravitational lenses.'
      ]
      @setTalkCollections(user, names, descriptions)
      
      @bind 'addToTalk', (collectionId, subjectId) =>
        @addToTalkCollection(user, collectionId, subjectId)
      
      project = user.project
      
      # Determine if tutorial completed
      unless 'tutorial_done' of project
        @startTutorial()
      else
        @counter.updateAttributes({
          'classified': project.classification_count or 0,
          'potentials': project.annotation_count or 0,
          'favorites': project.favorite_count or 0
        })
        @start()
    else
      @startTutorial()
    
    @setSimulationRatio()
  
  start: ->
    # Set up events
    Subject.on 'fetch', @appendSubjects
    Subject.on 'select', @onSubjectSelect
    Subject.on 'no-more', @onNoMoreSubjects
    
    @tutorial.end() if @tutorial?
    
    # Initial fetch for subjects
    Subject.next()
  
  onTutorialEnd: (e) ->
    $("circle[r='50']").remove()
  
  startTutorial: =>
    # Close any lingering tutorials
    @tutorial?.end()
    
    # Create tutorial and bind to handlers
    @tutorial = new Tutorial
      id: 'tutorial'
      firstStep: 'welcome'
      steps: TutorialSteps
      parent: @el[0]
    @tutorial.el.bind('end-tutorial', @onTutorialEnd)
    
    # Set first tutorial subject
    subject = TutorialSubject.main
    
    # Create classification object
    @classification = new Classification {subject}
    
    # Empty tutorial subject from queue
    Subject.instances = []
    
    # Set queue length on Subject
    Subject.queueLength = 3
    
    # Bind tutorial-specific event
    Subject.on 'fetch', @createStagedTutorial
    
    # Fetch subjects from API
    Subject.fetch()
    
    # Append tutorial subject to DOM
    @appendSubjects(null, [subject])
    @el.find('.current').removeClass('current')
    @el.find('.subject').first().addClass('current')
    
    @tutorial.start()
  
  # Set up the staged tutorial subjects.  This should only be run once.
  createStagedTutorial: (e, subjects) =>
    
    # Handle event bindings
    Subject.off 'fetch', @createStagedTutorial
    Subject.on 'fetch', @appendSubjects
    Subject.on 'select', @onSubjectSelect
    Subject.on 'no-more', @onNoMoreSubjects
    
    # Create simulated and empty tutorial subjects
    simSubject = TutorialSubject.simulated
    dudSubject = TutorialSubject.empty
    
    # Set queue length on Subject back to five
    Subject.queueLength = 5
    
    # Insert tutorial subjects into queue
    Subject.instances.splice(1, 0, simSubject)
    Subject.instances.splice(3, 0, dudSubject)
    
    # Append remaining subjects to DOM
    @appendSubjects(null, Subject.instances)
  
  #
  # Subject callbacks
  #
  
  # Append subject(s) to DOM
  appendSubjects: (e, subjects) =>
    
    # Check what is on the DOM
    images = $(".subjects .image img")
    ids = _.map(images, (d) ->
      id = d.src.split('/').pop().split('.png').shift()
      return id
    )
    
    for subject, index in subjects
      continue if subject.id in ids
      
      params =
        url: subject.location.standard
        zooId: subject.zooniverse_id
      @subjectsEl.append @subjectTemplate(params)
  
  onSubjectSelect: (e, subject) =>
    console.log 'start image\t\t', subject.zooniverse_id
    
    # Ensure unique ids for upcoming subjects
    Subject.instances = _.uniq(Subject.instances)
    
    # Reset classification variables
    @reset()
    
    # Create new classification
    @classification = new Classification {subject}
    
    # Update DOM
    @el.find('.subject').first().addClass('current')
    
    # Check if training subject
    if subject.metadata.training?
      @isTrainingSubject = true
      
      # Set up offscreen canvas and cache the context
      img = new Image()
      img.onload = (e) =>
        @canvas.width = img.width
        @canvas.height = img.height
        @ctx.drawImage(img, 0, 0, img.width, img.height)
      img.src = $('.current img').attr('src')
    
    # Enable controls
    $('.controls').removeClass('disable')
    
    # Prompt login
    nClassified = @counter.classified
    if nClassified in [5, 15, 30, 50] and not User.current
      require('zooniverse/controllers/signup-dialog').show()
    
    # Prompt Dashboard message
    if nClassified is 3
      tutorial = new Tutorial
        id: 'dashboard'
        firstStep: 'dashboard'
        steps: TutorialDashboard
        parent: @el[0]
      tutorial.start()
    
    # Prompt Talk message
    if nClassified is 7
      tutorial = new Tutorial
        id: 'talk'
        firstStep: 'talk'
        steps: TutorialTalk
        parent: @el[0]
      tutorial.start()
      
  onNoMoreSubjects: ->
    alert "We've run out of subjects."
  
  #
  # Annotation functions
  #
  
  onAnnotation: (e) ->
    return unless @isAnnotatable
    return if @feedbackShown
    
    # Create annotation and push to object
    position = $('.subject.current .image').position()
    x = e.pageX - position.left
    y = e.pageY - position.top
    
    annotation = new Annotation({el: @svg, x: x, y: y, index: @annotationIndex})
    @annotations[@annotationIndex] = annotation
    @annotationIndex += 1
    @annotationCount += 1
    annotation.bind('remove', @removeAnnotation)
    annotation.bind('remove-on', =>
      @removeOnCount += 1
      @toggleRemoveAll()
    )
    annotation.bind('remove-off', =>
      @removeOnCount -= 1
      @toggleRemoveAll()
    )
    
    # Trigger event with annotation object
    @trigger 'onAnnotation', annotation
    
    # Replace text on interface
    unless @hasAnnotation
      @el.find('.current [data-type="finish"]').text('Finished marking!')
      @hasAnnotation = true
    
    # Update stats
    if @annotationCount is 1
      @counter.increment('potentials')
    
    # Warn of overmarking
    if (@annotationCount > @maxAnnotations) and (Math.random() > 0.4) and (not @hasWarned)
      @warningDialog.open()
      @hasWarned = true
  
  toggleRemoveAll: (e) ->
    if @removeOnCount > 0
      @removeAllEl.addClass('show')
    else
      @removeAllEl.removeClass('show')
  
  removeAnnotations: (e) =>
    @stopPropagation(e)
    
    for key, annotation of @annotations
      annotation.remove()
  
  removeAnnotation: (annotation) =>
    
    # Remove event bindings
    annotation.unbind()
    
    index = annotation.index
    delete @annotations[index]
    
    # Update stats
    @annotationCount -= 1
    if @annotationCount is 0
      @counter.decrement('potentials')
    
    # Update finish text if necessary
    count = _.keys(@annotations).length
    if count is 0
      @el.find('.current [data-type="finish"]').text('Next!')
      @hasAnnotation = false
  
  # Check if volunteer marked a simulated lens
  checkImageMask: (x, y) =>
    pixel = @ctx.getImageData(x, y, 1, 1)
    mask = pixel.data[3]
    return if mask is 255 then true else false
  
  # Prevent annotations over SVG elements
  stopPropagation: (e) ->
    e.stopPropagation()
  
  # Add to favorites and increment counter
  onFavorite: (e) ->
    e.preventDefault()
    if User.current?
      el = $(e.currentTarget).find('.icon')
      if el.hasClass('active')
        el.removeClass('active')
        @classification.favorite = false
        @counter.decrement('favorites')
      else
        el.addClass('active')
        @classification.favorite = true
        @counter.increment('favorites')
    else
      alert ("Please sign in or make an account to save favourites.")
  
  # Set up inline dashboard with current subject
  onDashboard: (e) ->
    e.preventDefault()
    
    if @viewer?
      # Show mask and viewer
      @maskEl.addClass('show')
      @viewerEl.addClass('show')
    
      # Load current subject
      @viewer.load(@classification.subject.metadata.id)
    else
      alert "Sorry this feature is not supported on IE."
  
  # Enabled only when viewer is ready
  wheelHandler: (e) =>
    e.preventDefault()
    
    # Get object and pipe event
    wfits = @viewer.wfits
    wfits.wheelHandler(e)
    
    Annotation.zoom = wfits.getZoom() * wfits.width / 2
    for key, a of @annotations
      a.worldToLocal()
  
  # Called when viewer is ready
  setupMouseControls: (e) =>
    svg = @svg[0]
    
    # Activate annotate flag
    @isAnnotatable = false
    
    # Update/reset Annotation class attributes
    Annotation.halfWidth = @viewer.wfits.width / 2
    Annotation.halfHeight = @viewer.wfits.height / 2
    Annotation.xOffset = @viewer.wfits.getXOffset()
    Annotation.yOffset = @viewer.wfits.getYOffset()
    
    # Setup mouse controls on the SVG element
    svg.addEventListener('mousewheel', @wheelHandler, false)
    svg.addEventListener('DOMMouseScroll', @wheelHandler, false)
    
    # Pass events to viewer
    svg.onmousedown = (e) =>
      
      # Store the down position for later comparison
      @xDown = e.pageX
      @yDown = e.pageY
      
      return if Annotation.drag
      
      @viewer.wfits.canvas.onmousedown(e)
      
    svg.onmouseup = (e) =>
      
      # Propagate to annotation layer if down coordinates match up coordinates
      if @xDown is e.pageX and @yDown is e.pageY
        @isAnnotatable = true
      else
        @isAnnotatable = false
      return if @viewer.wfits.drag is false
      
      @viewer.wfits.canvas.onmouseup(e)
      
    svg.onmousemove = (e) =>
      # Pass event to WebFITS object
      @viewer.wfits.canvas.onmousemove(e)
      
      return if Annotation.drag
      
      if @viewer.wfits.drag
        # Update Annotation class attributes
        Annotation.xOffset = @viewer.wfits.getXOffset()
        Annotation.yOffset = @viewer.wfits.getYOffset()
        
        # Redraw element within pan-zoom reference frame
        for key, a of @annotations
          a.worldToLocal()
        
    svg.onmouseout = (e) =>
      @viewer.wfits.canvas.onmouseout(e)
    svg.onmouseover = (e) =>
      @viewer.wfits.canvas.onmouseover(e)
  
  onViewerClose: (e) =>
    
    @maskEl.removeClass('show')
    @viewerEl.removeClass('show')
    
    # Allow annotation again
    @isAnnotatable = true
    
    # Reset Annotation attributes
    Annotation.xOffset = -220.5
    Annotation.yOffset = -220.5
    Annotation.zoom = 1
    
    # Redraw in world frame
    for key, a of @annotations
      a.worldToLocal()
    
    # Tear down mouse events
    $(document).keyup(null)
    $(document).keydown(null)
    
    svg = @svg[0]
    svg.removeEventListener('mousewheel', @wheelHandler, false)
    svg.onmousedown = null
    svg.onmouseup   = null
    svg.onmousemove = null
    svg.onmouseout  = null
    svg.onmouseover = null
    
    @viewer.teardown()
  
  # Training scheme using simulations and empty fields
  setSimulationRatio: ->
    
    # When duds are included in the @TrainingGroup, need to multiply @simratio by 2 to 
    nClassified = @counter.classified
    baseLevel = Math.floor(nClassified / 20) + 1
    @level = Math.min(baseLevel, 3)
    denominator = (5 * Math.pow(Math.sqrt(2), @level - 1))
    @simRatio = 1 / denominator
    Subject.group = if @simRatio > Math.random() then @simulationGroup else @subjectGroup
    
    # Update sim freq text
    @counter.updateAttribute('simFrequency', "1 in #{Math.round(denominator)}")
  
  submit: (e) =>
    console.log 'submit image\t', @classification.subject.zooniverse_id
    
    # Get number of annotations
    nAnnotations = _.keys(@annotations).length
    
    # Push to My Candidates if no simulation and subject is marked
    unless @isTrainingSubject
      if nAnnotations > 0
        @trigger 'addToTalk', @talkIds['My Candidates'], @classification.subject.zooniverse_id
    
    # Process annotations and push to API
    for index, annotation of @annotations
      @classification.annotate annotation.toJSON()
    
    # Add Quick Dashboard subject to Dashboard Talk collection
    if @preset?
      
      # Record the Quick Dashboard preset
      @classification.annotate {preset: @preset}
      
      # Push subject to Talk collection
      @trigger 'addToTalk', @talkIds['My Dashboard'], @classification.subject.zooniverse_id
    
    # Training image with simulation
    if @isTrainingSubject
      @classification.annotate {simFound: @isLensMarked}
      
      # Add subject to My Simulations collection
      if @classification.subject.metadata.training[0].type in ['lensing cluster', 'lensed quasar', 'lensed galaxy']
        @trigger 'addToTalk', @talkIds['My Simulations'], @classification.subject.zooniverse_id
    
    @classification.send()
    
    # Empty SVG element
    @svg.empty()
    
    # Clear viewer cache
    @viewer?.clearCache()
    
    # Get DOM elements
    target  = $(e.currentTarget)
    current = $('.current')
    next    = current.siblings().first()
    
    # Change classes
    current.removeClass('current')
    current.addClass('removing')
    next.removeClass('right')
    
    # Disable controls until next subject loaded
    $('.controls').addClass('disable')
    
    # Remove subject from DOM and request next subject
    setTimeout ->
      current.remove()
      Subject.next()
    , 400
    
    # Update stats
    @counter.increment('classified')
    
    
  onFinish: (e) =>
    e.preventDefault()
    
    # Hide remove all button
    @removeAllEl.removeClass('show')
    
    if @isTrainingSubject
      if @feedbackShown
        @tutorial?.end()
        @submit(e)
        return
      
      @feedbackShown = true
      
      # Get the training type (e.g. lens or empty)
      training = @classification.subject.metadata.training[0]
      trainingType = training.type
      
      if trainingType in ['lensing cluster', 'lensed quasar', 'lensed galaxy']
        
        # Get the location for the dialog
        x = (training.x + 30) / @subjectDimension
        y = 1 - (training.y / @subjectDimension)
        
        # Check if any annotation over lens
        for index, annotation of @annotations
          @isLensMarked = @checkImageMask(annotation.x, annotation.y)
          break if @isLensMarked
        
        if @isLensMarked
          @tutorial = @createSimulationFoundFeedback(e, trainingType, x, y)
        else
          @tutorial = @createSimulationMissedFeedback(e, trainingType, x, y)
        
      else if trainingType is 'empty'
        
        # Count the number of annotations
        nAnnotations = _.keys(@annotations).length
        
        @tutorial = if nAnnotations > 0 then @createDudMissedFeedback(e) else @createDudFoundFeedback(e)
      
      # Start the tutorial
      @tutorial.start()
      
    else
      @submit(e)


module.exports = Classifier