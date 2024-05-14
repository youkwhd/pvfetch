import kitty, sysinfo, extension/sequtils, std/strutils

const MARGIN_RIGHT: uint = 2

proc main =
  let kitty = KITTIES[0]
  let kittyArt = kitty.art.split("\n")

  let uptime = getUptime()
  var uptimev = ""

  if uptime.days > 0: uptimev = $uptime.days & "d "
  if uptime.hours > 0: uptimev = $uptime.hours & "h "
  uptimev = $uptime.minutes & "m"

  let sysinfo: seq[tuple[label, value: string]] = 
    @[("OS", getOSName()),
      ("Shell", getShell()),
      ("Kernel", getKernelVersion()),
      ("Uptime", uptimev)]

  #[TODO(refactor):
      - these prints can be capsulated into functions
      - add colors]#

  stdout.write repeat(" ", kitty.width + int(MARGIN_RIGHT)).join(), getUsername(), "@", getHostname(), "\n"

  assert sysinfo.len >= kittyArt.len
  let n = sysinfo.len - kittyArt.len
  let longestSysinfoLabel = sysinfo.reduce(proc (info: tuple[label, value: string], maximum: int): int = max(len(info.label), maximum), 0)

  for i in 0..n-1:
    stdout.write repeat(" ", kitty.width + int(MARGIN_RIGHT)).join()
    stdout.write sysinfo[i].label
    stdout.write repeat(" ", (longestSysinfoLabel - len(sysinfo[i].label) + int(MARGIN_RIGHT))).join()
    stdout.write sysinfo[i].value, "\n"

  for i, line in kittyArt:
    stdout.write line
    stdout.write repeat(" ", int(MARGIN_RIGHT)).join()
    stdout.write sysinfo[i + n].label
    stdout.write repeat(" ", (longestSysinfoLabel - len(sysinfo[i + n].label) + int(MARGIN_RIGHT))).join()
    stdout.write sysinfo[i + n].value, "\n"

  stdout.write "\n"

when isMainModule:
  main()
