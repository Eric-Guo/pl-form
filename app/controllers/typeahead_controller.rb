class TypeaheadController < ApplicationController
	def lot
		q=params[:query]
		rows=Mes.connection().select_values("SELECT co.containername FROM container co
			INNER JOIN a_scheduledata sd ON sd.scheduledataid=co.scheduledataid
			WHERE co.containername LIKE '#{q.upcase}%' AND ROWNUM < 7", :containername)
		render json: rows
	end

	def package
		q=params[:query]
		rows=Mes.connection().select_values("SELECT pc.packagecategoryname
FROM a_packagecategory pc
WHERE pc.packagecategoryname like '#{q.upcase}%' AND ROWNUM < 7", :packagecategoryname)
		render json: rows
	end

	def device
		q=params[:query]
		rows=Mes.connection().select_values("SELECT DISTINCT sd.productname
FROM a_scheduledata sd
WHERE sd.productname LIKE '%#{q.upcase}%' AND ROWNUM < 7", :productname)
		render json: rows
	end
end
