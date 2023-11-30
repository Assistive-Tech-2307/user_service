require "rails_helper"


describe "Sessions API endpoint", type: :request do
  it "create a session" do
    rosa = User.new(name: "Rosa Marcellino", email: "rosa@aol.com" password: "rosaslaw10!")

    login_params = {
                    email: "rosa@aol.com",
                    password: "rosaslaw10!"
                  }
    headers = {"CONTENT_TYPE" => "application/json"}

    post api_v1_parties_path, headers: headers, params: JSON.generate(login: login_params)

    post api_v1_sessions_path

    expect(response).to be_successful

    session = JSON.parse(response.body, symbolize_names: true)

    expect(session[:data]).to eq("blah")

    end
  end
end