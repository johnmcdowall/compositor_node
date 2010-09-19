require 'RMagick'

module CompositorNode
  module Engines
    
    class ImageMagick
      MULTIPLY = ::Magick::MultiplyCompositeOp
      OVERLAY = ::Magick::OverlayCompositeOp

      def self.read(source)
        ::Magick::ImageList.new(source)
      end

      def self.write(source, path)
        source.write(path)
      end
      
      def self.resize(source, width, height)
        source.resize(width, height)
      end

      def self.width(source)
        source.columns
      end

      def self.height(source)
        source.rows
      end

      def self.blend(source_a, source_b, x_offset, y_offset, method)
        source_a.composite(source_b, x_offset, y_offset, method)
      end

      def self.crop(source, x_offset, y_offset, width, height)
        source.crop(x_offset, y_offset, width, height)
      end

    end

  end
end
