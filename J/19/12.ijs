moons =: (|: 4 3 $ 3 2 _6 _13 18 10 _8 _1 13 5 10 4) ,. (3 4 $ 0)

dv =: [: ([: +/ [: * [ -/ [) 4&{.    
dp =: 4 |.!. 0 ]                     
step =: ] + dp"1 + [: (] ,. ]) dv"1  

energy =: [: +/ [: 4&{. [: (] * 4&|.) [: +/ |

period =: 4 : 0
z =. step y [ i =. 1 [ y =. 1 8 $ x { y
while. -. z -: y
do.
  z =. step z
  i =. i + 1
end.
i
)

(energy step ^: 1000 moons); *./ period&moons"0 i.3

