class Views::Layouts::Application < Views::Base
  def content
    html do
      head do
        title "Sherlock"
        stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true
        javascript_include_tag 'application', 'data-turbolinks-track' => true
        csrf_meta_tags
      end

      flash.each do |name, msg|
        div msg, class: "flash #{name}"
      end

      yield
    end
  end
end
