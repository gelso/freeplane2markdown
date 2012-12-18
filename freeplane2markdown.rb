#!/usr/bin/env ruby
require 'rexml/document'
require 'optparse'
include REXML

def print_normal_text_from(node_name)
  puts node_name.attributes["TEXT"]; puts "  "
end

def print_header_of(n_level, node_name)
  puts "#" * n_level + " " + node_name.attributes["TEXT"]; puts "  "
end

def print_image_from(node_name)
  puts "*" + node_name.attributes["TEXT"] + "*:"
  puts "![" + node_name.attributes["TEXT"] + "](" + node_name.elements["hook"].attributes["URI"].split(":")[1] + ")"
end

def recursively_handle_node(node_name, n_level)
  if node_name.elements["node"].nil?    
    if node_name.elements["hook"].nil?
      print_normal_text_from(node_name)
    else                                
      if node_name.elements["hook"].attributes["URI"] =~ /png|gif|jpg|jpeg|tif|tiff/i
        print_image_from(node_name)
      else
        print_normal_text_from(node_name)
      end
    end
  else
    print_header_of(n_level, node_name); n_level += 1
    node_name.each_element do |node_name|
      recursively_handle_node(node_name, n_level)
    end
  end
end

my_argv = {}
option_parser = OptionParser.new do |opts|
  opts.banner = "
  -----------------------------------------------------------------------------------------------------------------
  | freeplane2markdown.rb: translate a mind map structure in a markdown's headers structure.                      |
  | Put your chapter-paragraph names into freeplane branches, and text into their leaves; the script will convert |
  | branches into headers of the appropriate levels. Images must be added as label/text containing leaves.        |
  | Other markdown features (e.g. enphasized text, lists, links) should be added by you in the mindmap text.      |
  -----------------------------------------------------------------------------------------------------------------
  Usage: ruby freeplane2markdown.rb -i input_file
  Examples: 
  ruby freeplane2markdown.rb -i input_file > markdown_file.mkd
  ruby freeplane2markdown.rb -i input_file | pandoc -o final.odt (pandoc must be installed first)\n  Parameters:\n"
  opts.on("-i INPUT", '".mm" mindmaps/freeplane file.') {|input_file| my_argv[:input_file] = input_file}
end
option_parser.parse!

if my_argv[:input_file].nil?
  puts option_parser.help; abort ("  **Sorry, the input file name is requested.**\n\n") 
end

file = File.new(my_argv[:input_file])
doc = Document.new(file)

doc.root.each_element do |nod1|
  recursively_handle_node(nod1, n_level = 1)
end




