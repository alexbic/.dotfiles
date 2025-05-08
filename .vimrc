" --- Основы ---
set nocompatible           " Отключить совместимость с vi
syntax on                  " Включить подсветку синтаксиса
set encoding=utf-8         " Кодировка интерфейса
set fileencodings=utf-8    " Кодировки файлов

" --- Поведение клавиш ---
set backspace=indent,eol,start " Нормальный Backspace
set mouse=a                    " Включить мышь во всех режимах

" --- Интерфейс ---
set number                    " Показывать номера строк
set relativenumber            " Относительные номера (для быстрого перемещения)
set cursorline                " Подсвечивать текущую строку
set showcmd                   " Отображать команды в правом нижнем углу
set ruler                     " Показывать позицию курсора
set laststatus=2              " Всегда показывать строку статуса
set wildmenu                  " Меню автодополнения команд

" --- Поиск ---
set ignorecase                " Игнорировать регистр при поиске
set smartcase                 " Но учитывать регистр, если есть заглавные буквы
set incsearch                 " Пошаговый поиск
set hlsearch                  " Подсветка результатов поиска

" --- Отступы ---
set tabstop=4                 " Ширина таба
set shiftwidth=4              " Ширина отступа для автоотступов
set expandtab                 " Использовать пробелы вместо табов
set autoindent                " Автоотступ при вводе
set smartindent               " Умный отступ для кода

" --- Цвета и графика ---
set termguicolors            " TrueColor (если терминал поддерживает)

" --- Типы файлов и плагины ---
filetype plugin indent on     " Включить плагины и автоотступ по типу файла

" --- Буферы ---
set hidden                    " Позволяет переключаться между файлами без сохранения

" --- Безопасность ---
set nobackup                  " Не создавать backup-файлы
set nowritebackup             " Не создавать резервную копию при записи
set noswapfile                " Отключить swap-файлы

" --- Визуализация символов (по желанию) ---
" set list                     " Показывать скрытые символы (опционально)
" set listchars=tab:→\ ,trail:·,extends:»,precedes:«
