class Views::Scenarios::Show < Views::Layouts::Page
  needs :scenario
  needs :owner

  def main
    h1 "Scenario"

    p do
      div "Universe: #{scenario.universe.name}"
      div "Name: #{scenario.name}"
      div "Description: #{scenario.description}"
    end

    p 'Contacts' do
      scenario.contacts.each do |contact|
        div do
          label "Name: #{contact.name}"
          label "Address: #{contact.location.address}" if contact.location
        end
      end
    end

    if owner
      link_to "Edit Scenario", edit_scenario_path(scenario)
    end
  end
end
