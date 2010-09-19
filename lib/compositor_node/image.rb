module CompositorNode
  class Image
    attr_accessor :source

    def initialize(options = {})
      @source = options[:source]
    end

    def execute
      Engine.read(@source)
    end
  end
end
