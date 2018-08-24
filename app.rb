require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require 'macaddr'
require './image_uploader.rb'
require "./models/contribution.rb"

get '/' do
  macaddr = Mac.addr
  puts macaddr
  redirect "/user/#{macaddr}"
end

get '/user/:useraddress' do
  redirect "/user/#{Mac.addr}" if params[:useraddress] != Mac.addr
  @macaddress = Mac.addr
  erb :home
end

get '/user/:useraddress/new_user_contacts' do
  erb :index
end

post '/user/:useraddress/new_user_contacts_register' do
  Contribution.create(
    nameJ: params[:new_contact_name_J],
    nameE: params[:new_contact_name_E],
    detail: params[:new_contact_details],
    email_adress: params[:new_contact_email_adress],
    photo_url: "",
    phone_number: params[:new_contact_phone_number],
    memo: params[:memoarea]
  )
  # if params[:contact_image]
  #   image_upload(:contact_image)
  # end
  # @data = [nameE, nameJ, detail]
  redirect "/user/#{:useraddress}"
end

get '/user/:id_name/check_user_contacts' do
  @list_data = Contribution.order('id desc').all
  erb :check
end