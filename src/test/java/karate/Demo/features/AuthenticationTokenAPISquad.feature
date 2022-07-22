Feature: API Authentication 

Background: 
	* url 'https://login.microsoftonline.com/5d3e2773-e07f-4432-a630-1a0f68a28a05/oauth2/v2.0/token'

Scenario: Authentication Test 
	And form field grant_type = 'client_credentials' 
	And form field client_id = 'd0a4d6dd-bcf6-415b-a046-0c3c443e842b'
	And form field client_secret = 'wF27Q~Xl6Iz3JiS9Pv6c8R8PxCEaEEyhV.pOa'
	And form field scope = 'api://4a9739a6-47eb-40a4-a292-00da76658995/.default'
	When method POST 
	Then status 200 
	Then print "response---",response 
	* def accesToken = response.access_token
	Then   print "token---", accesToken