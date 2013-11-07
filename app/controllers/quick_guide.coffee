{ Controller } = require 'spine'

class QuickGuide extends Controller
  className: 'quick-guide'
  template: require 'views/quick_guide'
  show: false
  
  events:
    'click .tab': 'toggle'
    'click img': 'onClick'
    
  constructor: ->
    super
    @html @template
    
  toggle: =>
    right = if @show then 0 else -1 * @el.width()
    @el.css('right', right)
    @show = not @show
  
  onClick: (e) =>
    type = e.target.dataset.type
    @navigate('/guide')
    
    if type in ['lensing-clusters', 'lensed-galaxies', 'lensed-quasars']
      sectionType = 'real-lenses'
    else
      sectionType = 'false-positives'
    
    $(".guide-menu li[data-type='#{sectionType}']").click()
    $("ul.menu li[data-type='#{type}']").click()

module.exports = QuickGuide
