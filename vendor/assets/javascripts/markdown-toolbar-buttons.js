MarkdownToolbar.buttons = [
  {title: 'Bold',          type: 'wrapper',  left: '**', right: '**', id: 'bold'},
  {title: 'Italic',        type: 'wrapper',  left: '*',  right: '*',  id: 'italic'},
  {id: 'delimiter'},
  {title: 'H1',            type: 'wrapper',  left: '# ', right: ' #', id: 'heading_1'},
  {title: 'H2',            type: 'wrapper',  left: '# ', right: ' #', id: 'heading_2'},
  {title: 'H3',            type: 'wrapper',  left: '# ', right: ' #', id: 'heading_3'},
  {id: 'delimiter'},
  {title: 'Bulleted list', type: 'prefixer', left: '- ',              id: 'list_bullets'},
  {title: 'Numbered list', type: 'list_numbers', id: 'list_numbers'},  
  {title: 'Blockquote',    type: 'prefixer', left: '> ',              id: 'blockquote'},
  // Code:
  {title: 'Source Code',   type: 'block_wrapper',   left: "```\n", right: "\n```", id: 'code'},  
  {id: 'delimiter'},
  {title: 'Image',         type: 'image',        id: 'image'},
  {title: 'Link',          type: 'link',         id: 'link'},
];
