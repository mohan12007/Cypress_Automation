const report=require('multiple-cucumber-html-reporter');
// const cucumberJsonPath=require(')
// const reportPath=require('')

report.generate({
    jsonDir: 'cypress/cucumber-json',
    reportPath: './reports',
    pageTitle: "Cypress Test execution report",
    reportName:"Cypress Test execution report",
    openReportInBrowser:true,
    metadata: {
        browser:{
            name: "chrome",
            version: "106"
        },
        device: "Local test machine",
        platform: {
            name: "Windows",
            version: "11"

        }
    }
})