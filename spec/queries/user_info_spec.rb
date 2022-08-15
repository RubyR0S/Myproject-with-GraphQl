require 'rails_helper'

describe GraphQL, '#github_full_name' do
  subject { MyProjectSchema.execute(query, variables: variables) }

  let(:query) do
    %(
      query userInfo($username: String!){
        githubFullName(username: $username)
      }
    )
  end

  let(:variables) do
    { username: username }
  end

  let(:username) { 'dhh' }
  let(:user_github_response) do
    {
      "login": "dhh",
      "id": 2741,
      "node_id": "MDQ6VXNlcjI3NDE=",
      "avatar_url": "https://avatars.githubusercontent.com/u/2741?v=4",
      "gravatar_id": "",
      "type": "User",
      "site_admin": false,
      "name": "David Heinemeier Hansson",
      "company": "Basecamp",
      "blog": "https://dhh.dk",
      "public_repos": 3,
      "public_gists": 51,
      "followers": 16906,
      "following": 0,
    }
  end

  before do
    stub_request(:get, "http://api.github.com/users/#{username}").to_return(
      status: 200,
      body: user_github_response.to_json,
      headers: {}
    )
  end

  it 'returns success data' do
    expect(subject.to_h['data']['githubFullName']).to eql(user_github_response[:name])
  end
end
