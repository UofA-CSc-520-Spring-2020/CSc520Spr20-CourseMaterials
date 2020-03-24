fun length []        = 0
|   length (x::xs)   = 1 + length xs

val res = length [1,2,3]

fun map f [] = []
  | map f (x::xs) = (f x) :: (map f xs)

val res1 = map length [[], [1], [1,2], [1,2,3]]

