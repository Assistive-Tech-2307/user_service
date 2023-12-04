describe "Sessions API endpoint", type: :request do
  it "can create a session" do
    rosa = User.create(name: "Rosa Marcellino", email: "rosa@aol.com", password: "rosaslaw10!")

    query = <<~GQL
      mutation Session{
        sessionCreate(email:"rosa@aol.com", password:"rosaslaw10!"){
            id
            email
        }
      }
    GQL
    # headers = {"CONTENT_TYPE" => "application/json"}

    result = UserServiceSchema.execute(query)

    expect(result.dig("data", "sessionCreate", "id")).to be_a String
  end

  it "can create a session" do
    rosa = User.create(name: "Rosa Marcellino", email: "rosa@aol.com", password: "rosaslaw10!")

    query = <<~GQL
      mutation Session{
        sessionCreate(email:"rosa@aol.com", password:"rosaslaw10!"){
            id
            email
        }
      }
    GQL
    headers = {"CONTENT_TYPE" => "application/json"}

    post graphql_path, params: { query: query }

    session = JSON.parse(response.body, symbolize_names: true)

    expect(session[:data][:sessionCreate][:id]).to be_a String
  end
end