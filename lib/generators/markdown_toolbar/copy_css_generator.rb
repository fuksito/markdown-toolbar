module MarkdownToolbar
  class CopyCssGenerator < ::Rails::Generators::Base
        
    desc "Copies style file for customization"
    source_root File.expand_path('../../../../vendor/assets', __FILE__)

    def copy_css
      say_status("copying", "markdown-toolbar.css.erb", :green)
      copy_file "stylesheets/markdown-toolbar.css.erb", "app/assets/stylesheets/markdown-toolbar.css.erb"
    end

  end
end