"  ____  __.__                _______    __________________
" |    |/ _|__| ____    ____  \      \   \      \__    ___/
" |      < |  |/    \  / ___\ /   |   \  /   |   \|    |   
" |    |  \|  |   |  \/ /_/  >    |    \/    |    \    |   
" |____|__ \__|___|  /\___  /\____|__  /\____|__  /____|   
"         \/       \//_____/         \/         \/      
" 
" Vim customized by KingNNT
"

for f in split(glob('~/.config/nvim/configs/*.vim'), '\n')
   exe 'source' f
endfor

lua require('init')