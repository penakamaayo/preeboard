class SubscribersController < ApplicationController
	def index
	end
	
	def new
		@subscriber = Subscriber.new
	end

	def create
		@subscriber = Subscriber.new(subscriber_params)

		respond_to do |format|
			if @subscriber.save
				format.html { redirect_to root_url, notice: 'Thanks for signing up! We\'ll send you updates soon!' }
			else
				format.html { render :new }
			end
		end

	end

	private

	def subscriber_params
		params.require(:subscriber).permit(:email)
	end
end
