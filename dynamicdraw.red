Red [needs: view]

win: layout [ base 500x500 draw [] ]

boxes: [[10x10 100x100]
        [100x10 190x100]
        [190x10 280x100]
        [10x100 100x190]
        [100x100 190x190]
        [190x100 280x190]
        [10x190 100x280]
        [100x190 190x280]
        [190x190 280x280]]

generateDraw: function [boxes] [
  result: []
  foreach box boxes [
    append result [box]
    append result box
  ]
  return result
]

print mold generateDraw boxes

win/pane/1/draw: generateDraw boxes

win/pane/1/actors: make face! [		 
  on-down: func [f e] [ print "down"]
]

view/flags win [resize]
