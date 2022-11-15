import {Given,When,Then} from "@badeball/cypress-cucumber-preprocessor";
import {HomePage} from "../pages/HomePage.js";
const homePage= new HomePage()

Given("user authenticates and navigates to landing Page",()=>{
    // cy.preLoginAuthentication(Cypress.env('authUname'),Cypress.env('authPwd'));
    cy.visit("/");
    homePage.getLoginBtn().should('be.visible');
    
})