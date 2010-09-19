module CompositorNode
  
  class Engine

    class NoEngineError < RuntimeError; end

    def self.execute
      raise Engine::NoEngineError if Config.engine.nil?
      Config.engine
    end

    def self.read(source)
      execute.read(source)
    end

    def self.write(source, path)
      execute.write(source, path)
    end

    def self.resize(source, width, height)
      execute.resize(source, width, height)
    end

    def self.width(source)
      execute.width(source)
    end

    def self.height(source)
      execute.height(source)
    end

    def self.blend(source_a, source_b, x_offset, y_offset, method)
      raise Blender::NoBlendMethodError if method.nil?
      execute.blend(source_a, source_b, x_offset, y_offset, execute.const_get(method))
    end

    def self.crop(source, x_offset, y_offset, width, height)
      execute.crop(source, x_offset, y_offset, width, height)
    end

  end

end
