Feature: eSKPR Scenario

Background:
* url "https://api.emmuat.asia.manulife.com/ext/idn-bff-service/v1/eskpr/account-authorization"
* def myFeature = call read('AuthenticationTokenAPISquad.feature')
* def authToken = myFeature.accesToken
* def expectedOutput = read('file:src/test/resources/eSKPR/responseInvalidPolNum.json');
* def requestRegistration = read('file:src/test/resources/eSKPR/requestRegistration.json');
* configure ssl = false
* configure driver = {type: 'chrome'}
	

@eSKPR_Register_External
Scenario Outline: eSKPR Register
	Given path '/registration'
	And header Authorization = "Bearer " + authToken
	#And request requestRegistration
	And request {amount: <amount>, customerIdMerchant: <customerIdMerchant>, customerName: <customerName>, debitType: <debitType>,merchantLogoUrl: <merchantLogoUrl>, productId: <productId>,sourceId: <sourceId> }
	When method POST 
	Then status 200
	And print response
	* def url_response = response.mli_URL_redirect
	And print 'ekspr BCA--',url_response
	And driver url_response
	* maximize()
	And waitFor("input[name=credentialNo]")
    And input("input[name=credentialNo]", "0486974065")
    * screenshot()
	And waitFor('select[name=phoneId]')
	And select('select[name=phoneId]', 'E038C1E945DE37BEE05400144FFAF730')
	* screenshot()
	* delay(3000)
	#* click('button[type=submit]')
Examples:
|read('file:src/test/resources/eSKPR/requestRegistration.json')|

@eSKPR_Register_Internal
Scenario Outline: eSKPR Register
	Given path '/registration'
	And request { customerIdMerchant: <customerIdMerchant>, customerName: <customerName>, debitType: <debitType>,merchantLogoUrl: <merchantLogoUrl>, productId: <productId>,sourceId :<sourceId> }
	#And request requestRegistrequestRegistration.jsonration
	When method POST 
	Then status 200
	And print response
	* def mliDirectURL = response.mli_URL_redirect
	And print 'mliDirectURL--',mliDirectURL
	And driver mliDirectURL
	* maximize()
	And waitFor("input[name=credentialNo]")
    And input("input[name=credentialNo]", "0486974065")
    * screenshot()
	And waitFor('select[name=phoneId]')
	And select('select[name=phoneId]', 'E038C1E945DE37BEE05400144FFAF730')
Examples:
|read('file:src/test/resources/eSKPR/requestRegistration.json')|



#@eSKPR_Inquiry_External
#Scenario Outline: eSKPR Inquiry
#	Given path 'inquiry/<sourceId>/<productId>/<customerIdMerchant>'
#	And header Authorization = "Bearer " + authToken
#	And param page = 2 
#	When method GET
#	Then status 200
#	Then print 'actual response---', response
##	And match response == expectedOutput 
##	Then print 'expected response---', expectedOutput
#Examples: 
#|sourceId|productId|customerIdMerchant|
#|MIINFO	 |UL	   |4298348064        |
#|MIINFO	 |UL	   |4298358104		  |
