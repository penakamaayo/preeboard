class DashboardController < ApplicationController
	before_action :authenticate_admin!

	def index
		@subscribers = Subscriber.all
		@users = User.all
	end
end
