module CompositorNode
 
  class Cropper
    attr_accessor :source, :width, :height, :x_offset, :y_offset

    class MissingDimensionCropError < RuntimeError; end

    def initialize(options = {})
      @source = options[:source]
      @width = options[:width]
      @height = options[:height]
      @x_offset = options[:x_offset] || 0
      @y_offset = options[:y_offset] || 0
    end

    def execute
      raise MissingDimensionCropError unless @width && @height
      Engine.crop(@source.execute, @x_offset, @y_offset, @width, @height)
    end
  end

end
