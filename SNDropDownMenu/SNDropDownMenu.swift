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

class SNDropDownMenu: UITableView ,UITableViewDelegate,UITableViewDataSource {

    var menuDelegate:SNDropDownMenuDelegate?
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
    
    private var firstRun = false
    override func layoutSubviews() {
        super.layoutSubviews()
        if !firstRun {
            viewDidLoad()
            firstRun = true
        }
    }
    
    func viewDidLoad() {
        // Tableview setUp
        self.sectionHeaderHeight = UITableViewAutomaticDimension
        self.estimatedSectionHeaderHeight = 45
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 45
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.isScrollEnabled = false
        self.frame.size.height = headView.frame.height
        self.delegate = self
        self.dataSource = self
        
        // Add headView action
        let headButton = UIButton(frame: headView.frame)
        headButton.addTarget(self, action: #selector(showOrHiden), for: .touchUpInside)
        headView.addSubview(headButton)
    }

    func setup(_ headView:UIView , options:[UITableViewCell],delegate:SNDropDownMenuDelegate) {
        self.frame = headView.frame
        self.headView = headView
        self.options = options
        menuDelegate = delegate
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return options.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return options[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = options[indexPath.row]
        menuDelegate?.didSelectOption(indexPath.row, Option: cell)
        cell.setSelected(isSelectMod, animated: true)
        showOrHiden()
    }
    
    func showOrHiden() {
        isOpen = !isOpen
    }
    
    private func hideAnimation() {
        UIView.animate(withDuration: 0.3) { 
            self.frame.size.height = self.headView.frame.height
        }
    }
    
    private func showAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.frame.size.height = self.contentSize.height + self.contentInset.bottom + self.contentInset.top
        }
    }
}
