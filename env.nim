import std/tables, std/strutils

proc parseEnv*(str: string): TableRef[string, string] =
  let table = newTable[string, string]()
  let lines: seq[string] = str.splitLines()

  for line in lines:
    if line == "":
        break

    var split = line.split('=', 1)
    split[1].removePrefix("\"")
    split[1].removeSuffix("\"")

    table[split[0]] = split[1]

  return table

proc getEnv*(table: TableRef[string, string], key: string): string = 
  return table[key]
