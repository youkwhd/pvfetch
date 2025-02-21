import std/strutils

const
    ANSI_BLACK* = "\e[0;30m"
    BK* = ANSI_BLACK
    ANSI_RED* = "\e[0;31m"
    RD* = ANSI_RED
    ANSI_GREEN* = "\e[0;32m"
    GN* = ANSI_GREEN
    ANSI_YELLOW* = "\e[0;33m"
    YW* = ANSI_YELLOW
    ANSI_BLUE* = "\e[0;34m"
    BE* = ANSI_BLUE
    ANSI_PURPLE* = "\e[0;35m"
    PE* = ANSI_PURPLE
    ANSI_CYAN* = "\e[0;36m"
    CN* = ANSI_CYAN
    ANSI_WHITE* = "\e[0;37m"
    WE* = ANSI_WHITE

    ANSI_RESET* = "\e[0m"
    RT* = ANSI_RESET

proc isAnsiCode*(str: string): bool =
  if not str.startsWith("\e["):
    return false

  return str.contains("m")

proc ansiCodeLength*(str: string): int =
  if not isAnsiCode(str):
    return 0

  return str.find("m") + 1
