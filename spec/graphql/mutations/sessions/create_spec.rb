describe "Sessions API endpoint", type: :request do
  it "can create a session" do
    rosa = User.create(name: "Rosa Marcellino", email: "rosa@aol.com", password: "rosaslaw10!")

    query = <<~GQL
      mutation Session{
        sessionCreate(input:{email:"rosa@aol.com", password:"rosaslaw10!"}){
            id
            email
        }
      }
    GQL

    result = UserServiceSchema.execute(query)

    expect(result.dig("data", "sessionCreate", "id")).to be_a String
  end

  it "can create a session" do
    rosa = User.create(name: "Rosa Marcellino", email: "rosa@aol.com", password: "rosaslaw10!")

    query = <<~GQL
      mutation Session{
        sessionCreate(input: {email:"rosa@aol.com", password:"rosaslaw10!"}){
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

  it "returns error message if session not created" do
    rosa = User.create(name: "Rosa Marcellino", email: "rosa@aol.com", password: "rosaslaw10!")

    query = <<~GQL
      mutation Session{
        sessionCreate(input: {email: "rosa@aol.com", password: "wrongpassword"}){
          id
          email
        }
      }
    GQL

    headers = {"CONTENT_TYPE" => "application/json"}

    post graphql_path, params: { query: query }

    session = JSON.parse(response.body, symbolize_names: true)

    expect(session).to have_key(:data)
    expect(session[:data][:sessionCreate]).to eq(nil)

    expect(session).to have_key(:errors)
    expect(session[:errors]).to be_an(Array)

    expect(session[:errors].first).to have_key(:message)
    expect(session[:errors].first[:message]).to eq("Invalid email or password")
  end

  it "raises error if something goes wrong with query" do
    query = <<~GQL
    mutation Session{
      sessionCreate(email: "rosa@aol.com"){
        id
        email
      }
    }
    GQL

    post graphql_path, params: { query: query }

    session = JSON.parse(response.body, symbolize_names: true)

    expect(session).to have_key(:errors)
    expect(session[:errors]).to be_an(Array)

    expect(session[:errors].first).to have_key(:message)
    expect(session[:errors].first[:message]).to be_a(String)

    expect(session[:errors].first).to have_key(:locations)
    expect(session[:errors].first[:locations]).to be_an(Array)

    expect(session[:errors].first).to have_key(:path)
    expect(session[:errors].first[:path]).to be_an(Array)
    
    expect(session[:errors].first).to have_key(:extensions)
    expect(session[:errors].first[:extensions]).to be_a(Hash)
  end
end