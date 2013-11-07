{ Model } = require 'spine'

class Counter extends Model
  @configure "Counter", "classified", "potentials", "favorites", "simFrequency"
  
  increment: (key) ->
    value = @[key]
    value += 1
    @updateAttribute(key, value)
  
  decrement: (key) ->
    value = @[key]
    value -= 1
    @updateAttribute(key, value)

module.exports = Counter
