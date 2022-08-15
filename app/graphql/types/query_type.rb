module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :github_full_name, String, 'Find github fullname by Username' do
      argument :username, String
    end

    field :github_repos, [String], 'Find repos of given user' do
      argument :username, String
    end

    def github_full_name(username:)
      users_response = HTTParty.get("http://api.github.com/users/#{username}")

      parsed_body = JSON.parse(users_response.body)

      if parsed_body['message'] == 'Not Found'
        'Not Found'
      else
        parsed_body['name']
      end
    end

    def github_repos(username:)
      repos_response = HTTParty.get("http://api.github.com/users/#{username}/repos")
      parsed_body = JSON.parse(repos_response.body)

      return [] if parsed_body.is_a?(Hash) && parsed_body.key?('message')

      parsed_body.map { |repo| repo['name'] }
    end
  end
end
