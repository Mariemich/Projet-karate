Feature: Login réutilisable
    Scenario: Récupérer un token
        Given url baseUrl
        And path '/login'
        And request { email: '#(email)', password: '#(password)' }
        When method post
        Then status 200
        And match response.token == '#string'
        * def token = response.token
