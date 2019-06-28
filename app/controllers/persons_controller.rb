class PersonsController < ApplicationController
	def show
		@person = Person.find_by(params[:person_id])
		@user = @person.user
		@book = @person.book
	end

end
