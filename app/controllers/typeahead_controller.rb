class TypeaheadController < ApplicationController
	def lot
		q=params[:query]
		rows=Mes.connection().select_values("SELECT co.containername FROM container co
			INNER JOIN a_scheduledata sd ON sd.scheduledataid=co.scheduledataid
			WHERE co.containername LIKE '#{q.upcase}%' AND ROWNUM < 7", :containername)
		render json: rows
	end
end
