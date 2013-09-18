This is a vim plugin that helps you filter, sort and remove duplicates from the
quickfix list and the location list.

vim-qfmanip is written in pure vimscript (no need for Python nor Perl).

Mapping prefix
--------------
The default prefix for mappings are `_q` for quickfix list and `_l` for
location list. They are customizable.

Filter mappings
---------------
Four (customizable) mappings are provided. All mappings trigger a prompt for a
pattern. If given the empty pattern, current search pattern will be used
instead.

 * `<prefix>F` to discard all entries for which the buffer name matches /pat/
 * `<prefix>f` to only retain entries for which the buffer name matches /pat/
 * `<prefix>P` to discard all entries for which the line text matches /pat/
 * `<prefix>p` to only retain entries for which the line text matches /pat/

Sorting and duplicate removal mappings
--------------------------------------
Three (customizable) mappings are provided:

 * `<prefix>s` to sort the list by buffer name and line
 * `<prefix>u` to remove adjacent duplicate
 * `<prefix>U` to perform both operations

Note: these three commands do not keep the old list in history: commands such
as `:colder` or `:lolder` will not work.

Installation
------------

If you have the Pathogen plugin installed or any other plugin manager, then
just copy this filetree into a subfolder of your Bundle folder.

Otherwise, copy the contents of the `doc/`, `plugin/`, `after/` and `autoload/`
folders to resp.  `~/.vim/doc`, `~/.vim/plugin`, `~/.vim/after` and
`~/.vim/autoload` respectively.

Development
-----------

The main git repository for this plugin is at
`http://github.com/salsifis/vim-qfmanip`

License
-------

zlib/libpng license.

Copyright (c) 2012 Benoit Mortgat

This software is provided 'as-is', without any express or implied warranty. In
no event will the authors be held liable for any damages arising from the use
of this software.

Permission is granted to anyone to use this software for any purpose, including
commercial applications, and to alter it and redistribute it freely, subject to
the following restrictions:

1. The origin of this software must not be misrepresented; you must not claim
   that you wrote the original software. If you use this software in a product,
an acknowledgment in the product documentation would be appreciated but is not
required.

2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.

3. This notice may not be removed or altered from any source distribution.
