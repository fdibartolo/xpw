Feature: Basic search
  Como usuario quiero poder buscar ofertas de trabajo ingresando texto libre.

  Background:
  	Given I am logged in as job offerer
  	And I access the new offer page
    When I fill the "title" with "Programador Ruby"
    	And I fill the "description" with "Programador Senior"
		And confirm the new offer
		And logout

  Scenario: Matchea en el titulo
    Given I browse the job list
    When I search for "Programador Ruby"
    Then I should see "Programador Ruby"

  Scenario: Matchea en el titulo por una parte
    Given I browse the job list
    When I search for "Ruby"
    Then I should see "Programador Ruby"

  Scenario: No encuentra nada por titulo
    Given I browse the job list
    When I search for "Programador Java"
    Then I should not see "Programador Ruby"

  Scenario: Matchea en la descripcion
    Given I browse the job list
    When I search for "Programador Senior"
    Then I should see "Programador Ruby"

  Scenario: Matchea en la descripcion por una parte
    Given I browse the job list
    When I search for "Senior"
    Then I should see "Programador Ruby"

#  Scenario: Matchea en el titulo por una parte minuscula
#    Given I browse the job list
#    When I search for "ruby"
#    Then I should see "Programador Ruby"

#  Scenario: Matchea en la descripcion por una parte minuscula
#    Given I browse the job list
#    When I search for "senior"
#    Then I should see "Programador Ruby"
