Feature: Ajout d'un produit dans le panier

    Background:
        # Login une seule fois pour toute la feature
        * def creds = { email: '#(email)', password: '#(password)' }
        * def auth = callonce read('classpath:examples/login/login.feature') creds
        * def token = auth.token
        * url baseUrl
        * def produit =
        """
        {
            "product_id": 886,
            "quantity": 2
        }
        """
    @product
    Scenario: Un client connecté ajoute un produit
        Given path 'cart'
        And header Authorization = 'Bearer ' + token
        And request produit
        When method post
        Then status 201
        And assert responseTime < 5000

        #   Faire une commande
        Given path 'orders'
        And header Authorization = 'Bearer ' + token
        When method post
        Then status 201
        And match response.order.status == "en_attente"

        #   Pour recupérer l'identifiant de la commande
        * def orderId = response.order.id
        # Effectuer le paiement
        Given path 'orders', orderId, 'pay'
        And header Authorization = 'Bearer ' + token
        And request { payment_method: 'pm_card_visa' }
        When method post
        Then status 200
        And match response.order_status == "payee"