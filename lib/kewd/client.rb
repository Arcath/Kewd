module Kewd
	class Client
		def initialize(queue_name, server_ip = "127.0.0.1", server_port = 4646)
			@con = TCPSocket.new(server_ip, server_port)
			@con.send("version\n", 0)
			server_version = @con.gets.gsub(/\n/,'')
			if server_version == Kewd::VERSION
				@con.send("queue_name: #{queue_name}\n", 0)
				has_queue = @con.gets.chomp
				if has_queue == "true"
					@con.send("add_worker: #{queue_name}\n", 0)
					@con.gets.chomp
					@con.send("disconnect\n", 0)
					#@con.gets.chomp
					@con.close
				else
					@con.send("add_queue: #{queue_name}\n", 0)
					if @con.gets.chomp == "true"
						
					end
				end
			else
				@con.send("disconnect\n", 0)
			end
		end
		
		
		
	end
end
