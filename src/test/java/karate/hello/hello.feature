Feature: Hello World

Background:
Given url baseUrl
Given path '/'

Scenario: Hello world

When method GET
Then status 200
And match $ == "Hello world!, you are probably looking for /api/v1/products"

Scenario: Hello with a param

Given param name = 'Nicolas'
When method GET
Then status 200
And match $ == "Hello Nicolas!, you are probably looking for /api/v1/products"