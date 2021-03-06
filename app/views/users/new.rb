class Views::Users::New < Views::Layouts::Page
  needs :user

  def main
    h1 "New User"

    form_for user do |f|
      f.label :login, 'User Name'
      f.text_field :login

      f.label :email, 'Email Address'
      f.text_field :email

      f.label :fname, 'First Name'
      f.text_field :fname

      f.label :lname, 'Last Name'
      f.text_field :lname

      f.label :password, 'Password'
      f.password_field :password

      f.submit
    end
  end
end
