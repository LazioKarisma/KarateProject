Feature: eSKPR Scenario

Background:
* url "https://api.emmuat.asia.manulife.com/ext/idn-bff-service/v1/eskpr/account-authorization"
* def tokenFeature = call read('AuthenticationTokenAPISquad.feature')
* def authToken = tokenFeature.accesToken
* def requestRegistration = read('file:src/test/resources/eSKPR/requestRegistrationDemo.json');
* configure driver = {type: 'msedge'}
	
Scenario: eSKPR Register
	Given path '/registration'
	And header Authorization = "Bearer " + authToken
	And request requestRegistration
	#And request {amount: <amount>, customerIdMerchant: <customerIdMerchant>, customerName: <customerName>, debitType: <debitType>,merchantLogoUrl: <merchantLogoUrl>, productId: <productId>,sourceId: <sourceId> }
	When method POST 
	Then status 200
	And print response
	* def url_response = response.mli_URL_redirect
	And print 'ekspr BCA--',url_response
	And driver url_response
	* maximize()
	And waitFor("input[name=credentialNo]")
    And input("input[name=credentialNo]", "0486974065")
    * delay(2000)
    * screenshot()
	And waitFor('select[name=phoneId]')
	And select('select[name=phoneId]', 'E038C1E945DE37BEE05400144FFAF730')
	* screenshot()
	* delay(4000)
	And driver "https://outlook.office365.com/mail/"
	* delay(4000)
	* screenshot()
	
	#* click('button[type=submit]')
#Examples:
#|read('file:src/test/resources/eSKPR/requestRegistrationDemo.json')|