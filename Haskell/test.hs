m0 [] = 0
m0 (a:x) = 1 + m0 x

m1 xs = [y |x<-xs,y<-[x,x]]

m2 f [] = []
m2 f (a:x) = f a : m2 f x

m3 item [] = []
m3 item (x:y) | item==x = m3 item y
			  | otherwise = x : m3 item y 

double = (*) 2
dotwice f x = f (f x)
m4 = dotwice double

app a b = a++b