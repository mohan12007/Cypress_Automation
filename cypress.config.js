const { defineConfig } = require("cypress");
const createBundler = require("@bahmutov/cypress-esbuild-preprocessor");
const addCucumberPreprocessorPlugin =require("@badeball/cypress-cucumber-preprocessor").addCucumberPreprocessorPlugin;
const createEsbuildPlugin =require("@badeball/cypress-cucumber-preprocessor/esbuild").createEsbuildPlugin;

  // @brain-family cucumber processor
  // const cucumber = require('cypress-cucumber-preprocessor').default

module.exports = defineConfig({
  e2e: {
    async setupNodeEvents(on, config) {
      const bundler = createBundler({
        plugins: [createEsbuildPlugin(config)],
      });

      on("file:preprocessor", bundler);
      await addCucumberPreprocessorPlugin(on, config);

      return config;

    },

    // @brain-family cucumber processor
    // setupNodeEvents(on,config){
    //   on("file:preprocessor",cucumber())
    // },

    waitForAnimations: true,  
    experimentalSessionAndOrigin:true,
    video: false,
    chromeWebSecurity: false,
    defaultCommandTimeout:60000,
    pageLoadTimeout:60000,
    requestTimeout:100000,
    viewportWidth:1366,
    viewportHeight:768,
    screenshotOnRunFailure: true,
    specPattern: "cypress/e2e/features/*.feature",
    baseUrl: "https://qa-abc.xyz.on",
    env:{
      authUname: "temp",
      authPwd: "bgPB3Aw3@lk!"
    }
  },
});