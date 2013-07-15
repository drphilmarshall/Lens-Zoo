
Subject = require 'zooniverse/models/subject'

module.exports =
  main:
    new Subject
      id: '5183f151e4bb2102190033b1'
      location:
        # standard: 'http://spacewarps.org/subjects/standard/5183f151e4bb2102190033b1.png'
        standard: 'images/tutorial/tutorial-1.png'
      project_id: '5101a1341a320ea77f000001'
      workflow_ids: ['5101a1361a320ea77f000002']
      metadata:
        training: [
          type: 'lensed galaxy'
        ]
        id: 'CFHTLS_083_0111'
      tutorial: true
      zooniverse_id: 'ASW0000a7l'
  simulated:
    new Subject
      id: '5183f151e4bb210219003bb1'
      location:
        # standard: 'http://spacewarps.org/subjects/standard/5183f151e4bb210219003bb1.png'
        standard: 'images/tutorial/tutorial-2.png'
      project_id: '5101a1341a320ea77f000001'
      workflow_ids: ['5101a1361a320ea77f000002']
      metadata:
        training: [
          type: 'lensed galaxy'
          x: 61.010010
          y: 319.750000
        ]
        id: 'CFHTLS_085_0136'
      tutorial: true
      zooniverse_id: 'ASW0000bsh'
  empty:
    new Subject
      id: '5183f151e4bb210219004e43'
      location:
        # standard: 'http://spacewarps.org/subjects/standard/5183f151e4bb210219004e43.png'
        standard: 'images/tutorial/tutorial-3.png'
      project_id: '5101a1341a320ea77f000001'
      workflow_ids: ['5101a1361a320ea77f000002']
      metadata:
        training: [
          type: 'empty'
        ]
        id: 'CFHTLS_171_0493'
      tutorial: true
      zooniverse_id: 'ASW0000fgj'
    