

module.exports =
  
  # Authentication appended to header
  setAuthentication: (user) ->
    auth = base64.encode("#{user.name}:#{user.api_key}")
    headers = {}
    headers['Authorization'] = "Basic #{auth}"
    
    return headers
  
  # Create a Talk collection unless it exists
  setTalkCollections: (user, titles, descriptions) ->
    
    # Get a list of Talk collections owned by user
    $.ajax({
      url: "#{@constructor.host}/projects/spacewarp/talk/users/collection_list",
      dataType: 'json',
      headers: @setAuthentication(user),
      success: (collections, status, response) =>
        
        # Loop over the collection titles requested
        for title, index in titles
          
          # Make sure the collection doesn't already exist
          for collection in collections
            if collection.title is title
              @talkIds[title] = collection.zooniverse_id
              break
          
          if @talkIds[title]?
            continue
          
          $.ajax({
            url: "#{@constructor.host}/projects/spacewarp/talk/collections",
            type: 'POST',
            data: {subject_id: 'ASW0000a7l', title: titles[index], description: descriptions[index]},
            headers: @setAuthentication(user),
            success: (collection, status, response) =>
              @talkIds[title] = collection.zooniverse_id
          })
    })
  
  # Add subject to Talk collection
  addToTalkCollection: (user, collectionId, subjectId) ->
    
    if collectionId?
      $.ajax({
        url: "#{@constructor.host}/projects/spacewarp/talk/collections/#{collectionId}/add_subject",
        type: 'POST',
        data: {subject_id: subjectId},
        headers: @setAuthentication(user),
      })
