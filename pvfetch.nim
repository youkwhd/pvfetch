import kitty, sysinfo

proc main =
  let kitty: Kitty = newKitty("extra/kitty/1")

  for line in kitty:
    echo line

  echo getOSName()

when isMainModule:
  main()
