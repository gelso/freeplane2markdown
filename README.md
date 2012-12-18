**freeplane2markdown.rb**: this ruby script translates a freeplane/freemind tree-like structure, read from a .mm file, in a markdown's formatted document having the right gerarchical role of the headers.
Simply put your chapter-paragraph names into freeplane branches, and text into their leaves; the script will convert every branches to the appropriate headers (i.e. putting the right number of "#").
Images might be included in the mind map at a leaf level, together with the image description, and will be automatically converted into the usual [label](URL) markdown format.
Other markdown features (e.g. enphasized text, lists, links) should be added before the conversion directly in the mindmap text.
  
  Usage:  
  `ruby freeplane2markdown.rb -i input_file`  
  Examples:  
  `ruby freeplane2markdown.rb -i input_file > markdown_file.mkd`  
  `ruby freeplane2markdown.rb -i input_file | pandoc -o final.odt (pandoc must be installed first)`  
  Parameters:  
  `-i INPUT                         ".mm" mindmaps/freeplane file.`  