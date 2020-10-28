require 'rails_helper'

RSpec.describe "Users Requests", type: :request do
  before(:all) do
    @rank = Rank.create!(title: "Testi me once")
    @rank2 = Rank.create!(title: "Testi me twice")
  end
  it 'creates a new User and redirects to the show page' do
    get "/users/new"
    expect(response).to render_template(:new)
    post "/users", :params => { :user => { username:"Testy", email: "testy@test.com", password: "tester", rank_id: @rank.id } }
    expect(response).to redirect_to user_path(assigns(:user))
    follow_redirect!

    expect(response).to render_template(:show)

  end

  it 'edits an existing User and redirects to the show page' do
    pending
    realname_larry = User.create!(username: "Curly", email: "larry@test.com", rank_id: @rank2.id, password: "curlyme")
    get edit_user_path(realname_larry)
    expect(response).to render_template(:edit)

    patch user_path(realname_larry.id), :params => { :user => { username:"Larry", email: "larry@test.com" } }
    expect(response).to redirect_to user_path(realname_larry.id)
  end

  it 'destroys an existing User and redirects to the index page' do
    pending
    testy = User.new(username: "testy", email: "testy@test.com", password: "muahaha", rank_id: @rank.id)
    testy.save!
    delete user_path(testy)
    expect(response).to redirect_to root_path
  end
end
