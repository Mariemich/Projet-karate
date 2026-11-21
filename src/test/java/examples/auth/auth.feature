Feature: API sinistre

    Background:
        * url 'https://api.efi-academy.com/user-api/public'

    @TNRA
    Scenario: Liste des produits
        Given path 'products'
        When method get
        Then status 200
        And match response.success == true

    @smoke
    Scenario: produit 889
       Given path 'products', 889
       When method get
       Then status 200
       And match response.success == true
       And match response.product.id == 889
       And match response.product.name == "Webcam HD"
       And match response.product.description == "Webcam 1080p"
       And match response.product.price == 49.9
       And match response.product.stock == 0
       And match response.product.image_url == "https://..."
       And match response.product.created_at == "2026-10-22 08:18:22"
       
    