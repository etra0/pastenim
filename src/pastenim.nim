include pastenim/internal
# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

proc clipboard_new*(): Clipboard =
  let status = clipboard_new(result.addr)
  if status != Status.Ok:
    raise newException(OSError, "Cannot create clipboard")

proc set_text*(cb: Clipboard, text: string): Status =
  let cstr = text.cstring
  return clipboard_set_text(cb, cstr, cstr.len.uint64)
