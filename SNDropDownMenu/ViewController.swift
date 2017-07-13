//
//  ViewController.swift
//  SNDropDownMenu
//
//  Created by Snow on 2017/7/12.
//  Copyright © 2017年 Snow. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,SNDropDownMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let headView = UIView()
        headView.frame = self.view.frame
        headView.frame.size.height = 44
        headView.backgroundColor = UIColor.brown
        headView.layer.cornerRadius = 5
        headView.layer.borderColor = UIColor.gray.cgColor
        headView.layer.borderWidth = 1
        headView.layer.masksToBounds = false
        let label = UILabel(frame:headView.frame)
        label.center = headView.center
        label.text = "Hello title"
        label.contentMode = .center
        headView.addSubview(label)
        
        var options = [UITableViewCell]()
        for i in 0...7 {
            let option = UITableViewCell(frame: self.view.frame)
            option.frame.size.height = 44
            option.textLabel?.text = "hello option " + String(i)
            option.textLabel?.contentMode = .center
            option.backgroundColor = UIColor.darkGray
            option.layer.cornerRadius = 5
            option.layer.masksToBounds = false
            option.layer.borderColor = UIColor.gray.cgColor
            option.layer.borderWidth = 1
            options.append(option)
        }
        
        let dropDownMenu  = SNDropDownMenu()
        dropDownMenu.setup(headView, options: options,delegate:self)
        view.addSubview(dropDownMenu)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSelectOption(_ index: Int, Option: UITableViewCell) {
        print(index)
    }
}

