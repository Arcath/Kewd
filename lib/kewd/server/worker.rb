module Kewd
	class Server
		class Worker
			def initialize(session, server)
				@session = session
				connected = true
				while connected do
					begin
						request = session.gets.chomp
						puts "[#{Time.now}] Request: #{request}"
						response = Kewd::ServerResponses.respond(request, server)
						puts "[#{Time.now}] Response: #{response}"
						if response == "terminate"
							session.close
							connected = false
						else
							session.puts(response)
						end
					rescue NoMethodError
						#nothing to recieve
					end
				end
			end
		end
	end
end
