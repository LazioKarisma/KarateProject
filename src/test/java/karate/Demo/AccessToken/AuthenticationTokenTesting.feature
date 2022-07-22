Feature: API Authentication 


Background: 
	* url 'https://reqres.in/api/register'

Scenario: Authentication Test 
	* def params =
	"""
	 {
    "email": "eve.holt@reqres.in",
    "password": "pistol"
		}
	"""
	#When path "oauth2/token" 
	And form field grant_type = 'client_credentials' 
	And form fields params 
	When method POST
	Then status 200 
	Then print "response---",response 
	* def accesToken = response.token 
	Then print "token---", accesToken 
	#	When path 'register'
	#	And header Authorization = 'Bearer ' + accesToken