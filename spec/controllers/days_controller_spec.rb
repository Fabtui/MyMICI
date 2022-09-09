# require 'rails_helper'

# RSpec.describe DaysController, type: :controller do
#   describe 'Day #create' do
#     context 'invalid params' do
#       it 'should return an error' do
#         u = User.create!(email: 'test3@mail.com', password: 'azerty', sex: 'male', weight: 10)
#         d = Day.create(date: Time.now, user_id: u.id)
#         post :create, params: {day_id: d.id, format: 'test'}
#         expect(response).to have_http_status(401)
#       end
#     end

#     context 'valid params' do
#       it 'should return an error' do
#         u = User.create!(email: 'test3@mail.com', password: 'azerty', sex: 'male', weight: 10)
#         d = Day.create(date: Time.now, user_id: u.id)
#         post :create, params: {day_id: d.id, format: '2020-08-01'}
#         byebug
#         expect(response).to have_http_status(200)
#       end
#     end
#   end

#    describe 'Day #show' do
#     context 'request show action with valid id' do
#       it 'should get the show' do
#         u = User.create!(email: 'test3@mail.com', password: 'azerty', sex: 'male', weight: 10)
#         d = Day.create(date: Time.now, user_id: u.id)
#         get :show, params: {id: d.id}
#         expect(response).to have_http_status(302)
#       end
#     end

#     context 'request show action with invalid id' do
#       it 'should not get the show' do
#         get :show, params: {id: 123545664}
#         expect(response).to have_http_status(422)
#       end
#     end
#   end

# end
