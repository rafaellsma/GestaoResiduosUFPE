Feature: Generate Report
	
	Scenario: Generate a Report with success by the Admin
		Given I'm logged as admin
		And there are 3 sediments in the system from "CIn" registred in "12/11/2016"
		And there are 2 sediments in the system from "CCEN" registred in "21/11/2016"
		And there are 5 sediments in the system from "CTG" registred in "05/12/2016"
		When I go to the Report's Page
		And I fill the initial date with "11/10/2016"
		And I fill the final date with "20/12/2016"
		Then I generate a report by clicking in "Generate"
