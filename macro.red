Red []

#do [
  api: []
]

#macro gen: function[x block z] [
  ; create return block
  code: []
  
  ; create temporary code block
  tmpCode: []
  
  ; build loop x block
  append tmpCode 'loop
  append tmpCode x
  append/only tmpCode block
  
  loop z [
     append code tmpCode
  ]
  return code
]


#macro generateGraphApi: function[] [
  [
      context [
          foo: function [][print "foo"]
          bar: function [][print "bar"]
          #macro mac: function [][function[] [probe "mac"]]
      ]
  ]
]


api: generateGraphApi
api/foo
mac

gen 5 [print "delak"] 5

