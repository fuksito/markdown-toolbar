$(function(){
  $(".markdown-toolbar").each(function(i, textarea){
    new MarkdownToolbar($(textarea));
  });
});

function MarkdownToolbar(textarea){
  
  this.init = function(textarea){
    $this = this;
    this.textarea = textarea;
    this.add_toolbar();
    this.fill_buttons();
    this.add_resizer();
  }  
  
  
  this.add_toolbar = function(){
    this.textarea.before("<div class='markdown-toolbar-panel'><div class='mdt_buttons'></div></div>");
    this.panel = this.textarea.prev(".markdown-toolbar-panel");
    
    this.textarea.css("margin-top", 0);
    $(["margin-left", "margin-right", "padding-left", "padding-right"]).each(function(i, pos){
         $this.panel.css(pos, $this.textarea.css(pos));
    });
    this.resize_textarea();
    this.textarea.mouseup(function(){
      $this.resize_textarea();
    });
  }

  this.resize_textarea = function(){
    $this.panel.css("width", $this.textarea.width());
  }

  this.fill_buttons = function(){
    this.add_button("bold",   "Bold",   "**", "**");
    this.add_button("italic", "Italic", "*", "*");
    this.add_button("heading_2",   "Sub title",   "\n## ", " ##\n");
    this.add_button("heading_3", "Sub-sub title", "\n### ", " ###\n" );
    this.add_button("list_bullets", "Bulleted list");
    this.add_button("list_numbers", "Numbered list");
    this.add_button("image", "Insert Image");
    this.add_button("link", "Insert Link");
  }

  this.add_button = function(button_id, title, tagStart, tagEnd){
    $(".mdt_buttons", this.panel).append("<div class='mdt_button mdt_button_" + button_id + "' title='"+ title + "'></div>");
    $(".mdt_button_" + button_id, this.panel).bind('click', function(event) {
      switch(button_id){
        case "bold":
        case "italic":
        case "heading_2":
        case "heading_3":
          $this.perform_insert_tag(button_id, tagStart, tagEnd);
          break;

        case "list_numbers":
        case "list_bullets":
          $this.perform_insert_list(button_id)
          break;

        case "image":
          $this.perform_insert_image();
          break;
        case "link":
          $this.perform_insert_link();
          break;
      }
    });
  }


  this.perform_insert_tag = function(button_id, tagStart, tagEnd){
    
    var the_text = $this.selected_text();

    if(the_text.length == 0){
     the_text = "" + button_id + " text";
    }

    var lines = the_text.split("\n");
    var final_text = "";

    $(lines).each(function(i, line){
      i++
      final_text += tagStart + line + tagEnd;
      if (i < lines.length){
        final_text += "\n";
      }
    });

    $this.textarea.replaceSelection( final_text , true );
    $this.textarea.focus();
  }

  this.selected_text = function(){
    return this.textarea.getSelection().text;
  }

  this.perform_insert_list = function(button_id) {
    var the_text   = this.selected_text();
    if (the_text.length == 0){
      the_text = "Apple\nBananna\nOrange"
    }

    var lines = the_text.split("\n");
    var final_text = ""

    tagStart = "-"
    $(lines).each(function(i, line){
      i++
      if (button_id == 'list_numbers'){
        tagStart = "" + i + "." ;
      }

      final_text += tagStart + " " + line;
      if(i < lines.length){
        final_text += "\n";
      }
    });

    $this.textarea.replaceSelection( final_text , true );
    $this.textarea.focus();
  }


  this.perform_insert_image = function(){
    var the_text   = this.selected_text()
    if( the_text.length > 0 && (the_text.substr(0,7) == 'http://' || the_text.substr(0,7) == 'https:/')){
        the_text = "[alt text]("+ the_text +")"
    } else {
      the_text = "![alt text](http://path/to/img.jpg)"
    }

    $this.textarea.replaceSelection( the_text , true );
  }

  this.perform_insert_link = function(){
    var the_text  = this.selected_text();
    if (the_text.length > 0){
      if (the_text.substr(0,7) == 'http://' || the_text.substr(0,7) == 'https:/'){
        the_text = "["+ the_text +"]("+ the_text + ")"
      } else {
        the_text = "[" + the_text + "](http://...)"
      }
    } else {
      the_text = "[example link](http://example.com/)";
    }
    $this.textarea.replaceSelection( the_text , true );
  }

  this.add_resizer = function(){
    var do_resize = false;
    var to;
    this.textarea.bind({
      mousedown: function(){
        to = setInterval($this.resize_textarea, 10);
      },

      mouseup: function(){
        clearInterval(to);
      }
    });
  }

  this.init(textarea);
}