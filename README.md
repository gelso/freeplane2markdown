**freeplane2markdown.rb**: this ruby script translates a freeplane/freemind tree-like structure, read from a .mm file, in a markdown's formatted document having the right hierarchical role of the headers.
Simply put your chapter-paragraph names into freeplane branches, and text into their leaves; the script will convert every branches to the appropriate headers (i.e. putting the right number of "#").
Images might be included in the mind map at a leaf level, together with the image description, and will be automatically converted into the `![label](URL)` markdown format.
Other markdown features (e.g. enphasized text, lists, links) are not managed and should be added before the conversion directly in the mindmap text.
  
  Usage:  
  `ruby freeplane2markdown.rb -i input_file`  
  Examples:  
  `ruby freeplane2markdown.rb -i input_file > markdown_file.md`  
  `ruby freeplane2markdown.rb -i input_file | pandoc -o final.odt (pandoc must be installed first)`  
  Parameters:  
  `-i INPUT                         ".mm" mindmaps/freeplane file.`  


Note: save the entire Freeplane map as plain text in the input file. To do it, you can easily select all nodes with Ctrl+A, and then click Ctrl+Shift+P to convert all the nodes in plain text. Finally, save the file.

