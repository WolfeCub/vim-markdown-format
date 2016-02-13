Markdown Format Vim
===================

A simple plugin for easily formatting text for markdown styling.

###### Bullet List
![BulletList](http://i.imgur.com/SIyhUBr.gif)

###### Header One
![HeaderOne](http://i.imgur.com/5yCN7GM.gif)

###### Numbered List
![NumberList](http://i.imgur.com/EKg8tcn.gif)

##### Reccomended Bindings
These are the binding I personally use in my vimrc as I like have mnemonic keybinds.Feel free to change them to whatever you prefer. Just keep in mind that any visual mode bindings require a `<C-u>` after the `:` for the function to call properly.

``` vim
nnoremap <leader>h1 :call MakeHeader(1)<cr>
nnoremap <leader>h2 :call MakeHeader(2)<cr>
nnoremap <leader>h3 :call MakeHeader(3)<cr>
nnoremap <leader>h4 :call MakeHeader(4)<cr>
nnoremap <leader>h5 :call MakeHeader(5)<cr>
nnoremap <leader>h6 :call MakeHeader(6)<cr>
vnoremap <leader>l1 :<C-u>call MakeListOne()<cr>
vnoremap <leader>l2 :<C-u>call MakeListTwo()<cr>
vnoremap <leader>nl :<C-u>call MakeNumberedList()<cr>
vnoremap <leader>cb :<C-u>call FencedCodeBlock()<cr>
```

