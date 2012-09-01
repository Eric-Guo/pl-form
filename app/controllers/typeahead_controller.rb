class TypeaheadController < ApplicationController
	def lot
		render json: ['AB','ABCD','ABCD','ABCDE']
	end
end
