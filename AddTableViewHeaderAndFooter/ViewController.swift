//
//  ViewController.swift
//  AddTableViewHeaderAndFooter
//
//  Created by ying on 16/6/3.
//  Copyright © 2016年 ying. All rights reserved.
//  UITableView具有var tableHeaderView:UIView?属性和var tableFooterView:UIView?属性，可以通过给其赋值来创建列表TableView的页眉和页脚。


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet weak var tableView: UITableView!
    //var tableView: UITableView?
    
    var ctrlnames:[String] = ["UILabel 标签", "UIButton 按钮", "UIDatePiker 日期选择器"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame, style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        //给TableView添加表头页眉
        let headerView: UIView = UIView(frame: CGRectMake(0,0,tableView!.frame.size.width, 60))
        let headerLabel: UILabel = UILabel(frame: headerView.bounds)
        headerLabel.textColor = UIColor.whiteColor()
        headerLabel.backgroundColor = UIColor.clearColor()
        headerLabel.font = UIFont.systemFontOfSize(16)
        headerLabel.text = "TableView 页眉"
        headerView.addSubview(headerLabel)
        headerView.backgroundColor = UIColor.blackColor()
        tableView!.tableHeaderView = headerView
        
        //给TableView添加标头页尾
        let footView: UIView = UIView(frame: CGRectMake(0,0,tableView!.frame.size.width, 60))
        let footLabel: UILabel = UILabel(frame: footView.bounds)
        footLabel.textColor = UIColor.whiteColor()
        footLabel.backgroundColor = UIColor.clearColor()
        footLabel.font = UIFont.systemFontOfSize(16)
        footLabel.text = "TableView 页尾"
        footView.addSubview(footLabel)
        footView.backgroundColor = UIColor.blackColor()
        tableView!.tableFooterView = footView

    }
    
    //MARK: - TableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ctrlnames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identify: String = "SwiftCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = ctrlnames[indexPath.row]
        return cell
    }
    


}

