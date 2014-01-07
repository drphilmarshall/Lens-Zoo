Page  = require 'controllers/page'
Api = require 'zooniverse/lib/api'

FILMING = true

FROM_BEFORE_BBC = 
  user_count: 11857
  classification_count: 10921085

class HomePage extends Page
  el: $('.home')
  className: 'home'
  template: require 'views/home'
  
  elements:
    '.participants': 'participants'
    '.images': 'images'

  constructor: ->
    super
    @html @template

    Api.current.get '/projects/spacewarp', (project) =>
      if FILMING
        @participants.html @formatNumber project.user_count - FROM_BEFORE_BBC.user_count
        @images.html @formatNumber project.classification_count - FROM_BEFORE_BBC.classification_count
      else
        @participants.html @formatNumber project.user_count
        @images.html @formatNumber project.classification_count

  formatNumber: (n) ->
    n.toString().replace /(\d)(?=(\d{3})+(?!\d))/g, '$1,'

module.exports = HomePage