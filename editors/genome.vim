" Vim syntax file
" Language: Genome
" Maintainer: LCOHS
" Latest Revision: 22 Semptember 2022

if exists("b:current_syntax")
  finish
endif

syntax keyword porthKeywords C T G A
highlight default link keywords Keyword

let b:current_syntax = "genome"
