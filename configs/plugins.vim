for f in split(glob('~/.config/nvim/configs/plugins/*.vim'), '\n')
   exe 'source' f
endfor

