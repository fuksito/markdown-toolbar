Markdown Toolbar
================

[![Gem Version](https://badge.fury.io/rb/markdown-toolbar.svg)](http://badge.fury.io/rb/markdown-toolbar)

Markdown Toolbar is an lightweight helper buttons that appear over textarea

[![image](http://fuksito.com/markdown-toolbar-preview.png)](http://markdown-toolbar-example.herokuapp.com/)


Try a [demonstration](http://markdown-toolbar-example.herokuapp.com/) 

(Wait for load, as the heroku instance that serves demo is probably sleeping now, so it takes time for it to wake up)

Installation
------------

### Rails 4.1+

Use version 1.0.0, add to Gemfile:

    gem "markdown-toolbar", "~> 1.0"

### Rails 3 and before 4.1

use version 0.2.4, add to Gemfile

    gem "markdown-toolbar", "~> 0.2.4"

And run the **bundle** command.


Getting Started
---------------

Markdown Toolbar requires you to add such lines to your application.js

    //= require markdown-toolbar

and to application.css

    *= require markdown-toolbar

Then you can add toolbar to any textarea by adding a class **markdown-toolbar** to it

    <%= f.text_area :text, :class => "markdown-toolbar" %>

Alternatively, if you dynamicly create textareas, you can assign markdown toolbar in javascript by creating new instance of MarkdwonToolbar, with a textarea element as argument:

    new MarkdownToolbar($("#some_textarea"));

Customizing
-----------

You can customize order, remove or add new buttons by copying markdown-toolbar-buttons.js file into your project.
There is a rails generator to do it:

    rails generate markdown_toolbar:copy_buttons

To customize stylesheet run:

    rails generate markdown_toolbar:copy_css

License
-------

Markdown Toolbar is released under the [MIT License](http://www.opensource.org/licenses/MIT).
