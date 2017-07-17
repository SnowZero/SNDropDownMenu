<img src="http://snowzero.myds.me/github/image/SNDropDownMenu.gif" width=320 height=640>


### SNDropDownMenu
Use customize view produce dropDownMenu 

### How to use

- Drag SNDropDownMenu.swift to your project
- Add SNDropDownMenuDelegate to your ViewController
- Refer to the example
```
// example
let headView = (your customize headView)
let options = [view1,view2] // your options views

let dropDownMenu  = SNDropDownMenu()
dropDownMenu.frame = self.view.frame
dropDownMenu.setup(headView, options: options,delegate:self)
view.addSubview(dropDownMenu)
```
