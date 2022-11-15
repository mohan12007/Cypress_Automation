// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })

Cypress.Commands.add('preLoginAuthentication',(uname,pwd)=>{
    cy.visit("/");

    cy.get(".modal-content-mobile").eq(0).within(form=>{
        cy.wrap(form).find("#signInFormUsername").type(uname,{force:true});
        cy.wrap(form).find("#signInFormPassword").type(pwd,{force:true});
        cy.wrap(form).find("input[name='signInSubmitButton']").click({force:true});
    })
    
})