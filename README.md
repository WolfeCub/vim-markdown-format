Markdown Format Vim
===================

A simple plugin for easily formatting text for markdown styling.

###### Numbered List
![NumberList](http://i.imgur.com/j7gIoUe.gif)

###### Headers
![Headers](http://i.imgur.com/oF4Fadj.gif)

###### Bullet List
![BulletList](http://i.imgur.com/dVbJF9u.gif)


##### Reccomended Bindings
These are the binding I personally use in my vimrc as I like have mnemonic keybinds.Feel free to change them to whatever you prefer. Just keep in mind that any visual mode bindings require a `<C-u>` after the `:` for the function to call properly.

``` vim
nnoremap <leader>h1 :MakeHeader 1<cr>
nnoremap <leader>h2 :MakeHeader 2<cr>
nnoremap <leader>h3 :MakeHeader 3<cr>
nnoremap <leader>h4 :MakeHeader 4<cr>
nnoremap <leader>h5 :MakeHeader 5<cr>
nnoremap <leader>h6 :MakeHeader 6<cr>
vnoremap <leader>ll :<C-u>MakeList<cr>
vnoremap <leader>nl :<C-u>MakeNumberedList<cr>
vnoremap <leader>cb :<C-u>FencedCodeBlock<cr>
vnoremap <leader>bq :<C-u>BlockQuote
```

