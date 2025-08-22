Copy selected text to file
   1. Select text in visual mode
   2. :'<,'>!tee out.txt

Insert dashes and tab at line beginning for four lines
	:,+3s/^/--\t

# Commands {{{1

Edit command layout. [] indicates optional
    [count] {operator} {[count] motion|text object}

Edit tips:
"object-action" selection: 
   vipd - visually select and delete para


# Help {{{1

	Jump
		C + ]/o     follow links forward/back

	:help a/A   help for normal mode a, Shift+A


# Variables {{{1

	set/setlocal - sets options
		no-arg	shows non-default settings
		all		shows all settings in categories
		var=val	set value
		var+=val	append val
		var?		how value
		var&		reset to default

	let -
	assigns value to internal variable
	environment vars (incl '~') not expanded
	prefixes:
		g:    global variables
		b:    local buffer variables
		w:    local window variables
		t:    local tab page variables
		s:    script-local variables
		l:    local function variables
		v:    Vim variables.

	variables
	let var-name = exp
			set internal var
	let $env = exp
			set environment var
	let @reg-name = exp
			set register to exp
	let &option-name = exp
			set option local & global 

# Startup & Settings {{{1

-u vimrc
	Start vim initializing with vimrc (no other vimrc is used)
	Default vimrc may be in /usr/local/share/vim
	-u NORC to disable all config
	-u NONE

Save current settings in a exrc file:
	:mk(exrc)

runtimepath
	$VIMRUNTIME + ~/.vim, $VIM/vimfiles etc.

Debian standard for 3rd party plugins is /usr/share/vim/addons
				
smartcase		(scs)	
        no ignore case when pattern has uppercase
        ignorcase must be on.  
        Used for the commands "/", "?", "n", "N", ":g" and ":s".  


Modeline
    default on
    modeline must be set and modelines => 0 to be enabled
    syntax
            [text]<white>]{vi:|vim:|ex:}[white]{options}
            WS before vim is required if text before.
    options
            list of option settings separated with ws or ':'
    examples
            vim:ts=4
            " vim:ts=4 sw=4
            /* vim:set ai et sts=2 sw=2 tw=80: */   #this format when comment needs closing 

# Interface settings {{{1

Cursorline
   Highlights or underlines current line

Status line - laststatus
   create		ls=2
   show status		Ctrl+G

cmdheight		
    # of screen lines in command output

titlestring 
    set titlestring=New\ Title
    set titlestring=%{&statusline}\ %F

Show/Display Line Numbers
  set number/nu, nonumber/nonu	show,hide line numbers
  n,n#	temporarily show numbers on lines n,n
  .=	show current line number

Colours
	Show current colorscheme
		 :let colors_name

Show tabs & line endings
	set list 
        tabs CTRL-I
        end of line $
        see listchars

Relative line numbering 
    see # of line from insertion point
    set rnu 

