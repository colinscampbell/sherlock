require 'rails_helper'

describe UsersController do
  let(:user) {create(:user)}
  let(:authenticate) {controller.instance_variable_set(:@current_user, user)}

  let(:valid_attributes) {{
    login: "new_login",
    email: "new_email@example.com",
    password: "test_password",
  }}

  let(:invalid_attributes) {{
    bad_field: "bad stuff"
  }}


  describe "GET index" do
    context 'unauthenticated' do
      before :each do
        get :index
      end

      it {expect(response).to redirect_to(new_user_url)}
    end

    context 'authenticated' do
      before :each do
        authenticate
        get :index
      end

      it {expect(response).to be_success}
    end
  end

  describe "GET show" do
    it "should raise without user" do
      expect{get :show, {id: 1}}.to raise_error
    end

    context 'with user' do
      before :each do
        get :show, {id: user.id}
      end

      it {expect(response).to be_success}
      it {expect(assigns(:user)).to eq(user)}
    end
  end

  describe "GET new" do
    before :each do
      get :new
    end

    it {expect(response).to be_success}
  end

  describe "GET edit" do
    it "should raise without user" do
      expect{get :edit, {id: 1}}.to raise_error
    end

    context 'with user' do
      context 'unauthenticated' do
        before :each do
          get :edit, {id: user.id}
        end

        it {expect(response).not_to be_success}
        it {expect(response.status).to eq(401)}
      end

      context 'authenticated' do
        before :each do
          authenticate
          get :edit, {id: user.id}
        end

        it {expect(response).to be_success}
        it {expect(assigns(:user)).to eq(user)}
      end
    end
  end

  describe "POST create" do
    context 'valid params' do
      before :each do
        post :create, {user: valid_attributes}
      end

      it {expect(User.count).to be(1)}
      it {expect(response).to redirect_to(User.first)}
    end

    context 'invalid params' do
      before :each do
        post :create, {user: invalid_attributes}
      end

      it {expect(User.count).to be(0)}
      it {expect(response).to redirect_to(new_user_url)}
    end
  end

  describe "PUT update" do
    it "should raise without user" do
      expect{put :update, {id: 1}}.to raise_error
    end

    context 'unauthenticated' do
      before :each do
        put :update, {id: user.id, user: valid_attributes}
      end

      it {expect(response).not_to be_success}
      it {expect(response.status).to eq(401)}
    end

    context 'authenticated' do
      before :each do
        authenticate
      end

      context 'valid params' do
        before :each do
          put :update, {id: user.id, user: valid_attributes}
        end

        it {expect(response).to redirect_to(user)}

        subject(:my_user) {User.find(user.id)}
        it {expect(my_user.login).to eq("new_login")}
        it {expect(my_user.email).to eq("new_email@example.com")}
        it {expect(my_user.password).to eq("test_password")}
        it {expect(my_user.fname).to eq("first")}
        it {expect(my_user.lname).to eq("last")}
      end

      context 'invalid params' do
        before :each do
          put :update, {id: user.id, user: invalid_attributes}
        end

        subject(:my_user) {User.find(user.id)}
        it {expect(my_user.login).to eq("test")}
        it {expect(my_user.email).to eq("test@example.com")}
        it {expect(my_user.fname).to eq("first")}
        it {expect(my_user.lname).to eq("last")}
        it {expect(my_user.password).to eq("password")}
      end
    end
  end

  describe "DELETE destroy" do
    it "should raise without user" do
      expect{delete :destroy, {id: 1}}.to raise_error
    end

    context 'unauthenticated' do
      before :each do
        delete :destroy, {id: user.id}
      end

      it {expect(response).not_to be_success}
      it {expect(response.status).to eq(401)}
    end

    context 'authenticated' do
      before :each do
        authenticate
        delete :destroy, {id: user.id}
      end

      it {expect(response).to redirect_to(users_url)}
      it {expect(User.count).to be(0)}
    end
  end
end
