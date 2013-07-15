
Page      = require 'controllers/page'
Counters  = require 'controllers/counters'

User      = require 'zooniverse/models/user'
Recent    = require 'zooniverse/models/recent'
Favorite  = require 'zooniverse/models/favorite'


class Profile extends Page
  el: $('.profile')
  className: 'profile'
  template: require 'views/profile'
  subjectTemplate: require 'views/profile_subjects'
  
  favoritePage: 1
  recentPage: 1
  
  elements:
    '.favorites .subjects'      : 'favorites'
    '.recents .subjects'        : 'recents'
  
  events:
    'click .previous' : 'getPrevious'
    'click .next'     : 'getNext'
  
  
  constructor: ->
    super
    @html @template
    
    # Initialize Counters
    @counters = new Counters({el: @el.find('.stats')})
    @counters.bind 'update', @counters.update
    
    User.on 'change', @onUserChange
    Recent.on 'fetch', @onRecent
    Favorite.on 'fetch', @onFavorite
  
  active: ->
    @el.find('[data-type="sim-freq"]').parent().remove()
    if User.current
      Favorite.fetch()
      Recent.fetch()
    super
  
  onUserChange: (e, user) =>
    
    if user?
      Recent.fetch()
      Favorite.fetch()
      
      @el.find('.user').addClass('show')
      @el.find('.no-user').addClass('hide')
    else
      @el.find('.user').removeClass('show')
      @el.find('.no-user').removeClass('hide')
  
  onRecent: (e, recents) =>
    @recents.removeClass('loading')
    
    height = @recents.height()
    @recents.css('height', height)
    
    params =
      subjects: recents
    @recents.html @subjectTemplate(params)
    @recents.removeAttr("style")
  
  onFavorite: (e, favorites) =>
    @favorites.removeClass('loading')
    
    height = @favorites.height()
    @favorites.css('height', height)
    
    params =
      subjects: favorites
    @favorites.html @subjectTemplate(params)
    @favorites.removeAttr("style")
  
  getPrevious: (e) ->
    type = e.target.dataset.type
    model = type.charAt(0).toUpperCase() + type.slice(1)
    
    @["#{type}Page"] = Math.max(1, @["#{type}Page"] - 1)
    zooniverse.models[model].fetch({page: @["#{type}Page"]})
  
  getNext: (e) ->
    type = e.target.dataset.type
    model = type.charAt(0).toUpperCase() + type.slice(1)
    
    @["#{type}Page"] += 1
    zooniverse.models[model].fetch({page: @["#{type}Page"]})


module.exports = Profile