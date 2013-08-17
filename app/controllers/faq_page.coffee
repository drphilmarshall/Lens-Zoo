Page  = require 'controllers/page'


class FAQPage extends Page
  el: $('.faq')
  className: 'faq'
  template: require 'views/faq'
  
  constructor: ->
    super
    @html @template


module.exports = FAQPage