class LastPagesController < ApplicationController

  def user_form
    @username = params[:username]

    users_response = HTTParty.get("http://api.github.com/users/#{@username}")
    parse_body = JSON.parse(users_response.body)


    if parse_body['message'] != 'Not Found'
      @fullname = parse_body['name']

      repos_response = HTTParty.get("http://api.github.com/users/#{@username}/repos")
      @repos = JSON.parse(repos_response.body).map { |repo| repo['name'] }
    end
  end 



  def user_form_async
    @username = params[:username]
   
    users_response = HTTParty.get("http://api.github.com/users/#{@username}")
    parse_body = JSON.parse(users_response.body)

    if parse_body['message'] != 'Not Found'
      @fullname = parse_body['name']

      repos_response = HTTParty.get("http://api.github.com/users/#{@username}/repos")
      @repos = JSON.parse(repos_response.body).map { |repo| repo['name'] }
    end

    render json: { fullname: @fullname, repos: @repos }
  end
end


# Onclick button
# console.log('clicked')
# console.log з текстом що ти ввів
# створюєш ще один роут user_form_async який віддає json
# render json: {name: 'name', repos: [repos]}
# ajax call with parameter username to new action user_form_async
# ajax#success зроби console.log того що отримав
# заповни ці дані на сторінку
