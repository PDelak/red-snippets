Red []

#macro redsStringCodeGen: func[body] [
  b: {}
  append b { #system  }
  append b { [ 
               s: declare struct! [
           } 
  append b { i [integer!] b [byte!]]
               print "hello"] 
           }
  return to-block b
]

#macro redsBlockCodeGen: func[code] [
  codeStr: mold code
  insert head codeStr "#system "
  resultBlock: load codeStr
  print mold resultBlock
  return resultBlock
]

redsBlockCodeGen [s: declare struct! [i [integer!] b [byte!]]] 

#system [
  s/i: 0
]
