Page  = require 'controllers/page'


class HomePage extends Page
  el: $('.home')
  className: 'home'
  template: require 'views/home'
  
  constructor: ->
    super
    @html @template


module.exports = HomePage