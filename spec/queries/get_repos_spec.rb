require 'rails_helper'

describe GraphQL, '#github_repos' do
  subject { MyProjectSchema.execute(query, variables: variables) }

  let(:query) do
    %(
      query userInfo($username: String!){
        githubRepos(username: $username)
      }
    )
  end

  let(:variables) do
    { username: username }
  end

  let(:username) { 'dhh' }
  let(:repos_github_response) do
    [
      {
        "id": 81754,
        "node_id": "MDEwOlJlcG9zaXRvcnk4MTc1NA==",
        "name": "asset-hosting-with-minimum-ssl",
        "full_name": "dhh/asset-hosting-with-minimum-ssl",
        "private": false
      },
      {
        "id": 79943,
        "node_id": "MDEwOlJlcG9zaXRvcnk3OTk0Mw==",
        "name": "conductor",
        "full_name": "dhh/conductor",
        "private": false
      },
      {
        "id": 147432708,
        "node_id": "MDEwOlJlcG9zaXRvcnkxNDc0MzI3MDg=",
        "name": "textmate-rails-bundle",
        "full_name": "dhh/textmate-rails-bundle",
        "private": false,
      }
  ]
  end

  before do
    stub_request(:get, "http://api.github.com/users/#{username}/repos").to_return(
      status: 200,
      body: repos_github_response.to_json,
      headers: {}
    )
  end

  it 'returns success data' do
    expect(subject['data']['githubRepos']).to eql(repos_github_response.map { |repo| repo[:name] })
  end
end
