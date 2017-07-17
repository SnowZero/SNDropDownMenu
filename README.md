# SNDropDownMenu
Use customize view produce dropDownMenu 

# How to use

1. Drag SNDropDownMenu.swift to your project
2. Add SNDropDownMenuDelegate to your ViewController
3. Refer to the example
```
// example
let headView = (your customize headView)
let options = [view1,view2] // your options views

let dropDownMenu  = SNDropDownMenu()
dropDownMenu.frame = self.view.frame
dropDownMenu.setup(headView, options: options,delegate:self)
view.addSubview(dropDownMenu)
```
