
{Controller} = require 'spine'

Counter = require 'models/counter'


class Counters extends Controller
  template: require 'views/counters'
  
  
  constructor: ->
    super
    Counter.bind("update", @render)
  
  render: =>
    @html @template(Counter.first())


module.exports = Counters