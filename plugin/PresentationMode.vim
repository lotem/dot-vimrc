" toggle between working mode and presentation mode
" borrowed from skalnik(https://github.com/skalnik)
"
" font size change only work for GUI-version Vim

function! PresentationModeOn()
  colorscheme github

  if has("gui_running")
    if has("gui_gtk")
      set guifont=Monospace\ 22        " for ubuntu
    elseif has("gui_macvim")
      set guifont=Monaco:h25           " for Mac
    else
      set guifont=Monaco:h25           " for Windows
    end
  endif
endfunction

function! PresentationModeOff()
  colorscheme ir_black

  if has("gui_running")
    if has("gui_gtk")
      set guifont=Monospace\ 14        " for ubuntu
    elseif has("gui_macvim")
      set guifont=Monaco:h17           " for Mac
    else
      set guifont=Monaco:h17           " for Windows
    end
  endif
endfunction

function! TogglePresentationMode()
  if !exists('w:present')
    let w:present=0
  endif

  if w:present==0
    call PresentationModeOn()
    let w:present=1
  else
    call PresentationModeOff()
    let w:present=0
  endif
endfunction

map <leader>z :call TogglePresentationMode()<CR>
