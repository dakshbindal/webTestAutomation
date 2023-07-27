#Feature: Test Google Search
#
#  Background:
#    * configure driver = { type: 'chrome' }
#
#
#  Scenario: Search for Karate DSL
#    Given driver 'https://www.winzogames.com/'
#    When method get
#    Then status 200
##    And screenshot()
##    And match response contains 'Karate DSL'

Feature: browser automation 2

  Background:
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }

  Scenario: google search, land on the karate github page, and search for a file

    Given driver 'https://google.com'
    And input('textarea[name=q]', 'karate dsl')
    When click('input[name=btnI]')
    Then waitForUrl('https://github.com/karatelabs/karate')

    When click('{a}Go to file')
    And def searchField = waitFor('input[name=query]')
    Then match driver.url == 'https://github.com/karatelabs/karate/find/master'

    When searchField.input('karate-logo.png')
    And def innerText =

  """function(locator){
  var elements = scriptAll(locator, '_.innerText');
  var results = [];
  for (var i = 0; i < elements.length; i++) {
  results.push(elements[i].trim());
  }
  return results;
  }
  """
    And def searchFunction =
      """
      function() {
        var results = innerText(".tree-browser-result");
        return results.size() == 2 ? results : null;
      }
      """
    And def searchResults = waitUntil(searchFunction)
    Then match searchResults contains 'karate-core/src/main/java/karate-logo.png'
