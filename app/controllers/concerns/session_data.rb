module SessionData
	extend ActiveSupport::Concern

	private
	def set_count
		if session[:count].nil?
			session[:count] = 1
		else
			session[:count] += 1
		end
		@count = session[:count]
	end

	def reset_count
		session[:count] = 0
	end
end