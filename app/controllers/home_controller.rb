class HomeController < ApplicationController

	before_action :authenticate_user!, :only => :my_profile

	def index
		#joins and select only the field required
		#use scopes
        @photos = Photo.joins(:album => :user).select("photos.*, albums.id as album_id, albums.name as album_name, users.first_name as users_first_name, users.last_name as users_last_name").last(25)
	end

	def my_profile
		@albums = current_user.albums
	end
end