# Cypress_Automation


### Test automation framework
- This is a NodeJS based Cypress Cucumber framework
- package.json has all dependencies and cypress.config.js has cucumber and build configuration 
(base url, browser etc..)

The following folder `cypress` contains the following :

- `e2e/features` - consists of feature file with tests authored in gherkin format
- `support/pages` - contains the page element locators and functions related to page
- `support/stepDefintions` - contains the respective step definitions of feature files

- `cypress-json-formatter.exe` is used to convert cucumber messages of the test execution results to json

The following folder `./utils` contains the following:

`reportGenerator.js` - This contains script to generate html report by using cucumber results json


### Test Execution


- Open cypress test runner with command `npx cypress open` and select browser type and feature file to execute the tests
   
- Alternatively, execute via CLI by passing npx build command `npx cypress run` to trigger all the feature files

- Upon completion of test execution, a json is generated in the folder `cypress/cucumber-json` with
  title `cucumber-results.json` 

- Finally, pass the command `node utils/reportGenerator` to generate cucumber html report of test execution placed in `reports/index.html`


