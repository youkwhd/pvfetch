proc reduce*[S, T](s: seq[T], op: proc (acc: T, val: S): S, initial: S): S =
  var initial = initial

  for v in s:
    initial = op(v, initial)

  return initial
