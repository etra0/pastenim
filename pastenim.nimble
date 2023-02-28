# Package

version       = "0.1.0"
author        = "Sebastián Aedo"
description   = "A wrapper to arboard clipboard"
license       = "Apache-2.0"
srcDir        = "src"


# Dependencies

requires "nim >= 1.6.8"

const base_path = "./vendor/arboard-ffi/target/debug/"
when defined(Windows):
    const arboard_path = base_path & "arboard_ffi.dll"
else:
    const arboard_path = base_path & "arboard_ffi.dylib"

# TODO: look at nimble tasks
before test:
    with_dir "vendor/arboard-ffi":
        exec "cargo b"