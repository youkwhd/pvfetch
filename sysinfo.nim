import extension/envvars, std/envvars, std/strutils, std/paths, std/math

proc getOSName*: string =
  let env = parseEnv(readFile("/etc/os-release").strip())
  return env.getEnv("NAME")

proc getKernelVersion*: string =
  return readFile("/proc/sys/kernel/osrelease").strip()

proc getArchitecture*: string =
  return readFile("/proc/sys/kernel/arch").strip()

proc getShell*: string =
  let shellPath = cast[Path](getEnv("SHELL"))
  return cast[string](extractFilename(shellPath))

proc getUsername*: string =
  return getEnv("USER")

proc getHostname*: string =
  return readFile("/etc/hostname").strip()

proc getUptime*: tuple[days, hours, minutes: int] =
  # In seconds
  let uptime = readFile("/proc/uptime")
                .strip()
                .split(" ")[0]
                .parseFloat()

  # One .. represented in seconds
  let oneMinute: float = 60 * 1
  let oneHour: float = 60 * oneMinute 
  let oneDay: float = 24 * oneHour 

  let days: float = floor(uptime / oneDay)
  let hours: float = floor((uptime - (days * oneDay)) / oneHour)
  let minutes: float = floor((uptime - (days * oneDay) - (hours * oneHour)) / oneMinute)

  return (int(days), int(hours), int(minutes))
