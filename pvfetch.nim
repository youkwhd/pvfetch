import kitty

proc main =
  let kitty: Kitty = newKitty("extra/kitty/1")

  for line in kitty:
    echo line

when isMainModule:
  main()
