module CompositorNode
	class Output
		attr_accessor :width, :height, :source
		
		def initialize(options = {})
			@width = options[:width]
			@height = options[:height]
			@source = options[:source]
		end

		def write(path)
			output = source.execute.resize(@width, @height)
			output.write(path)
		end
	end
end
