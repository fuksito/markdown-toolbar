$ ->
  for textarea in $(".markdown-toolbar")
    new MarkdownToolbar $(textarea)
  
  
class MarkdownToolbar
  constructor: (@textarea) ->
    this.add_toolbar()
    
  add_toolbar: ->
    @textarea.before "<div class='markdown-toolbar-panel'><div class='mdt_buttons'></div></div>"
    @panel = @textarea.prev ".markdown-toolbar-panel"
    
    @panel.css        "width", @textarea.css('width')
    
    @textarea.css "margin-top",    0
    
    for pos_type in ["margin", "padding"]
      for pos in ['left', 'right']
          @panel.css "#{pos_type}-#{pos}", @textarea.css("#{pos_type}-#{pos}")
    
    this.fill_buttons()

  add_button: (button_id, title, tagStart, tagEnd) ->
    $(".mdt_buttons", @panel).append "<div class='mdt_button mdt_button_#{button_id}' title='#{title}'></div>"
    $(".mdt_button_#{button_id}", @panel).bind 'click', (event) =>
      switch button_id
        when "bold", "italic", "heading_2", "heading_3"
          this.perform_insert_tag(button_id, tagStart, tagEnd)
        when "list_numbers", "list_bullets"
          this.perform_insert_list(button_id)
        when "image"
          this.perform_insert_image()
        when "link"
          this.perform_insert_link()

  perform_insert_tag: (button_id, tagStart, tagEnd = '') ->
    the_text   = this.selected_text()
    the_text ||= "#{button_id} text"
    lines = the_text.split("\n")
    final_text = ""
    i = 0
    for line in lines
      i++
      final_text += "#{tagStart}#{line}#{tagEnd}"
      final_text += "\n" if i < lines.length
        
    @textarea.replaceSelection( final_text , true )
  
  perform_insert_list: (button_id) ->
    the_text   = this.selected_text()
    the_text ||= "Apple\nBananna\nOrange"
    lines = the_text.split("\n")
    final_text = ""
    i = 0
    tagStart = "-"
    for line in lines
      i++
      tagStart = "#{i}." if button_id == 'list_numbers'
      final_text += "#{tagStart} #{line}"
      final_text += "\n" if i < lines.length

    @textarea.replaceSelection( final_text , true )

  perform_insert_image: ->
    the_text   = this.selected_text()
    if the_text.length > 0 && (the_text.substr(0,7) == 'http://' || the_text.substr(0,7) == 'https:/')
        the_text = "[alt text](#{the_text})"
    else
      the_text = "![alt text](http://path/to/img.jpg)"

    @textarea.replaceSelection( the_text , true )

  perform_insert_link: ->
    the_text  = this.selected_text()
    if the_text.length > 0
      if the_text.substr(0,7) == 'http://' || the_text.substr(0,7) == 'https:/'
        the_text = "[#{the_text}](#{the_text})"
      else
        the_text = "[#{the_text}](http://...)"
    else
      the_text = "[example link](http://example.com/)"
      
    @textarea.replaceSelection( the_text , true )      
    
  selected_text: ->
    @textarea.getSelection().text
    
  fill_buttons: ->
    this.add_button "bold",   "Bold",   "**", "**"
    this.add_button "italic", "Italic", "*", "*"
    this.add_button "heading_2",   "Sub title",   "\n## ", " ##\n"
    this.add_button "heading_3", "Sub-sub title", "\n### ", " ###\n"    
    this.add_button "list_bullets", "Bulleted list"
    this.add_button "list_numbers", "Numbered list"
    this.add_button "image", "Insert Image"    
    this.add_button "link", "Insert Link"