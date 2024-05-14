import ansi, std/strformat

type Kitty* = object
  width*: int
  art*: string

#[ Hard coding the width feels wrong,
   but that's what I can afford for now ]#

const KITTIES* = [
  Kitty(
    width: 9,
    art: fmt"""
(>" "<)  
( {RD}={RT}''{RD}={RT})  
c(")-(")."""),
]
