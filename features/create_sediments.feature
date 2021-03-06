Feature: Create sediments on system

  Scenario: Users without login try to create sediment
    Given I'm not logged in
    When I go to create sediments page
    Then I see a message "Você precisa fazer login ou se registrar, antes de continuar."

  Scenario: User logged in try to create sediment
      Given I'm logged in as user
      When I go to create sediments page
      And I fill "sediment_composition" with "composicao"
      And I fill "sediment_weight" with 234
      And I select "sediment_recipient_type" with "2" option
      And I select "sediment_res_type" with "2" option
      And I fill "sediment_stock_location" with "Laboratório"
      And I click "Criar Residuo"
      Then I can see message "Residuo foi criado com sucesso."

  Scenario: User logged in try to create sediment without weight
      Given I'm logged in as user
      When I go to create sediments page
      And I fill "sediment_composition" with "composicao"
      And I select "sediment_res_type" with "4" option
      And I click "Criar Residuo"
      Then I can see message "Peso em kg não pode ficar em branco"

  Scenario: User logged in try to create sediment without any fields
      Given I'm logged in as user
      When I go to create sediments page
      And I click "Criar Residuo"
      Then I can see message "Peso em kg não pode ficar em branco"
      And I can see message "Tipo de Resíduo não pode ficar em branco"
      And I can see message "Composição não pode ficar em branco"
      And I can see a message "Tipo de Recipiente não pode ficar em branco"
      And I can see a message "Local de estoque do resíduo não pode ficar em branco"
