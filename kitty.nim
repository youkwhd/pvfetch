import std/streams

type Kitty* = seq[string]

proc newKitty*(fpath: string): Kitty =
  let fstream: FileStream = newFileStream(fpath, fmRead)
  if isNil(fstream):
    quit(1)

  var line: string
  var kitty: Kitty

  while fstream.readLine(line):
    kitty.add(line)

  fstream.close()
  return kitty
