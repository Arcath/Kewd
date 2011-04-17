module Kewd
	class Queue
		def initialize(name)
			@jobs = []
			@name = name
		end
		
		def name
			@name
		end
	end
end
