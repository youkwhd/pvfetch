import extension/env

proc getOSName*: string =
  let env = parseEnv(readFile("/etc/os-release"))
  return env.getEnv("NAME")
