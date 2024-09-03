
hi def lcColorGray          ctermfg=59 guifg=#5c6370

hi def lcColorErrorPrio       ctermfg=235 ctermbg=204 guifg=#282c34 guibg=#e06c75
hi def lcColorErrorText       ctermfg=204 guifg=#e06c75
hi def lcColorErrorTextStrong ctermfg=204 guifg=#e06c75 gui=bold

hi def lcColorWarnPrio        ctermfg=235 ctermbg=180 guifg=#282c34 guibg=#e5c07b
hi def lcColorWarnText        ctermfg=180 guifg=#e5c07b
hi def lcColorWarnTextStrong  ctermfg=180 guifg=#e5c07b gui=bold

hi def lcColorInfoPrio        ctermfg=235 ctermbg=114 guifg=#282c34 guibg=#98c379
hi def lcColorInfoText        ctermfg=114 guifg=#98c379
hi def lcColorInfoTextStrong  ctermfg=114 guifg=#98c379 gui=bold

hi def lcColorVerbosePrio     ctermbg=237 guibg=#3e4452

hi def lcColorDebugPrio       ctermfg=145 ctermbg=236 guifg=#abb2bf guibg=#2c323c


syn match   mgLineBegin       display '^' nextgroup=mgDate

" Example:
" 09-02 12:41:48.379  8086  8086 I pci 0000: 00:00.0: [8086:1237] type 00 class 0x060000
" ^^^^^^^^^^^^^^^^^^
syn match mgDate          '[0-1]\d-[0-3]\d ' nextgroup=mgTime
hi def link mgDate        lcColorGray

" Example:
" 09-02 12:41:48.379  8086  8086 I pci 0000: 00:00.0: [8086:1237] type 00 class 0x060000
"       ^^^^^^^^^^^^
syn match   mgTime        '[0-1]\d:[0-5]\d:[0-5]\d\.\d\d\d  ' nextgroup=mgPid
hi def link mgTime        lcColorGray

" Example:
" 09-02 12:41:48.379  8086  8086 I pci 0000: 00:00.0: [8086:1237] type 00 class 0x060000
"                     ^^^^^^^^^^
syn match   mgPid        '\d\{-} \+\d\{-}'me=e-1 nextgroup=mgInfoGroup
hi def link mgPid        lcColorGray



" syn match   mgPrioErr     '\ \<E[\/ ]' containedin=mgErrorGroup
" hi def link mgPrioErr     DiffDelete

" syn match   mgErrorGroup  '\ \<E.*' contains=mgPrioErr

" syn match   mgPrioWarn    '\ \<W[\/ ]' containedin=mgPrioAndRest nextgroup=mgInfoTag
" hi def link mgPrioWarn    CurSearch


" Error:
"----------------------------------------------------

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                                           ^^^
syn match   mgErrorMsg         '.*'
  \ contained

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                                  ^^^^^^^^
syn match   mgErrorTag         '[^:]\+: '
  \ contained nextgroup=mgErrorMsg

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                               ^^^
syn match   mgErrorPrio    '\ \<E[\/ ]'
  \ contained nextgroup=mgErrorTag

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                               ^^^^^^^^^^^^^^^
syn match   mgErrorGroup  ' \<E.*'
  \ contains=mgErrorPrio,mgErrorTag,mgErrorMsg


hi def link mgErrorPrio      lcColorErrorPrio
hi def link mgErrorTag       lcColorErrorTextStrong
hi def link mgErrorMsg       lcColorErrorText

" Warn:
"----------------------------------------------------

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                                           ^^^
syn match   mgWarnMsg         '.*'
  \ contained

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                                  ^^^^^^^^
syn match   mgWarnTag         '[^:]\+: '
  \ contained nextgroup=mgWarnMsg

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                               ^^^
syn match   mgWarnPrio    '\ \<W[\/ ]'
  \ contained nextgroup=mgWarnTag

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                               ^^^^^^^^^^^^^^^
syn match   mgWarnGroup  ' \<W.*'
  \ contains=mgWarnPrio,mgWarnTag,mgWarnMsg


hi def link mgWarnPrio      lcColorWarnPrio
hi def link mgWarnTag       lcColorWarnTextStrong
hi def link mgWarnMsg       lcColorWarnText

" Info:
"----------------------------------------------------

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                                           ^^^
syn match   mgInfoMsg         '.*'
  \ contained

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                                  ^^^^^^^^
syn match   mgInfoTag         '[^:]\+: '
  \ contained nextgroup=mgInfoMsg

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                               ^^^
syn match   mgInfoPrio    '\ \<I[\/ ]'
  \ contained nextgroup=mgInfoTag

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                               ^^^^^^^^^^^^^^^
syn match   mgInfoGroup  ' \<I.*'
  \ contains=mgInfoPrio,mgInfoTag,mgInfoMsg


hi def link mgInfoPrio      lcColorInfoPrio
hi def link mgInfoTag       lcColorInfoTextStrong
hi def link mgInfoMsg       lcColorInfoText



" Verbose:
"----------------------------------------------------

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                                           ^^^
syn match   mgVerbMsg         '.*'
  \ contained

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                                  ^^^^^^^^
syn match   mgVerbTag         '[^:]\+: '
  \ contained nextgroup=mgVerbMsg

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                               ^^^
syn match   mgVerbPrio    '\ \<V[\/ ]'
  \ contained nextgroup=mgVerbTag

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                               ^^^^^^^^^^^^^^^
syn match   mgVerbGroup  ' \<V.*'
  \ contains=mgVerbPrio,mgVerbTag,mgVerbMsg


hi def link mgVerbPrio        lcColorVerbosePrio
" hi def link mgVerbTag       Title
" hi def link mgVerbMsg       String


" Debug:
"----------------------------------------------------

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                                           ^^^
syn match   mgDebugMsg         '.*'
  \ contained

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                                  ^^^^^^^^
syn match   mgDebugTag         '[^:]\+: '
  \ contained nextgroup=mgDebugMsg

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                               ^^^
syn match   mgDebugPrio    '\ \<D[\/ ]'
  \ contained nextgroup=mgDebugTag

" 09-02 11:28:03.771  6796  6796 I Tag.Tag: msg
"                               ^^^^^^^^^^^^^^^
syn match   mgDebugGroup  ' \<D.*'
  \ contains=mgDebugPrio,mgDebugTag,mgDebugMsg


hi def link mgDebugPrio      lcColorDebugPrio
" hi def link mgDebugTag       Title
" hi def link mgDebugMsg       String
