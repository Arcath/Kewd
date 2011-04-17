module Kewd
	module CLI
		def self.run(args)
			@args = args
			@args[0] = "help" if @args.first == nil
			if @args.first.downcase == "-v" or @args.first.downcase == "--version"
				puts Kewd::VERSION
			elsif @args.first.downcase == "s" or @args.first.downcase == "--server"
				require "#{File.expand_path(File.dirname(__FILE__))}/server"
				Kewd::Server.new
			elsif @args.first.downcase == "c" or @args.first.downcase == "--client"
				require "#{File.expand_path(File.dirname(__FILE__))}/client"
				Kewd::Client.new(@args.last)
			else
				puts help_message
			end
		end
		
		def self.help_message
			"Kewd version #{Kewd::VERSION}\n\n\tq, --queue\n\t\tStarts the Kewd Server, "
		end
	end
end
