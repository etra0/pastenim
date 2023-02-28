include pastenim/internal

proc clipboard_new*(): Clipboard =
  let status = clipboard_new(result.addr)
  if status != Status.Ok:
    raise newException(OSError, "Cannot create clipboard")

proc set_text*(cb: Clipboard, text: string): Status =
  let cstr = text.cstring
  return clipboard_set_text(cb, cstr, cstr.len.uint64)
