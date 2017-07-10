//
//  VeiwModel.swift
//  RxSwift-UITableView
//
//  Created by 岁变 on 2017/7/10.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit
import Foundation
import RxDataSources

import RxSwift


class ViewModel: NSObject {
    
    
    func getUsers() -> Observable<[SectionModel<String, User>]> {
        
        return Observable.create { (observer) -> Disposable in
            let users = [User(followersCount: 19901990, followingCount: 1990, screenName: "Marco Sun"),
                User(followersCount: 19890000, followingCount: 1989, screenName: "Taylor Swift"),
                User(followersCount: 250000, followingCount: 25, screenName: "Rihanna"),
                User(followersCount: 1300000, followingCount: 13, screenName: "Jolin Tsai"),
                User(followersCount: 25000000, followingCount: 25, screenName: "Adele")]
            let section = [SectionModel(model:"", items: users)]
            observer.onNext(section)
            observer.onCompleted()
            
            return Disposables.create {}
        }
    }
}
