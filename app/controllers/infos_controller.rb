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

	def create_membro_nucleo
		sql = "SELECT short_name as name,count(short_name) as data from users,sectors 
				where users.sector_id = sectors.id
				group by short_name"
		array = ActiveRecord::Base.connection.execute(sql)
		arrayint = array.map{|a| {name: a["name"], data: [a["data"].to_i]}}
		@json = []

		arrayint.each do |t|
  			@json << t
		end

		JSON.generate(@json)
	    render json: @json
	end

end