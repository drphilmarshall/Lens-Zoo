{ Tutorial, Step } = require 'zootorial'
translate = require 't7e'

ctx = null

getMaskValue = (e) ->
  position = $('.current .image').position()
  x = e.pageX - position.left
  y = e.pageY - position.top - 10 # Subtract the radius 10 from the coordinate
  
  pixel = ctx.getImageData(x, y, 1, 1)
  return pixel.data[3]

module.exports =
  length: 8
  
  welcome: new Step
    number: 1
    header: translate 'span', 'tutorial.welcome.header'
    details: translate 'span', 'tutorial.welcome.details'
    attachment: 'center center .current center center'
    block: '.annotation, .controls:first'
    next: 'what_are_lenses_1'
  
  what_are_lenses_1: new Step
    number: 2
    header: translate 'span', 'tutorial.what_are_lenses_1.header'
    details: translate 'span', 'tutorial.what_are_lenses_1.details'
    attachment: 'center center .current center center'
    block: '.annotation, .controls:first'
    next: 'what_are_lenses_2'
  
  what_are_lenses_2: new Step
    number: 3
    header: translate 'span', 'tutorial.what_are_lenses_2.header'
    details: translate 'span', 'tutorial.what_are_lenses_2.details'
    attachment: 'center center .current center center'
    block: '.annotation, .controls:first'
    next: 'spotters_guide'
  
  spotters_guide: new Step
    number: 4
    header: translate 'span', 'tutorial.spotters_guide.header'
    details: translate 'span', 'tutorial.spotters_guide.details'
    attachment: 'right center .quick-guide left center'
    block: '.annotation, .controls:first'
    className: 'arrow-right'
    next: 'identify'
  
  identify: new Step
    number: 5
    header: translate 'span', 'tutorial.identify.header'
    details: translate 'span', 'tutorial.identify.details'
    attachment: 'left top .current 1 0.5'
    block: '.annotation, .controls:first'
    className: 'arrow-left'
    onEnter: ->
      bounding = document.createElementNS('http://www.w3.org/2000/svg', "circle")
      bounding.setAttribute("transform", "translate(#{258}, #{324})")
      bounding.setAttribute("class", "outline")
      bounding.setAttribute("stroke", 'white')
      bounding.setAttribute("stroke-width", 2)
      bounding.setAttribute("r", 50)
      bounding.setAttribute("fill-opacity", 0)
      bounding.setAttribute("opacity", 0.4)
      $("svg.primary")[0].appendChild(bounding)
    next: 'mark'
  
  mark: new Step
    number: 6
    header: translate 'span', 'tutorial.mark.header'
    details: translate 'span', 'tutorial.mark.details'
    attachment: 'left top .current 1 0.52'
    block: '.controls:first'
    className: 'arrow-left'
    onEnter: (tutorial) ->
      canvas = document.createElement('canvas')
      ctx = canvas.getContext('2d')
      img = new Image()
      img.onload = (e) =>
        canvas.width = img.width
        canvas.height = img.height
        ctx.drawImage(img, 0, 0, img.width, img.height)
      img.src = $('.current .image img').attr('src')
    next:
      'mouseup .annotation': (e, tutorial, step) ->
        mask = getMaskValue(e)
        return if mask is 255 then 'good_job' else 'try_again'
  
  good_job: new Step
    header: translate 'span', 'tutorial.good_job.header'
    details: translate 'span', 'tutorial.good_job.details'
    attachment: 'left top .current 1 0.52'
    block: '.controls'
    className: 'arrow-left'
    next: 'training'
    
  try_again: new Step
    header: translate 'span', 'tutorial.try_again.header'
    details: translate 'span', 'tutorial.try_again.details'
    attachment: 'left top .current 1 0.44'
    className: 'arrow-left'
    blocks: '.controls:first'
    next:
      'mouseup .annotation': (e, tutorial, step) ->
        mask = getMaskValue(e)
        return if mask is 255 then 'good_job' else false
  
  training: new Step
    number: 7
    header: translate 'span', 'tutorial.training.header'
    details: translate 'span', 'tutorial.training.details'
    attachment: 'center center .current center center'
    block: '.annotation, .controls:first'
    next: 'thanks'
  
  thanks: new Step
    number: 8
    header: translate 'span', 'tutorial.thanks.header'
    details: translate 'span', 'tutorial.thanks.details'
    className: 'arrow-bottom'
    attachment: 'center bottom a.last center -0.2'
    block: '.annotation, .current .controls a:not(:last)'
    next:
      'click .controls a.last': true
  