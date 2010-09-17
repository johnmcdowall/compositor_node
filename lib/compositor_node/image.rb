module CompositorNode
	class Image
		attr_accessor :source

		def initialize(options = {})
			@source = options[:source]
		end

		def execute
			Magick::ImageList.new(@source)
		end
	end
end
