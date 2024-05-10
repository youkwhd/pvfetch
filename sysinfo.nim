import extension/envvars, std/envvars, std/strutils, std/paths

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
