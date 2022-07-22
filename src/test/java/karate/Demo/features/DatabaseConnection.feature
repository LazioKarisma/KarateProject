Feature: DB Connection Feature 
#jdbc:oracle:thin:@localhost:1521:xe\
#'jdbc:oracle:thin:@10.244.33.58:1521:cassitj4'

Backgorund: 
	* def config = { username: "cas", password: "cassitj4", url: "jdbc:oracle:thin:@10.244.33.58:1521:Cassitj4" , driverClassName: "oracle.jdbc.driver.OracleDriver"}
	* def DbUtils = Java.type('karate.Demo.features.DbUtils')
	* def db = new DbUtils(config)

Scenario: connection to database

* def pol_num = db.readValue("Select * from teskpr_info where pol_num = '4263743967'")
Then print 'pol_num--' ,pol_num
#* match pol_num.CLI_NM == "DataTestSukses"
#where pol_num = '4263743967'