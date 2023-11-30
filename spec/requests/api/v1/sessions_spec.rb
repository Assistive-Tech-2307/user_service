require "rails_helper"


describe "Sessions API endpoint", type: :request do
  it "can create a session" do
    rosa = User.create(name: "Rosa Marcellino", email: "rosa@aol.com", password: "rosaslaw10!")

    login_params = {
                    email: "rosa@aol.com",
                    password: "rosaslaw10!"
                  }
    headers = {"CONTENT_TYPE" => "application/json"}

    post api_v1_sessions_path, headers: headers, params: JSON.generate(login_params)

    expect(response).to be_successful

    session = JSON.parse(response.body, symbolize_names: true)

    expect(session[:id]).to be_a Integer
  end

  it "cannot create a session with a bad password" do
    rosa = User.create(name: "Rosa Marcellino", email: "rosa@aol.com", password: "badpassword")

    login_params = {
                    email: "rosa@aol.com",
                    password: "rosaslaw10!"
                  }
    headers = {"CONTENT_TYPE" => "application/json"}

    post api_v1_sessions_path, headers: headers, params: JSON.generate(login_params)

    expect(response.status).to eq(401)

    session = JSON.parse(response.body, symbolize_names: true)

    expect(session[:id]).to eq("bad cred")
  end
end