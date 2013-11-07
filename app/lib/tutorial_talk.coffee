{ Tutorial, Step }  = require 'zootorial'
translate = require 't7e'

module.exports =
  length: 1
  
  talk: new Step
    number: 1
    header: translate 'span', 'tutorial.talk.header'
    details: translate 'span', 'tutorial.talk.details'
    attachment: 'center bottom [data-type="talk"] 0.55 -0.2'
    className: 'arrow-bottom'
    onEnter: ->
      $('.current .controls a[data-type="talk"]').addClass('hover')
    onExit: ->
      $('.current .controls a[data-type="talk"]').removeClass('hover')
    next:
      'click a': true
