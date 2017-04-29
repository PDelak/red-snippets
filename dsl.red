Red []

; current red limitations
; cannot include macros
; #include directive does not work correctly for that case
; cannot generate macro from macro

#do [
  str: "patrick"
  #system [
    s: declare struct! [i [integer!] b [byte!]]
    obj: s
  ]
]

#do [  
  str2: "monika"
  invoke0: func[f] [do [f]]
  invoke1: func[f arg] [
    bl: []
    append bl 'f
    append bl 'arg
    do bl
  ]

]


#macro test: function []
[
  foo0: func[] [print "hello"]
  foo1: func[str] [
    loop 5 [print "hello"]
    print str
  ]
  invoke0 :foo0  
  invoke1 :foo1 "milosz"
  return []
]


foo: func[] [print "hello"]
invoke0: func[f] [do [f]]
invoke0 :foo

test

#macro defType: func[name code] [return []]
#macro defFunc: func[name params code] [return []]
#macro defScript: func[name code] [return []]
#macro defVertex: func[name code] [return []]
#macro defEdge: func[name code] [return []]
#macro struct-template: func[name params code [block!]] [
  foreach word code [
  ]
  return []
]

#macro compile: func[name] [
  print str
  print str2
  code: []  
  
  return code
]

defType myType1 [
  a [int]
  b [int]
  c [string]
]

defType myType2 [
  a [int]
  b [int]
  c [string]
]

defVertex [
  a: myType1
  b: myType2
]

defEdge [
  [myType1 myType2]
  [myType2 myType1]
]

defFunc basic[p [myType]] []

defFunc foo[a [int] b [int]]
[    
  a: myType1
  b: myType2
  basic a
  if a < 1 [print "fun"]  
  addEdge a b
]

defScript myscript1 
[
  basic p
  foo 1 2
]

defScript myscript2 []

compile myscript1

#macro generate-runtime: func[code] [
  c: [
    #system [
      s: declare struct! [i [integer!] b [byte!]]
      s/i: 123
      s/b: #"A"
      obj: s    
    ]
  ]
  append c code
  return c
]

#macro append-runtime: func[] [
  return [
    #system [
      print obj/i
    ]
  ]
]

generate-runtime append-runtime

struct-template s [T] 
[
   [i [T!] b [byte!]]
]