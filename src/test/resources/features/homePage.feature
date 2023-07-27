@Homepage
Feature: Check Homepage elements

  Background:
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

    Given driver 'https://stag.winzogames.com/'


    @WebView
    Scenario: verify download app send message success
      * maximize()
      * java.lang.Thread.sleep(2000);
      * def phoneNumber = '8168527930'
      And click("input[type='text']")
      And input("//input[contains(@placeholder,'mobile number')]", phoneNumber)
      And click('{div}Get App Link SMS')
#      And click('
      * java.lang.Thread.sleep(5000);
      * def successText = 'Download link sent on '+ phoneNumber
      * karate.log(successText)
      * def successTextNumber = text("//p[contains(text(), 'Download link sent on')]//span")
      * karate.log(successTextNumber)
      * def successTextNumber = 'Download link sent on '+ successTextNumber
      * karate.log(successTextNumber)
      * match successText == successTextNumber
      And screenshot()

    @MobileView
    Scenario: verify download app send message success mobile view
      * driver.dimensions = { x: 0, y: 0, width: 360, height: 740 }
      * java.lang.Thread.sleep(2000);
      * def anchorTag = locateAll("a[href]")
      And if(anchorTag) click('{^p}DOWNLOAD & GET')
      * java.lang.Thread.sleep(5000);
      * def fileCheck =
      """
      function(){
        var stepDef = Java.type('Utilities.Helper');
        var objStepDef = new stepDef();
        return objStepDef.checkDownloaded();
      }
      """
      * def flag = fileCheck()
      Then karate.log(flag)
