fun length []        = 0
|   length (x::xs)   = 1 + length xs

val res = length [1,2,3]

fun map f [] = []
  | map f (x::xs) = (f x) :: (map f xs)

val res1 = map length [[], [1], [1,2], [1,2,3]]

val res12 = foldr (op -) 0 [1,2,3,4]

val res13 = foldl (op -) 0 [1,2,3,4]

