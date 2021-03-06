require 'spec_helper'


describe MessagesController do
  include Devise::TestHelpers

  before(:each) do
    @user = User.create({email: 'email@email.com', password: 'password'});
    @valid_message = {text: 'Message text', user_id: @user.id}
    @invalid_message = {text: '', user_id: @user.id}
  end

  def signin 
    sign_in @user
  end

  describe "POST 'create'" do

    it 'user should be logged in' do
      post :create, {:message => @valid_message}
      flash[:alert].should_not be_nil
      response.should redirect_to user_session_path 
    end

    context 'with valid message' do
      it "should create new message" do
        signin
        expect {
          post :create, {:message => @valid_message}
        }.to change(Message, :count).by(1)
      end
      it "should redirect to show and show success message" do
        signin
        post :create, {:message => @valid_message}
        flash[:notice].should_not be_nil
        response.should redirect_to root_path
      end
    end

    context 'with not valid message' do
      it "should not create new message" do
        signin
        expect {
          post :create, {:message => @invalid_message}
        }.to_not change(Message, :count)
      end
      it "should re-render show method" do
        signin
        post :create, {:message => @invalid_message}
        flash[:alert].should_not be_nil
        expect(response).to redirect_to root_path
      end
    end
  end

end
