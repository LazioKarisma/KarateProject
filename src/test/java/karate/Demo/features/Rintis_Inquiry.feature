Feature: Rintis Scenario

Background:
* url "https://emm-uat-api.ap.manulife.com/int/idn-bff-service/v1/rintis/"
* def requestInquiryRintis = read('file:src/test/resources/eSKPR/requestInquiryRintis.json');
#* configure ssl = false
* header Content-Type = 'text/plain'
* header accept = '*/*'
* header Accept-Encoding = 'gzip, deflate, br'
* header Connection = 'keep-alive'
* header User-Agent = 'PostmanRuntime/7.29.0'


@Rintis Inquiry
Scenario: eSKPR Register
	Given path 'billing'
	And request requestInquiryRintis
	When method POST 
	Then status 200
	And print responseStatus 
	And print response

#@Rintis Inquiry
#Scenario Outline: eSKPR Register
#	Given path '/billing'
#	And request { aid: <aid>, amt: <amt>, bid: <bid>, c: <c>, id: <id>, lang: <lang>, RRN: <RRN>, tid: <tid> }
#	When method POST 
#	Then status 200
#	And print responseStatus 
#	And print response
#Examples:
#|read('file:src/test/resources/eSKPR/requestInquiryRintis.json')|