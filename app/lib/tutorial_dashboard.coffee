{ Tutorial, Step }  = require 'zootorial'
translate = require 't7e'

module.exports =
  length: 1
  
  dashboard: new Step
    number: 1
    header: translate 'span', 'tutorial.dashboard.header'
    details: translate 'span', 'tutorial.dashboard.details'
    attachment: 'center bottom [data-type="dashboard"] 0.55 -0.2'
    className: 'arrow-bottom'
    onEnter: ->
      $('.current .controls a[data-type="dashboard"]').addClass('hover')
    onExit: ->
      $('.current .controls a[data-type="dashboard"]').removeClass('hover')
    next:
      'click a': true