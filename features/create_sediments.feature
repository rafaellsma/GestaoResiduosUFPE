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
      And I select "sediment_res_type" with "2" option
      And I click "Criar Residuo"
      Then I can see message "Residuo foi criado com sucesso."

  Scenario: User logged in try to create sediment without weight
      Given I'm logged in as user
      When I go to create sediments page
      And I fill "sediment_composition" with "composicao"
      And I select "sediment_res_type" with "3" option
      And I click "Criar Residuo"
      Then I can see message "Peso não pode ficar em branco"

  Scenario: User logged in try to create sediment without any fields
      Given I'm logged in as user
      When I go to create sediments page
      And I click "Criar Residuo"
      Then I can see message "Peso não pode ficar em branco"
      Then I can see message "Tipo não pode ficar em branco"
      Then I can see message "Composição não pode ficar em branco"

