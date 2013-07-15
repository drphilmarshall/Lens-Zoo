
{Tutorial}  = require 'zootorial'
{Step}      = require 'zootorial'

Feedback  = require 'lib/feedback'


module.exports =
  
  createSimulationFoundFeedback: (e, trainingType, x, y) ->
    
    # Get random header and detail
    header = Feedback.header
    detail = Feedback.detail[trainingType]
    
    index1 = Math.floor(Math.random() * header.length)
    index2 = Math.floor(Math.random() * detail.length)
    
    header = "#{Feedback.header[index1]}! You spotted a simulated lens."
    detail = detail[index2]
    
    return new Tutorial
      id: 'simFound'
      firstStep: 'simFound'
      parent: @el[0]
      steps:
        length: 1
        
        simFound: new Step
          header: header
          details: detail
          attachment: "left center .annotation #{x} #{y}"
          block: '.annotation'
          className: 'arrow-left'
          nextButton: 'Close'
          next: true
          onExit: =>
            @viewer?.trigger 'close'
  
  createSimulationMissedFeedback: (e, trainingType, x, y) ->
    
    # Get random detail
    missed = Feedback.missed
    index = Math.floor(Math.random() * missed.length)
    
    detail = missed[index]
    
    return new Tutorial
      id: 'simMissed'
      firstStep: 'simMissed'
      parent: @el[0]
      steps:
        length: 1
        
        simMissed: new Step
          number: 1
          details: detail
          attachment: "left center .annotation #{x} #{y}"
          block: '.annotation'
          className: 'arrow-left'
          nextButton: 'Close'
          next: true
          onExit: =>
            @viewer?.trigger 'close'
  
  createDudFoundFeedback: (e) ->
    return new Tutorial
      id: 'emptyFound'
      firstStep: 'emptyFound'
      parent: @el[0]
      steps:
        length: 1
        
        emptyFound: new Step
          header: 'Nice! There is no gravitational lens in this field!'
          details: "This is a different kind of Training Image, one that has already been inspected by the Science Team and found not to contain any gravitational lenses."
          attachment: 'center center .annotation center center'
          block: '.annotation'
          nextButton: 'Close'
          next: true
          onExit: =>
            @viewer?.trigger 'close'
  
  createDudMissedFeedback: (e) ->
    return new Tutorial
      id: 'empty-missed'
      firstStep: 'missed'
      parent: @el[0]
      steps:
        length: 1
        
        missed: new Step
          header: 'There is no gravitational lens in this field!'
          details: "This is a different kind of Training Image, one that has already been inspected by the Science Team and found not to contain any gravitational lenses."
          attachment: 'center center .annotation center center'
          block: '.annotation'
          nextButton: 'Close'
          next: true
          onExit: =>
            @viewer?.trigger 'close'
