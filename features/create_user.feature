Feature: Create users

  Scenario: Create user with success
    Given Dont exist created users
    When I go to sign up page
    And I fill "name" with "Rafael"
    And I fill "email" with "test@test.com"
    And I fill "password" with "test123"
    And I fill "password_confirmation" with "test123"
    And I fill "phone_ext" with 23
    And I fill "laboratory_id" with 1
    And I submit form
    Then System has one user created
    And User with email "test@test.com", name "Rafael", phone_ext 23, password "test123" and laboratory "1" was created
    And User with email "test@test.com" isnt approved
    And I can see a message "Seu cadastro foi feito com sucesso. Espere autorização do administrador"
