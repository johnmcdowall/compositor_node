require 'rubygems'
require 'ruby-debug'
require File.join(File.dirname(__FILE__), 'lib', 'compositor_node')
require File.join(File.dirname(__FILE__), 'lib', 'compositor_node', 'engines', 'image_magick')

`rm data/output.png` rescue nil

CompositorNode::Config.engine = CompositorNode::Engines::ImageMagick

oversized_image = CompositorNode::Image.new(:source => "data/oversized_image.jpg")
overlay_text = CompositorNode::Image.new(:source => "data/overlay_text.png")

resizer = CompositorNode::Resizer.new
resizer.source = oversized_image
resizer.width = 400
resizer.height = 225

text_resizer = CompositorNode::Resizer.new
text_resizer.source = overlay_text
text_resizer.width = 320

blender = CompositorNode::Blender.new
blender.source_a = resizer
blender.source_b = text_resizer
blender.method = CompositorNode::Blender::MULTIPLY
blender.y_offset = 50

cropper = CompositorNode::Cropper.new
cropper.source = blender
cropper.width = 320
cropper.height = 200
cropper.y_offset = 50

output = CompositorNode::Output.new
output.source = cropper
output.write("data/output.png")
