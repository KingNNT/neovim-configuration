for setting_file in split(glob('~/.config/nvim/configs/settings/*.vim'), '\n')
   execute 'source' setting_file
endfor

