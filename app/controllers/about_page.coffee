Page  = require 'controllers/page'

# TODO: Merge this class with GuidePage.
class AboutPage extends Page
  el: $('.about')
  className: 'about'
  
  events:
    'click .menu li'        : 'show'
    'click .guide-menu li'  : 'show'
  
  active: ->
    super
    @el.scroll()  # trick lazyload
  
  show: (e) =>
    target = e.currentTarget
    type = $(target).data('type')
    
    $(target).addClass('show').siblings('li').removeClass('show')
    $("section[data-type='#{type}']").addClass('show').siblings('section').removeClass('show')

    @el.scroll() # trick lazyload


module.exports = AboutPage