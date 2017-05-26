Feature: Create users

  Scenario: Create user with success
    Given Dont exist created users
    And Exists one admin
    And Doesnt exist any notifications
    And The Center "Cin" exists
    And The Department "dep" at center "Cin" exists
    And The laboratory "lab 1" at department "dep" exists
    When I go to sign up page
    And I fill "user_name" with "Rafael"
    And I fill "user_email" with "test@test.com"
    And I fill "user_password" with "test123"
    And I fill "user_password_confirmation" with "test123"
    And I fill "user_phone_ext" with 23
    And I select option "1" in "centers"
    And I select option "1" in "departments"
    And I select option "1" in "laboratories"
    And I submit form
    Then I can see a message "Seu cadastro foi feito com sucesso. Espere autorização do administrador"
    And System has 2 user created
    And User with email "test@test.com", name "Rafael", phone_ext 23, password "test123" and laboratory "1" was created
    And User with email "test@test.com" isnt approved
    And User with email "test@test.com" isnt admin
    And Exists 1 notifications

    Scenario: create admin user with success
      Given Exists one admin
      And I go to login page
      And I fill "user_email" with "admin@admin.com"
      And I fill "user_password" with "admin123"
      And I make login
      When I go to register admin page
      And I fill "user_name" with "admin2"
      And I fill "user_email" with "admin2@ufpe.br"
      And I fill "user_password" with "adminpass"
      And I fill "user_phone_ext" with 4242
      And I submit new admin user form
      Then I can see a message "Usuario Admin Criado com sucesso"