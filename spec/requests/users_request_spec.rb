require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe '#show' do
    it 'retrieves a User object from the database'
    it 'renders the show template'
  end

  describe '#new' do
    it 'creates a blank User object'
    it 'renders the new template'
  end

  describe '#create' do
    it 'creates a User object from the params given'
    
    context 'when valid params are given' do
      it 'renders the show template'
    end
  
    context 'when invalid params are given' do
      it 'renders flash errors'
      it 'returns status code 422'
    end
  end

  describe '#edit' do
    it 'gets the User object by id'
    it 'renders the edit template'
  end

  describe '#update' do
    it 'finds the User object in the db'

    context 'when valid params are given' do
      it 'updates the User object from the params given'
      it 'renders the show template'
    end
  
    context 'when invalid params are given' do
      it 'renders flash errors'
      it 'returns status code 422'
    end
  end

  describe '#destroy' do
    it 'finds the User by id'
    it 'destroys the User object'
    it 'redirects to the root page'
  end

end
