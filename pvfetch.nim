import kitty, sysinfo

proc main =
  let kitty: Kitty = newKitty("extra/kitty/1")
  let longestLine = kitty.longestLine()

  let username = getUsername()
  let hostname = getHostname()

  echo username, "@", hostname
  
  for line in kitty:
    echo line

  echo getOSName()

when isMainModule:
  main()
