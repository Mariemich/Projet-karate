Feature: Ajout d'un produit dans le panier

    Background:
        # Login une seule fois pour toute la feature
        * def creds = { email: '#(email)', password: '#(password)' }
        * def auth = callonce read('classpath:examples/token/token.feature') creds
        * def token = auth.token
        * url baseUrl
        * def produit =
        """
        {
            "product_id": 889,
            "quantity": 2
        }
        """

    Scenario: Un client connecté ajoute un produit
        Given path '/cart'
        And header Authorization = 'Bearer ' + token
        And request produit
        When method post
        Then status 201
        And match response contains { id: 889, quantity: 2 }
        And match response.id == '#notnull'
        And assert responseTime < 1000
        * def productId = response.id
        * print 'Produit ajouté avec id :', productId
