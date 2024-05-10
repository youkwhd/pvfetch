import kitty, sysinfo

proc main =
  let kitty: Kitty = newKitty("extra/kitty/1")
  let longestLine = kitty.longestLine()

  let username = getUsername()
  let hostname = getHostname()
  let kernelVersion = getKernelVersion()
  let arch = getArchitecture()
  let shell = getShell()

  echo username, "@", hostname
  echo kernelVersion
  echo arch
  echo shell
  
  for line in kitty:
    echo line

  echo getOSName()

when isMainModule:
  main()
