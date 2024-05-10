import extension/env, std/envvars, std/strutils

proc getOSName*: string =
  let env = parseEnv(readFile("/etc/os-release").strip())
  return env.getEnv("NAME")

proc getUsername*: string =
  return getEnv("USER")

proc getHostname*: string =
  return readFile("/etc/hostname").strip()
