class InfosController < ApplicationController
	require 'json'

	def index

	end

	def create
		sql = "SELECT status as name,count(status) as y from projects,project_statuses 
				where project_status_id = project_statuses.id
				group by status"

		array = ActiveRecord::Base.connection.execute(sql)
		arrayint = array.map{|a| {name: a["name"], y: a["y"].to_i}}
		@json = []

		arrayint.each do |t|
  			@json << t
		end
		
		JSON.generate(@json)
	    render json: @json
	end

end