const base_path = "./vendor/arboard-ffi/target/debug/"
when defined(windows):
  const arboard_path = base_path & "arboard_ffi.dll"
elif defined(osx):
  const arboard_path = base_path & "libarboard_ffi.dylib"
else:
  const arboard_path = base_path & "libarboard_ffi.so"

{.push dynlib: arboard_path.}

type 
  ClipboardObj {.incomplete_struct.} = object
  Clipboard* = ptr ClipboardObj
  Status* {.pure.} = enum
    Ok = 0x0'u8, Error

proc clipboard_new(cb: ptr Clipboard): Status {.cdecl, importc: "clipboard_new".}
proc clipboard_set_text(cb: Clipboard, text: cstring, len: uint64): Status {.cdecl, importc: "clipboard_set_text".}
proc clipboard_get_text(cb: Clipboard): cstring {.cdecl, importc: "clipboard_get_text".}
proc destroy_string(p: cstring) {.cdecl, importc: "destroy_string".}

{.pop.}
