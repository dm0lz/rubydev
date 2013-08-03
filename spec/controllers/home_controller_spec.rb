require 'spec_helper'

describe HomeController do

	render_views

	describe "GET 'index'" do

		it "returns http success" do
			get 'index'
			response.should be_success
		end
		it "should display the rails welcome message" do
			get 'index'
			#binding.pry
			expect(response.body).to include("Home")
		end

	end

end
