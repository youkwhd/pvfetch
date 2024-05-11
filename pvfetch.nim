import kitty, sysinfo, std/sequtils, extension/sequtils, std/strutils

const MARGIN_RIGHT: uint = 2

proc main =
  let kitty: Kitty = newKitty("extra/kitty/1")
  let longestLine = kitty.longestLine()

  let uptime = getUptime()
  let sysinfo: seq[tuple[label, value: string]] = @[("OS", getOSName()), ("Kernel", getKernelVersion()), ("Shell", getShell()), ("Uptime", ($uptime.days & "d " & $uptime.hours & "h " & $uptime.minutes & "m"))]
  let longestSysinfoLabel = sysinfo.reduce(proc (info: tuple[label, value: string], maximum: int): int = max(len(info.label), maximum), 0)
  assert sysinfo.len >= kitty.len

  #[TODO(refactor):
      - these prints can be capsulated into functions
      - add colors]#
  stdout.write repeat(" ", (longestLine + int(MARGIN_RIGHT))).join(), getUsername(), "@", getHostname(), "\n"

  let n = sysinfo.len - kitty.len
  for i in 0..n-1:
    stdout.write repeat(" ", (longestLine + int(MARGIN_RIGHT))).join()
    stdout.write sysinfo[i].label
    stdout.write repeat(" ", (longestSysinfoLabel - len(sysinfo[i].label) + int(MARGIN_RIGHT))).join()
    stdout.write sysinfo[i].value, "\n"

  for i, line in kitty:
    stdout.write line
    stdout.write repeat(" ", (longestLine - len(line) + int(MARGIN_RIGHT))).join()
    stdout.write sysinfo[i + n].label
    stdout.write repeat(" ", (longestSysinfoLabel - len(sysinfo[i + n].label) + int(MARGIN_RIGHT))).join()
    stdout.write sysinfo[i + n].value, "\n"

when isMainModule:
  main()
