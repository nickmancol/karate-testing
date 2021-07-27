Feature: Verify Products Retrieve, Create > Read > Update > Delete
Background:
    Given url baseUrl
    Given def basePath = '/api/v1/products/'
    Given path basePath

Scenario: Get all products
  When method get
  Then status 200
  Then match response == '#array'

  @debug
  Scenario: Create a New product
    Given request
    """
    {
      "name": "Children's Book",
      "description": "Beautiful illustrated book",
      "price": "15"
    }
    """
    When method POST
    Then status 201
    * def productId = response.id

    #Test GET a single product
    Given path basePath+productId
    When method get
    Then status 200
    Then match response contains {"name": "Children's Book"}
    Then match response.description == 'Beautiful illustrated book'
    Then match response.price != 0

    #Test GET all products with payload structure validation
    Given path basePath
    When method get
    Then status 200
    Then match response == '#array'
    Then match each response[*] ==
    """
        {
        "name": "#string",
        "description": "#string",
        "price": "#number",
        "id": "#number",
        }
    """

    #Test Update a single product
    Given path basePath+productId
    And request
    """
    {
      "name": "Children's Book",
      "description": "Beautiful illustrated book",
      "price": "30"
    }
    """
    When method put
    Then status 202
    Then match response.price == 30

    #Test Delete a single product
    Given path basePath+productId
    When method delete
    Then status 202
