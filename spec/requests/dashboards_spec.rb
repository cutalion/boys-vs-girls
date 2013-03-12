require 'spec_helper'

describe "Dashboards" do
  describe "GET /dashboards" do
    it "works! (now write some real specs)" do
      get root_path
      response.status.should be(200)
    end
  end

  describe "post a message", type: :feature do
    it "should add new message" do
      signin
      visit "/"
      fill_in "Text", with: "2000"
      click_button "Save"
      page.should have_content "Message was successfully created"
      Message.last.text.should == "2000"
    end
  end

  def signin
    User.create! email: "email@example.com", password: "password", password_confirmation: "password"
    visit new_user_session_path
    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
  end
end
