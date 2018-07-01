//
//  UITableView+Animation.swift
//  SportLotus
//
//  Created by ChicMic on 25/06/18.
//  Copyright © 2018 Socialinfotech 16. All rights reserved.
//

import UIKit

extension UITableView {

    func reloadData(with animation: UITableViewRowAnimation) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
}
