@eSKPR_Register_Web
Feature: Test UI Automation
Background:
* def authToken = eSKPR_Registration.mliDirectURL

* configure driver = {type: 'chrome'}
* def eSKPR_Registration = call read('AuthenticationTokenAPISquad.feature')

	Scenario: Ui Automation
	Given driver mliDirectURL
	#* fullscreen()
	* delay(3000)
	* delay(4000)
	And input('input[name='credentialNo]', '0486974065')
	* delay(4000)