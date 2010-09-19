module CompositorNode
  class Output
    attr_accessor :source

    def initialize(options = {})
      @source = options[:source]
    end

    def write(path)
      Engine.write(@source.execute, path)
    end
  end
end
