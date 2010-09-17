module CompositorNode
	class Blender
		attr_accessor :source_a, :source_b, :method

		MULTIPLY = Magick::MultiplyCompositeOp
		
		def initialize(options = {})
			@source_a = options[:source_a]
			@source_b = options[:source_b]
			@method = options[:method]
		end

		def execute
			image_a = @source_a.execute
			image_b = @source_b.execute

			image_a.composite(image_b, 0, 0, @method)
		end
	end
end
