module CompositorNode
  class Blender
    attr_accessor :source_a, :source_b, :x_offset, :y_offset, :method

    MULTIPLY = 'MULTIPLY'
    OVERLAY = 'OVERLAY'

    class NoBlendMethodError < RuntimeError; end

    def initialize(options = {})
      @source_a = options[:source_a]
      @source_b = options[:source_b]
      @method = options[:method]
      @x_offset = options[:x_offset] || 0
      @y_offset = options[:y_offset] || 0
    end

    def execute
      image_a = @source_a.execute
      image_b = @source_b.execute

      Engine.blend(image_a, image_b, @x_offset, @y_offset, @method)
    end
  end
end
