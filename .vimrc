" --- Основы ---
set nocompatible           " Отключить совместимость с vi
syntax on                  " Включить подсветку синтаксиса
set encoding=utf-8         " Интерфейс в UTF-8
set fileencodings=utf-8    " Кодировка файлов

" --- Поведение клавиш ---
set backspace=indent,eol,start " Backspace работает "нормально"
set mouse=a                    " Включить мышь везде

" --- Интерфейс ---
set number                    " Обычные номера строк
" set relativenumber          " Отключено, чтобы не прыгали номера
set cursorline                " Подсветка текущей строки
set showcmd                   " Отображать вводимую команду
set ruler                     " Показывать позицию курсора
set laststatus=2              " Строка статуса всегда видна
set wildmenu                  " Удобное меню команд

" --- Подсветка строки и номера ---
hi CursorLine term=bold cterm=bold ctermbg=236 guibg=#3a3a3a
hi LineNr ctermfg=darkgray
hi CursorLineNr ctermfg=yellow cterm=bold

" --- Поиск ---
set ignorecase               " Без учета регистра
set smartcase                " Но учитывать, если есть заглавные
set incsearch                " Интерактивный поиск
set hlsearch                 " Подсвечивать совпадения

" --- Отступы и табы ---
set tabstop=4                " Отображение таба — 4 пробела
set shiftwidth=4             " Отступы тоже 4
set expandtab                " Превращать таб в пробелы
set autoindent               " Автоматический отступ
set smartindent              " Умный отступ

" --- Цвета и графика ---
set termguicolors            " TrueColor (если терминал умеет)

" --- Плагины и типы файлов ---
filetype plugin indent on    " Автонастройки по типу файла

" --- Работа с файлами ---
set hidden                   " Можно переключаться без сохранения
set nobackup                 " Не создавать .bak файлы
set nowritebackup            " Не делать временную копию при записи
set noswapfile               " Без .swp файлов

" --- Подсветка пробелов (по желанию) ---
" set list
" set listchars=tab:→\ ,trail:·,extends:»,precedes:«
"
"
" Указание дополнительного пути для кастомных цветов
set runtimepath+=~/.myshell/vim
" --- Цветовая схема ---
set background=dark          " Темная тема
colorscheme PaperColor       " Мягкая, не контрастная схема


