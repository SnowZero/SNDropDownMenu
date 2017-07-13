# SNDropDownMenu
下拉選單

# How to use

1. Drag SNDropDownMenu.swift to your project
2. Add SNDropDownMenuDelegate to your ViewController
3. Refer to the example

let dropDownMenu  = SNDropDownMenu()
dropDownMenu.frame = self.view.frame
dropDownMenu.setup(headView, options: options,delegate:self)
view.addSubview(dropDownMenu)
