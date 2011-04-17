module Kewd
	module ServerResponses
		def self.respond(request,server)
			if request == "version"
				return Kewd::VERSION
			elsif request =~ /queue_name/
				queue = request.gsub(/^queue_name: /,"")
				return server.has_queue? queue
			elsif request =~ /add_worker/
				queue = request.gsub(/^add_worker: /,"")
				return "true"
			elsif request =~ /add_queue/
				return "true"
			elsif request =~ /disconnect/
				return "terminate"
			end
		end
	end
end
