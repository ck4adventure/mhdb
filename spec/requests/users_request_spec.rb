require 'rails_helper'

RSpec.describe "Users Requests", type: :request do
  it 'creates a new User and redirects to the show page' do
    get "/users/new"
    expect(response).to render_template(:new)

    post "/users", :params => { :user => { name:"Testy", email: "testy@test.com" } }
    expect(response).to redirect_to user_path(assigns(:user))
    follow_redirect!

    expect(response).to render_template(:show)

  end

  it 'edits an existing User and redirects to the show page' do
    realname_larry = User.create!(name: "Curly", email: "larry@test.com")
    get edit_user_path(realname_larry)
    expect(response).to render_template(:edit)

    patch user_path(realname_larry.id), :params => { :user => { name:"Larry", email: "larry@test.com" } }
    expect(response).to redirect_to user_path(realname_larry.id)
  end

  it 'destroys an existing User and redirects to the index page' do
    testy = User.create!(name: "testy", email: "testy@test.com")
    delete user_path(testy)
    expect(response).to redirect_to root_path
  end
end
