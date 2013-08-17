require 'lib/setup'

{Stack} = require 'spine/lib/manager'
Route   = require 'spine/lib/route'

HomePage    = require 'controllers/home_page'
AboutPage   = require 'controllers/about_page'
GuidePage   = require 'controllers/guide_page'
Classifier  = require 'controllers/classifier'
Profile     = require 'controllers/profile'
FAQPage     = require 'controllers/faq_page'

Counter     = require 'models/counter'

Api       = require 'zooniverse/lib/api'
Analytics = require 'zooniverse/lib/google-analytics'
TopBar    = require 'zooniverse/controllers/top-bar'
User      = require 'zooniverse/models/user'
Recent    = require 'zooniverse/models/recent'

LanguagePicker = require 'controllers/language_picker'

# Initialize Counter model
new Counter({classified: 0, potentials: 0, favorites: 0}).save()
  
# Navigation
$('body').append require 'views/navigation'

languagePicker = new LanguagePicker
languagePicker.el.prependTo document.body

# Setup the stack
stack = new Stack
  el: $('.main')
  
  controllers:
    home: HomePage
    classify: Classifier
    about: AboutPage
    guide: GuidePage
    profile: Profile
    faq: FAQPage
  
  routes:
    '/home'       : 'home'
    '/classify'   : 'classify'
    '/about'      : 'about'
    '/guide'      : 'guide'
    '/profile'    : 'profile'
    '/faq'        : 'faq'
  
  default: 'home'


if window.location.origin is 'http://0.0.0.0:9294'
  # Configure connection to Api
  api = new Api
    project: 'spacewarp'
    host: "https://dev.zooniverse.org"
    # host: "http://0.0.0.0:3000"
    path: '/proxy'
else
  new Analytics
    account: "UA-1224199-43"
    
  # Configure connection to Api
  api = new Api
    project: 'spacewarp'
    host: "https://api.zooniverse.org"
    path: '/proxy'

topBar = new TopBar
User.fetch()
topBar.el.appendTo 'body'
stack.el.appendTo 'body'
Route.setup()

# Pass host to Classifier instance
stack.controllers.classify.host = api.proxyFrame.host

# Lazy loading of Guide images
$('img.lazy').lazyload({threshold : 200, effect: 'fadeIn'})


module.exports = {stack, api, topBar}