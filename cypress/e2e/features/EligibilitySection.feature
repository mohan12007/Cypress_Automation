Feature: Eligibility Form Tests 

    Background: To authenticate and navigate to landing page
        Given user authenticates and navigates to landing Page

    # TC-01
    Scenario: Verify if eligibility section contains 5 questions in eligibility form
        Given user logs in with "acceptor" role
        Then user should view the dashboard page
        When user clicks on "Get new grant" link
        Then user should navigate to grant selection wizard
        When user selects "IT" option for the sector
        And user selects "Bring my business overseas" option for grant type
        And user selects "Market Readiness Assistance" option for grant reason
        Then user should view "Apply" button to be enabled
        When user clicks on Apply button to apply grant
        Then user should view draft application form
        When user clicks on Proceed button of draft application form
        Then user should navigate to eligibility form questions
        And user should view the questions in the eligibility form
            |question|
            |Is the applicant registered in Singapore?|
            |Is the applicant's group sales turnover less than or equal to S$100m or is the applicant's group employment size less than or equal to 200?|
            |Does the applicant have at least 30% |
            |that you are applying for a new market? A market is new if your company's revenue from there has not exceeded $100,000 for any of the last 3 years.|
            |the following statements true for this project?|


    # TC-02
    Scenario: Verify if eligibility section has yes or no options for 5 questions in eligibility form
        Given user logs in with "acceptor" role
        Then user should view the dashboard page
        When user clicks on "Get new grant" link
        Then user should navigate to grant selection wizard
        When user selects "IT" option for the sector
        And user selects "Bring my business overseas" option for grant type
        And user selects "Market Readiness Assistance" option for grant reason
        Then user should view "Apply" button to be enabled
        When user clicks on Apply button to apply grant
        Then user should view draft application form
        When user clicks on Proceed button of draft application form
        Then user should navigate to eligibility form questions
        And user should view Yes and No options for each question

    # TC-03
    Scenario: Verify if warning message is displayed when user selects No option for questions in eligibility form
        Given user logs in with "acceptor" role
        Then user should view the dashboard page
        When user clicks on "Get new grant" link
        Then user should navigate to grant selection wizard
        When user selects "IT" option for the sector
        And user selects "Bring my business overseas" option for grant type
        And user selects "Market Readiness Assistance" option for grant reason
        Then user should view "Apply" button to be enabled
        When user clicks on Apply button to apply grant
        Then user should view draft application form
        When user clicks on Proceed button of draft application form
        Then user should navigate to eligibility form questions
        When user selects "No" option for "Is the applicant registered in Singapore?" in eligibility form
        Then user should view the warning prompt below the question

    # TC-04
    Scenario: Verify if clicking on FAQ link in warning message of eligibility form navigates user to grant FAQ page
        Given user logs in with "acceptor" role
        Then user should view the dashboard page
        When user clicks on "Get new grant" link
        Then user should navigate to grant selection wizard
        When user selects "IT" option for the sector
        And user selects "Bring my business overseas" option for grant type
        And user selects "Market Readiness Assistance" option for grant reason
        Then user should view "Apply" button to be enabled
        When user clicks on Apply button to apply grant
        Then user should view draft application form
        When user clicks on Proceed button of draft application form
        Then user should navigate to eligibility form questions
        When user selects "No" option for "Is the applicant registered in Singapore?" in eligibility form
        Then user should view the warning prompt below the question   
        When user clicks on FAQ link in warning prompt
        Then user should be navigated to go business portal

    # TC-05
    Scenario: Verify if input values are submitted when user  clicks on save button in eligibility form
        Given user logs in with "acceptor" role
        Then user should view the dashboard page
        When user clicks on "Get new grant" link
        Then user should navigate to grant selection wizard
        When user selects "IT" option for the sector
        And user selects "Bring my business overseas" option for grant type
        And user selects "Market Readiness Assistance" option for grant reason
        Then user should view "Apply" button to be enabled
        When user clicks on Apply button to apply grant
        Then user should view draft application form
        When user clicks on Proceed button of draft application form
        Then user should navigate to eligibility form questions
        When user selects "No" option for "Is the applicant registered in Singapore?" in eligibility form
        And user selects "Yes" option for "Is the applicant's group sales turnover less than or equal to S$100m " in eligibility form
        And user selects "No" option for "Does the applicant have at least 30%" in eligibility form
        And user selects "Yes" option for "that you are applying for a new market? " in eligibility form
        And user selects "Yes" option for "the following statements true for this project?" in eligibility form
        When user clicks on "Save" button in eligibility form
        And user refreshes the business grant portal
        Then user should view the selected options in eligibility options to be intact
            |question|
            |Is the applicant registered in Singapore?|
            |Is the applicant's group sales turnover less than or equal to S$100m or is the applicant's group employment size less than or equal to 200?|
            |Does the applicant have at least 30% |
            |that you are applying for a new market? A market is new if your company's revenue from there has not exceeded $100,000 for any of the last 3 years.|
            |the following statements true for this project?| 

    # TC-06
    Scenario: Verify user is not navigated to draft application form page when there is API failure for grants service
        Given user logs in with "acceptor" role
        Then user should view the dashboard page
        When user clicks on "Get new grant" link
        Then user should navigate to grant selection wizard
        When user selects "IT" option for the sector
        And user selects "Bring my business overseas" option for grant type
        And user selects "Market Readiness Assistance" option for grant reason
        Then user intercepts and stubs error response in the grants service in backend
        When user clicks on Apply button to apply grant
        And user waits for grants service error response
        Then user should not view draft application form
        

    # TC-07
    Scenario: Verify user is able to view error info bar in eligibility screen when stubbed with invalid response for errors service
        Given user logs in with "acceptor" role
        Then user should view the dashboard page
        When user clicks on "Get new grant" link
        Then user should navigate to grant selection wizard
        When user selects "IT" option for the sector
        And user selects "Bring my business overseas" option for grant type
        And user selects "Market Readiness Assistance" option for grant reason
        When user intercepts the grants service in backend
        And user clicks on Apply button to apply grant
        Then user fetches grant id from grants service response
        And user should view draft application form
        When user intercepts the errors service and stubs invalid response in backend for "company errors"
        When user clicks on Proceed button of draft application form
        And user waits for errors service response
        Then user should navigate to eligibility form questions
        And user should view the infobar with error message for "companyProfile"

    # TC-08
    Scenario: Verify user is able to view error info bar in eligibility screen when stubbed with invalid response for errors service
        Given user logs in with "acceptor" role
        Then user should view the dashboard page
        When user clicks on "Get new grant" link
        Then user should navigate to grant selection wizard
        When user selects "IT" option for the sector
        And user selects "Bring my business overseas" option for grant type
        And user selects "Market Readiness Assistance" option for grant reason
        When user intercepts the grants service in backend
        And user clicks on Apply button to apply grant
        Then user fetches grant id from grants service response
        And user should view draft application form
        When user intercepts the errors service and stubs invalid response in backend for "fy outdated"
        When user clicks on Proceed button of draft application form
        And user waits for errors service response
        Then user should navigate to eligibility form questions
        And user should view the infobar with error message for "financialInfo"    