Files/Buffers {{{1

Opening, Closing, & Saving
cd -	cd to previous directory
%:h		make current dir dir of current file
e +/pat open at pat
e +		open at end
r		read in file

bro[wse] {command} [dir name] for commands including :e & :w, open a file browser.

buffer list
	&		filename of current buffer 
	#		alternate buffer file name
	+		indicates modified

BUFFER LIST COMMANDS
	nC-^					switch to last or buf n
	:buffer [n]				to buf n
	:bnext/bNext [n]		to nth next/previous buffer
	:N,Mbdelete [n]			delete buffers N-M incl. from file list
	:bdelete x y z			delete buffers x,y,&z
	:b[bn | fn]		edit buffer # or file_name. Use :sb for split & edit in same way.
	:bad[d] fn		add fn to file list
	:x[it]	Write file if changed and exit.  Hides current buffer if more windows(?)
	:q!		Quits but does not abandon changed hidden buffers (use :quall! for this)

	:w
		write & quit, but only write the lines in [range].
		if file given, it becomes alternate (#)
			:[range]wq[!] [file]	
		copy file and open original in other window
			:w foobar | sp #
			like: C-W, C-^ (split, edit alternate)kk
		write buffer or lines to external command
			[range]w[rite] [++opt] !{cmd}
			eg Python script quick run
				:w !python3 - writes buffer to python


Buffer types:
	active: file loaded and displayed.	In ls as ' '
	hidden: 
		file loaded but not displayed.	In ls as 'h'
		unset to not retain abandoned buffers
	inactive:		not loaded.  Options for buffer will be remembered.  In ls as '-'
	hidden 
		to enable hidden buffers.
		'q!' will fail if there are changed, hidden buffers.  
		'x' to exit as it saves current buffer, hides it, and unhides any changed hidden buffer.
		buffers will be hidden even if unchanged with hid[e], clo[se], and on[ly].

eol styles
	dos- <nl><cr>, unix- <nl>
	if you try to open a unix file in notepad, you see a box character
	(nl's) at line ends but no linebreaks.
	if you try to open a dos file in a unix only editor, you see '^m' (cr's)
	characters before the line breaks.
	convert a file from dos to unix eols: set ff=unix
		:se[t] ff=dos, ff=unix
	remove ^m eol from unix file on windows
		:%s/<ctrl-v><ctrl-m>//g
		:%s/\r//g  (better)
		also: cygwin/utils u2d & d2u

Windows & Tabs {{{1

vertical = sideways
horizontal = top to bottom

Ctrl w +

New
      n


Create with split
    sp      horizontal split
    vs      vertical split
    sb      split buffer
    sba     split all buffers horizontal
    vert sba     split all buffers vertical

Move Between Windows
     c-w (twice)  Last window
     arrow key    move to window in direction of arrow
		w				Move to window below (wrap)
		W				Move to window above (wrap)
		j				Move to window below
		k				Move to window above
		b						to bottom buffer
		t						to top buffer

Closing
      o              only - close all other windows
		c, :close		Hide buffer - edit next window
		q (or :q ?)		Quit editing & close window
        :on[ly]             close all but current

Sizing
	Height
		#_				height = #
      _           full height (zoom)
		N+,-        increase/decrease height * n
		z{height}<CR>		resize window height (?)
		res[ize] +-n | n
	Width
		n|			width = N
      |           full width (zoom)
		n <,>      reduce/increase with * n
    Restore
		=			make equal size

Rotating 
    with move commands: 
        Move to the side when stacked creates vertical layout
        Move up or down when side by side to create stacked layout
    r/R				rotate window


                        zoom window
layout
		mkview [n], loadview [n]   - saves window options including folds

Preview window
    pedit <file>    open
    C-W z           close

Tabs 
	c-w T       Move window to tab
	gt/T        Move to next/previous tab
	:tablonly   Close tabs, retain current window
	:tab split      open split window into own tab and displays tab bar

        
# Edit Modes {{{1
## Normal mode {{{2

r			change character
c			change line of text.  Type . to stop replacing
co[py]		
:t			synonym for copy.
			copy to below the line given by {address}.  
d x [n]		delete [n] lines into register x.
								  Specifier for n can be in before or after position.
m[ove] {address}		
			move the lines to below the line given by {address}.
pu[t] [x]	put the text [from register x]
r<char>	replace char
r<CR>		insert line break

		
	
y[ank] [x]	yank [range] lines [into register x].
y[ank] [x] {count}
			 yank {count} lines, starting with last line number
				  in [range] (default: current line [into register x].

Repeat last edit: .

Repeat change on multi lines (e.g. commenting all)
1. Visual block mode C-v and select lines
2. I  (Insert mode from start of line)
3. Make change
4. Esc

## Normal mode edit then enter Insert mode {{{2

	i/a		Insert before/after cursor
	I/A		Insert before first non-blank in line/end of line
	o			Open line below
	O			Open line above
   gi       go to last edit and insert
	gI			insert text at column 1
	cc/C		change whole line/to end of line
	[n]s		subsitute [n] letters then edit
	[n]S		substitue linewise


## Edit with markers {{{2

i<marker>
	Edit within markers
	Marker = ([{<"
	When used with edit commands, affects text within marker pairs
t<marker>
	Edit until marker





## Insert mode {{{2

To normal mode from insert
    c-[, c-c

Run normal or command mode commands from Insert mode
    ctrl+v[Escape key]:command
   

Edit
   deletions
        word left           c-w		
        character left      c-h / BS	
        under cursor        Del / Alt+BS 
        all characters on current but not tabs      c-u

Indents         
   c-i / Tab    Insert 1 sw indent at insertion point
   C-t/d        Insert, delete 1 shiftwidth indent at start of line
   0 CTRL-D		 delete all indent in the current line
   ^ CTRL-D		 delete all indent in the current line, restore in next line (?)

?
	C-V    Insert next non-digit literally
	C-O		Next one keystroke in normal mode


# Cursor Movement {{{1


Character
	h/l     left/right
	space	move right


Words
	w/W	beginning of next word
	b/B	move to beginning of current word
	e/E	move to end of current word
	*/#	to next/prev word under cursor

Line
	j/k		up/down
	^/g_		non blank on current line
	+,-		non blank in column 1 on following/previous line

Sentences etc.
)(		sentences forward, backward
{,}		move by paragraphs or blocks
}{		paragraphs forward, backward
]],[[	sections, forward, backward, start of sect
][,[]			""				, end of sect

Move to Character
   t/T	go right/left to left of char
   f/F	as above but onto char
	repeat latest f, t, F or T: ;				


Screen
	Top/middle/bottom   H/M/L
	c-u/d	cursor up/down half screen, cursor to first line
   C-f   Moves screen down one page, cursor to first line
   c-b   Moves screen up one page, cursor to last line

		
# Scrolling {{{1

    C-e			down 1 line, 1/2 screen down
    C-y			up		"
    z commands - scroll according to cursor position
         z<CR>/zt		current line to top
         zz | z.     current line to centre
         zb          current line to bottom
        
# Jumps {{{1

Jump to last edit: ctrl o

Go to newer/older position in jump list. Can use to move between two files or within a file	
   ^o/^i	
   g; / g,

jump back/forward to last edit 
jump to last edit & Insert
   gi

''    return to line cursor on before jump
``    return to cursor position before jump
'.    jump to last changed line    
%     jump to corresponding item, e.g. brace to brace

Insert from Clipboard or file {{{1

Foolproof paste
	:r! cat 
	Ctrl-v
	Ctrl-d

Special Inserts:
	:[n]r[ead] fn	insert file to line n or at current line
	:r! cmd			insert so from cmd below



Formating {{{1

commands
        gq[motion]		
                Format lines motion moves over.  Textwidth option controls the length
                of each formatted line.  If textwidth is 0, the formatted ine length
                is the screen width (max 79) minus the value of any wrapmargin
                setting.
        gqq				Format current line
        gqj		Format current and next line
        gq}		Format till end of paragraph

joinspaces		Insert 2 spaces after join command

formatoptions (fo)
        now crnqo
        comment options - croq
                c - restrict auto-formatting to comments
        auto formatting - tw must be > 0
                a - turn on auto-formatting
                t - auto-wrap by tw 
                c - auto-wrap comments
        w - lines w/o a trailing ' ' not formatted (e.g. wrapped prose text
        will get rewrapped, list lines ended by CR's not)
				
						
Line Wrappping/Breaks, Indenting and Tabs {{{1

Wrapping
	wrap and insert EOL's
	- Static Wrapping: Wrapping (and insertion of EOL) ocurrs when tw is
	  reached or, if tw=0, value of wrapmargin number of characters from
	  right side of window.
	- wrapmargin, wm - Number of characters from the right window border
	  where wrapping starts.  When typing text beyond this limit, an <EOL>
	  will be inserted and inserting continues on the next line.  When
	  'textwidth' is non-zero, this option is not used. wm and tw both
	  insert line breaks.
Dynamic Wrapping: 
	linebreak, lbr 
			Lines will wrap at a character in 'breakat' rather than at last character in screen. 
			Unlike 'wrapmargin' and 'textwidth', does not insert EOLs.
Indenting
	smartindent ('si')
			Use this when coding in Python.  ai should be on as well.
	Indent by text object
		>ap		Indent current paragraph (by motion)
		n>>		same, by count (>>n ?)
	C-T/C-D	Insert/delete 1 shiftwidth

Tabs
    expandtab               insert spaces instead of tabs
	'smarttab', 'sta'		use 'shiftwidth' when inserting <Tab>
	'softtabstop', 'sts'	number of spaces that <Tab> uses while editing
	:s/^ \+/^I				(not \w, which means blanks or tabs)
		If the 'shiftround' option is on, the indent is rounded to a multiple of
		'shiftwidth'.

ret[ab]!    Recalc tabs in a buffer
	line retab!
	file %retab!

Convert tabs to spaces
    ts=4
    se expandtab
	%retab!

Registers {{{1

show registers
	:reg


names
	register name prefix: "
	"	anonymous register
	+	clipboard  
            used by modern apps for cut/copy/paste ops selection behavior.
            main paste register.  Not used by xterms
	*      X-Primary register, stores current selection (CUT BUFFER0 of 8)
            use for transfer to/from xterm
	:      last executed cmd

Normal mode syntax for using register as target of y or d or as source
		{Visual}"n[ydp]{motion}
				y`a				copy text from mark a to line before current line
				"ayy	copy line into register a
				"ad`a	cut text from mark a to current position into register a
				"aA				Append text to buffer a

copy/paste to/from reg
	"<reg>ye	
		copy word to reg
	Ctrl R<reg>
		insert text -  Insert mode
	"<reg>p/P
		paste before/after cursor
	"<reg>gp/gP
		cursor left after text


previous insertions
  c-a (?)
previous insertions, exit Insert mode
  c-2 / c-@

assign to a register (help 'let-@')
   let @a=" ... " 

execute contents of register
		@<reg name>

paste last ex command
    ":p

edit register
		"ap
		<edit lines>
		"ad


Cmd mode register
		:'a,'bs/thing/ThinG/

	Insert (paste) register n
		C-R"n
		C-R C-A/C-W             insert word/Word under cursor
	let @a=" ... " - assign to a register (help 'let-@')

insert text from buffer or register into cmd or search
		  ^R commands

Marks {{{1 

ma			set mark with alpha char

`a		   go to mark
'ma		go to beginning of line with mark		

Tags {{{1

:ts /pat	tag select arg is a regex

Search and show {{{1

*, g*	search forward for whole word, word under cursor
#, g#	as above, backward


/ ?				Search forward/backward
/CR				Repeat search, forward
?CR				Repeat search, backward 

Find tabs & spaces
    " Show all tabs:
    /\t
    " Show trailing whitespace:
    /\s\+$
    " Show trailing whitespace only after some text (ignores blank lines):
    /\S\zs\s\+$
    " Show spaces before a tab:
    / \+\ze\t

Folding {{{1

Option to include fold markers within a comment
        e.g. set cms=..\ %s   'docutils comment format

Foldlevel: 
   start folding at level #
   higher foldlevel = more branches open
        zm		- fold more - subtracts 1 from fl. (less shown)
        zr		- fold less - adds 1 to fl. (more shown)
        zR		- open all
        zM		- fold all
Opening
        Nzo		Open N fold levels under cursor
        zO		Open all folds under cursor
        zc to close a fold
        zC to close it all the way
        zo to open it
        zO to open it all the way
        zr/R	reduce 1/reduce all folding


Python file settings {{{1
		http://www.vex.net/~x/python_and_vim.html
		set ts=4
		set sw=4
		set expandtab
		set softtabstop=4
		set autoindent
		autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class



Filter {{{1

[I				show lines matching word under cursor

Filter ex mode output
   :filter /pat/ cmd

Ex/command Mode {{{1

Syntax: line address/pattern/command

Command Line 
		Accelerator keys
				Ctrl B			Line beginning
				Ctrl E			Line ending
				Ctrl U			Delete line to left
		@:		repeat last ex command

Insertions
	C-R
		C-A	insert word under cursor


q:	display Ex history, can edit and reexecute

Ex output to file
   redir >file
   redir END

Ex output to buffer
   redir @a
   scriptnames
   redir END
   new
   "aP

   redir >file

substitute
        :%s/\s\+$//e
        :%s to run :substitute over the range %, which is the entire buffer.
       \s t match all whitespace characters.
        \+ to repeat them 1 or more times.
        $ to anchor at the end of the line.
        The e flag to not give an error if there is no match 
            (i.e. the file is already without trailing whitespace).
        &		repeat last substitution


Line Addressing and searching in Ex mode {{{2

http://vimregex.com/

magic	Enables extended regular expressions (eg \s)


:range s[ubstitute]/pattern/string/cgiI
    For each line in the range replace a match of the pattern with the string where:
    c   Confirm each substitution
    g   Replace all occurrences in the line (without g - only first).
    i   Ignore case for the pattern.
    I   Don't ignore case for the pattern.


Line addressing
 .		current line
 $		last line
 %		all lines - shorthand for 1,$
:n,n+o	Line address range with offset.  Extends match range.
.+3		 three lines below cursor

{count}:		
		start entering an Ex command with range from current line to N
		lines down

Example
Search for a pattern.  Refer to pattern in following substitude command
/[(,)]
:s//\r&/g



Ex Examples {{{1

20,30 m 40
20,30g/blah         search within range
g/blah/ m 0

%s/$/thing			append 'thing' to every line

g/blah/ norm A;     apply normal mode command to a range
g/blah/ @a          apply macro to a range


Counts {{{2

Some commands allow for a count after the command.	This count is used as
the number of lines to be used, starting with the line given in the last
line specifier (the default is the cursor line).  The commands that accept
a count are the ones that use a range but do not have a file name argument
(because a file name can also be a number).
		Examples:
				:s/x/X/g 5		substitute 'x' by 'X' in the current line and four following
				lines 
				:23d 4			delete lines 23, 24, 25 and 26
		count before entering ":" 
				this is translated into:
						:.,.+(count - 1) In words: The 'count' lines at and after the cursor.
						Example: To delete three lines:
						3:d<CR> is
						translated into: .,.+2d<CR>

Programming/functions {{{1

See introductory info on control statements, functions and
autocommands in 'starting.txt.'
Path separator is '/' on all OS's.	Path strings are therefore not quoted.

macro
https://sanctum.geek.nz/arabesque/advanced-vim-macros/

	record 
		qq		record to q (to label macro as 'q')
		enter commands
		q
	play	nqq		play n times 

expressions
   e ? e : e
		if, then, else
   ||, &&, ==
		OR, AND, equal

Scripts
	must end in .vim and be saved on runtime path

	List loaded scripts
		scriptnames


Examples {{{2

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
And then use it like:

:call TrimWhitespace()

Markup Editing (XML, HTML) {{{1

map shortcuts to apply markup to selected text
		examples:
				:vmap sb "zdi<b><C-R>z</b><ESC>
						map visual mode 'sb' to markup selected tag with bold tag
%		match bracket (braket?) or tag
Vim as an XML editor manual
		http://tritarget.com/vim/xml-plugin/doc/xml-plugin.txt
		set foldmethod=syntax
search for matching element names
		/^R^A   inserts name under cursor incl brackets
		/^R^W   inserts name under cursor		

Mapping {{{1

http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
http://learnvimscriptthehardway.stevelosh.com/chapters/03.html
Finding keys: help map-which-keys

Show current maps: map
Types: map (normal + visual), nmap, vmap, imap (normal, visual, insert modes)

Special keys:
	Escape		<Esc>
	Return		<CR>
	Control		<c-X>

Chain commands	\| or <Bar>

imap example:
	:imap <c+d>	<esc>ddi	(i at end returns to insert mode)

Terminal & Shell {{{1

Terminal
https://github.com/vim/vim/blob/master/runtime/doc/terminal.txt


:!cmd		Run a single command in shell
:x,y!command	execute external command on lines x - y
"!cmd %     refer to current file in command

:sh		Go to shell.  "Exit" to return.

:r[ead] !{cmd}			
		Execute {cmd} and insert its standard output below the cursor.

:[range]w !cmd
    Execute cmd with range lines (or whole buffer if not specified) as stdin

view (in shell)			Open a file in vi in read only mode


Debugging Vim {{{1

http://vim.wikia.com/wiki/Displaying_the_current_Vim_environment

Start with no config:
    vim -u NONE

Show 
	where an option was set:
		:verbose set ft?

	Scripts called on startup     scriptnames

   set verbose=9
   set verbosefile=~/tmp/vim_startup.txt

   vim -V9 file.text

Display: 
  plugin loading at startup
	vim -V2
  vimtimescripts sourced
  functions called
		functions



vim:fdm=marker
