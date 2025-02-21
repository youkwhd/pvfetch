import ansi, std/strformat, std/strutils

const KITTIES* = [
    fmt"""
(>" "<)  
( {RD}={RT}''{RD}={RT})  
c(")-(").""", ]

proc kittyWidth*(kitty: string): int =
  var width = 0

  for line in kitty.split("\n"):
    var 
      i = 0
      length = 0

    while i < line.len:
      if isAnsiCode(line[i..^1]): # TODO: feels slow man
        i += ansiCodeLength(line[i..^1])
        continue

      i += 1
      length += 1

    width = max(width, length)

  return width
