//
//  ProgressUtility.swift
//  SportLotus
//
//  Created by Abhishek Kumar on 07/06/18.
//  Copyright © 2018 Abhishek Kumar 16. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class ProgressUtility: NSObject, NVActivityIndicatorViewable {

    static let shared = ProgressUtility()
    private var spinner = UIActivityIndicatorView()

    func showLoaderAtCenter(_ view: UIView) {

        let size = view.bounds.size
        spinner = UIActivityIndicatorView(frame: CGRect(x: size.width/2-20, y: size.height/2-20, width: 40, height: 40))
        spinner.activityIndicatorViewStyle = .gray
        spinner.color = .red
        view.addSubview(spinner)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
    }

    func showLoader() {

        let activitydata = ActivityData(size: CGSize(width: 48, height: 48), message: nil, messageFont: UIFont.systemFont(ofSize: 16.0), type: .ballSpinFadeLoader, color: UIColor.themeColor, padding: 4.0, displayTimeThreshold: nil, minimumDisplayTime: 2)

        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activitydata)
    }

    func hideLoader() {

        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
    }
}
