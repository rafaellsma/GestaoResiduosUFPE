Feature: Create sediments on system

  Scenario: Users without login try to create sediment
    Given I'm not logged in
    When I go to create sediments page
    Then I see a message "Você precisa fazer login ou se registrar, antes de continuar."

  Scenario: Users logged in try to create sediment
      Given I'm logged in as user
      When I go to create sediments page
      And I fill "sediment_composition" with "composicao"
      And I fill "sediment_weight" with 234
      And I fill "sediment_local" with "local"
      And I select "sediment_data_created_1i" with "1" option
      And I select "sediment_data_created_2i" with "1" option
      And I select "sediment_data_created_3i" with "1" option
      And I click "Criar Sediment"
      Then I can see message "Sediment was successfully created."
