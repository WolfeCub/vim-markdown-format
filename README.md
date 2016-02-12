Markdown Format Vim
===================

A simple plugin for easily formatting text for markdown styling.

###### Bullet List
![BulletList](http://i.imgur.com/SIyhUBr.gif)

###### Header One
![HeaderOne](http://i.imgur.com/5yCN7GM.gif)

###### Numbered List
![NumberList](http://i.imgur.com/EKg8tcn.gif)

Recommended bindings for your vimrc but feel free to change them to whatever you prefer.

``` vim
nnoremap <leader>h1 :call HeaderOne()<cr>
nnoremap <leader>h2 :call HeaderTwo()<cr>
nnoremap <leader>h3 :call HeaderThree()<cr>
nnoremap <leader>h4 :call HeaderFour()<cr>
nnoremap <leader>h5 :call HeaderFive()<cr>
nnoremap <leader>h6 :call HeaderSix()<cr>
vnoremap <leader>l1 :<BS><BS><BS><BS><BS>call MakeListOne()<cr>
vnoremap <leader>l2 :<BS><BS><BS><BS><BS>call MakeListTwo()<cr>
vnoremap <leader>nl :<BS><BS><BS><BS><BS>call MakeNumberedList()<cr>
vnoremap <leader>cb :<BS><BS><BS><BS><BS>call FencedCodeBlock()<cr>
```

The `<BS><BS><BS><BS><BS>` are a bit of a workaround as its a work in progress.

The FencedCodeBlock() method isn't working preprly at all its under heavy development.
