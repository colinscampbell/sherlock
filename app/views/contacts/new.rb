class Views::Contacts::New < Views::Layouts::Page
  needs :scenario
  needs :contact

  def main
    h1 "Create a contact!"

    form_for [scenario, contact] do |f|
      f.label :name, 'Name'
      f.text_field :name

      f.label :location, 'Select a location'
      f.collection_select :location_id, scenario.universe.locations, :id, :name, blank: true
      br
      br

      f.label :text, 'Text (story)'
      f.text_area :text

      f.submit
    end
  end
end
