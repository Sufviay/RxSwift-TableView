//
//  ViewController.swift
//  RxSwift-UITableView
//
//  Created by 岁变 on 2017/7/10.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ViewController: UIViewController {
    
    let tableView: UITableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
    let reuseIdentifier = "\(TableViewCell.self)"
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, User>>()
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        dataSource.configureCell =  {
            _, tableView, indexPath, user in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! TableViewCell
            cell.tag = indexPath.row
            cell.user = user
            return cell
        }
        
        viewModel.getUsers().bind(to: tableView.rx.items(dataSource: dataSource)).addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

