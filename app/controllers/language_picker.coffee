$ = require 'jqueryify'
translate = require 't7e'
HTML = $(document.body.parentNode)

DEFAULT = '$DEFAULT'
enUS = require 'translations/en_us'

class LanguagePicker
  @DEFAULT = DEFAULT

  languages:
    'English': DEFAULT
    'Español': 'es_cl'
  
  el: null
  className: 'language-picker'

  constructor: ->
    
    preferredLanguage = try location.search.match(/lang=([\$|\w]+)/)[1]
    preferredLanguage ||= localStorage.preferredLanguage
    preferredLanguage ||= DEFAULT
    HTML.attr 'data-language', preferredLanguage
    
    @el = $("<div class='#{@className}'><select></select></div>")
    @select = @el.find 'select'

    for language, code of @languages
      option = $("<option value='#{code}'>#{language}</option>")
      option.attr 'selected', 'selected' if code is preferredLanguage
      @select.append option

    @select.on 'change', => @onChange arguments...
    @select.trigger 'change' unless @select.val() is DEFAULT

  onChange: ->
    preferredLanguage = @select.val()
    HTML.attr 'data-language', preferredLanguage

    localStorage.preferredLanguage = preferredLanguage

    if preferredLanguage is DEFAULT
      translate.load enUS
      translate.refresh()
    else
      $.getJSON("./translations/#{preferredLanguage}.json", (data) ->
        translate.load data
        translate.refresh()
      )

module.exports = LanguagePicker
