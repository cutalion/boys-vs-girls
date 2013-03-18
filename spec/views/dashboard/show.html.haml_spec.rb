require 'spec_helper'

describe "dashboard/show.html.haml" do
  it "dashboard have a message" do
    user = stub_model User
    message = stub_model(Message, :text => "Message text", user: user)
    assign(:messages, [message])
    render
    rendered.should include "Message text"
  end
end
