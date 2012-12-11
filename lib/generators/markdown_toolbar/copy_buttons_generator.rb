module MarkdownToolbar
  class CopyButtonsGenerator < ::Rails::Generators::Base

    source_root File.expand_path('../../../../vendor/assets', __FILE__)    
    desc "Copies toolbar-buttons.js so you can create new buttons or reorder them"
    
    def copy_buttons
      say_status("copying", "markdown-toolbar-buttons.js", :green)
      copy_file "javascripts/markdown-toolbar-buttons.js", "app/assets/javascripts/markdown-toolbar-buttons.js"
    end
    
  end
end