import kitty

proc main =
  let kitty: seq[string] = newKitty("extra/kitty/1")

  for line in kitty:
    echo line

when isMainModule:
  main()
