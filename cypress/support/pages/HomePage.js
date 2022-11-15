 export class HomePage{

    // Element locators
    getLoginBtn(){ return cy.get('#login-button'); }

    // page utility methods
    LoginButtonClick(){
        this.getLoginBtn().click()
    }

}
