
KEYS = {
    'Left Arrow' : 37
    'Up Arrow' : 38
    'Right Arrow' : 39
    'Down Arrow' : 40
    'Space' : 32
}

for code in ['A'.charCodeAt(0)..'Z'.charCodeAt(0)]
    key = String.fromCharCode code
    KEYS[key] = code

for code in ['0'.charCodeAt(0)..'9'.charCodeAt(0)]
    key = String.fromCharCode code
    KEYS[key] = code


KEYS[code] = key for key, code of KEYS

define(KEYS)

###
Others I might want later
       8      Backspace
       9      Tab
      13      Enter
      16      Shift
      17      Ctrl
      18      Alt
      19      Pause, Break
      20      CapsLock
      27      Esc
      32      Space
      33      Page Up
      34      Page Down
      35      End
      36      Home
      37      Left arrow
      38      Up arrow
      39      Right arrow
      40      Down arrow
      44      PrntScrn (see below†)
      45      Insert
      46      Delete
     144      NumLock
     145      ScrollLock
     188      , <
     190      . >
     191      / ?
     192      ` ~
     219      [ { (see below‡)
     220      \ |
     221      ] }
     222      ' "
###
