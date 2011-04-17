require "#{File.expand_path(File.dirname(__FILE__))}/server_responses"
require "#{File.expand_path(File.dirname(__FILE__))}/server/worker"
module Kewd
	class Server
		def initialize(port = 4646, bind = "0.0.0.0")
			@server = TCPServer.new(bind, port)
			@queues = []
			loop do
				session = @server.accept
				request = session.gets.chomp
				puts "[#{Time.now}] Request: #{request}"
				response = Kewd::ServerResponses.respond(request,self)
				puts "[#{Time.now}] Response: #{response}"
				session.puts(response)
				Kewd::Server::Worker.new(session, self)
			end
		end
		
		def has_queue?(queue)
			out = false
			@queues.each do |queue|
				if queue.name == queue
					out = true
				end
			end
			return out
		end
	end
end
