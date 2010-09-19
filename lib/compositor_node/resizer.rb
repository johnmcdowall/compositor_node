module CompositorNode
  class Resizer
    attr_accessor :source, :width, :height

    class MissingDimensionResizeError < RuntimeError; end

    def initialize(options = {})
      @source = options[:source]
      @width = options[:width]
      @height = options[:height]
    end

    def execute
      raise MissingDimensionResizeError unless @width || @height
      source = @source.execute
     
      unless @width && @height
        original_width = Engine.width(source)
        original_height = Engine.height(source)

        if @width
          ratio = original_width / @width.to_f
          @height = original_height / ratio
        elsif @height
          ratio = original_height / @height.to_f
          @width = original_width / ratio
        end
      end

      Engine.resize(source, @width, @height)
    end
  end
end
