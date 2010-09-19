module CompositorNode

  class Config
    @@engine = nil

    def self.engine
      @@engine
    end

    def self.engine=(value)
      @@engine = value
    end

  end
end
