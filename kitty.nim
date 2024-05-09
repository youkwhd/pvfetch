import std/streams

proc newKitty*(fpath: string): seq[string] = 
    let fstream: FileStream = newFileStream(fpath, fmRead)
    if isNil(fstream):
        quit(1)

    var line: string
    var kitty: seq[string]

    while fstream.readLine(line):
        kitty.add(line)

    fstream.close()
    return kitty
