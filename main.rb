require 'rubygems'
require 'ruby-debug'
require File.join(File.dirname(__FILE__), "lib", "compositor_node")

oversized_image = CompositorNode::Image.new(:source => "data/oversized_image.jpg")
overlay_text = CompositorNode::Image.new(:source => "data/overlay_text.png")

resizer = CompositorNode::Resizer.new
resizer.source = oversized_image
resizer.width = 400
resizer.height = 225

blender = CompositorNode::Blender.new
blender.source_a = resizer
blender.source_b = overlay_text
blender.method = CompositorNode::Blender::MULTIPLY

output = CompositorNode::Output.new(:width => 400, :height => 225)
output.source = blender
output.write("data/output.png")
