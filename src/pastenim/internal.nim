{.push dynlib:".\\vendor\\arboard-ffi\\target\\debug\\arboard_ffi.dll".}

type 
  ClipboardObj {.incomplete_struct.} = object
  Clipboard* = ptr ClipboardObj
  Status* {.pure.} = enum
    Ok = 0x0'u8, Error

proc clipboard_new(cb: ptr Clipboard): Status {.stdcall, importc: "clipboard_new".}
proc clipboard_set_text(cb: Clipboard, text: cstring, len: uint64): Status {.stdcall, importc: "clipboard_set_text".}

{.pop.}