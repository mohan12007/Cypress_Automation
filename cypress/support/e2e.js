// ***********************************************************
// This example support/e2e.js is processed and
// loaded automatically before your test files.
//
// This is a great place to put global configuration and
// behavior that modifies Cypress.
//
// You can change the location of this file or turn off
// automatically serving support files with the
// 'supportFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/configuration
// ***********************************************************

// Import commands.js using ES2015 syntax:
import './commands'

Cypress.on('uncaught:exception', (err, runnable) => {
    // returning false to prevent Cypress from failing the test due to app side exceptions
    return false
  })

  // hooks with authentication and session storage config

  beforeEach(()=>{
    cy.log("beforeEach hook");
    cy.session(Cypress.env('authUname'),()=>{
      cy.preLoginAuthentication(Cypress.env('authUname'),Cypress.env('authPwd'));  
    })
  })

  afterEach(()=>{
    cy.log("afterEach hook")
    Cypress.session.clearAllSavedSessions()
  })
// Alternatively you can use CommonJS syntax:
// require('./commands')