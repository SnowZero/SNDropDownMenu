//
//  SNDropDownMenu.swift
//  SNDropDownMenu
//
//  Created by Snow on 2017/7/12.
//  Copyright © 2017年 Snow. All rights reserved.
//

import UIKit

protocol SNDropDownMenuDelegate {
    
    func didSelectOption(_ index:Int,Option:UITableViewCell)
}

class SNDropDownMenu: UIView {
    var dropDownMenuController = SNDropDownMenuController()
    
    /// required：Setup dropDownMenu
    ///
    /// - Parameters:
    ///   - headView: headView:UIView
    ///   - options:  options:[UITableViewCell]
    ///   - delegate: delegate = self (Need use SNDropDownMenuDelegate)
    func setup(_ headView:UIView , options:[UITableViewCell],delegate:SNDropDownMenuDelegate) {
        dropDownMenuController.headView = headView
        dropDownMenuController.options = options
        dropDownMenuController.delegate = delegate
        self.addSubview(dropDownMenuController.tableView)
    }
}

class SNDropDownMenuController: UITableViewController {

    var delegate:SNDropDownMenuDelegate?
    var headView = UIView()
    var options = [UITableViewCell]()
    private var isOpen = false {
        didSet {
            // 展開收合動畫
            if isOpen {
                showAnimation()
            } else {
                hideAnimation()
            }
        }
    }
    
    var isSelectMod = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tableview setUp
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        self.tableView.estimatedSectionHeaderHeight = 45
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 45
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tableView.isScrollEnabled = false
        self.tableView.frame.size.height = headView.frame.height
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Add headView action
        let headButton = UIButton(frame: headView.frame)
        headButton.addTarget(self, action: #selector(showOrHiden), for: .touchUpInside)
        headView.addSubview(headButton)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return options.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return options[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = options[indexPath.row]
        delegate?.didSelectOption(indexPath.row, Option: cell)
        cell.setSelected(isSelectMod, animated: true)
        showOrHiden()
    }
    
    func showOrHiden() {
        isOpen = !isOpen
    }
    
    private func hideAnimation() {
        UIView.animate(withDuration: 0.3) { 
            self.tableView.frame.size.height = self.headView.frame.height
        }
    }
    
    private func showAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.tableView.frame.size.height = self.tableView.contentSize.height + self.tableView.contentInset.bottom + self.tableView.contentInset.top
        }
    }
}
