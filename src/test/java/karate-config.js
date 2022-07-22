function fn() {
	var config = {
		name: "Lazio",
		baseURL: "https://reqres.in/api"
	};

	var env = karate.env
	karate.log('The value of env is : ', env);

	if (env == 'ESKPR_UAT_INT') {
		config.baseURL = "https://idn-bff-service-uat-jenkins.apps.eas.pcf.manulife.com/v1/eskpr/account-authorization"
	}
	else if (env == 'ESKPR_UAT_EXT') {
		config.baseURL = "https://api.emmuat.asia.manulife.com/ext/idn-bff-service/v1/eskpr/account-authorization"
	}
	else if (env == 'ESKPR_UAT_DR') {
		config.baseURL = " https://emm-uat-api.ap.manulife.com/int/idn-bff-service/v1/eskpr/account-authorization"
	}
	karate.configure("connectTimeout", 5000);
	karate.configure("readTimeout", 5000);
	return config;
}