# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.
{.passL:".\\vendor\\arboard-ffi\\target\\debug\\arboard_ffi.lib".}

type 
  Clipboard* {.incomplete_struct.} = object
  Status* {.pure.} = enum
    Ok = 0x0'u8, Error

proc clipboard_new*(cb: ref ref Clipboard): Status {.stdcall, importc: "clipboard_new".}
