module CompositorNode
	class Resizer
		attr_accessor :source, :width, :height

		def initialize(options = {})
			@source = options[:source]
			@width = options[:width]
			@height = options[:height]
		end
		
		def execute
			@source.execute.resize(@width, @height)
		end
	end
end
