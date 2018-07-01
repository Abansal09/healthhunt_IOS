//
//  FacebookGoogleView.swift
//  HealthHunt
//
//  Created by Abhishek Kumar on 6/29/18.
//  Copyright © 2018 Abhishek Kumar. All rights reserved.
//

import UIKit

class FacebookGoogleView: UIView {

    @IBOutlet var contentView: UIView!

    @IBOutlet weak var loginTextHeader: UILabel!
    @IBOutlet weak var facebookBtn: UIImageView!
    @IBOutlet weak var googleBtn: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func loadView() {
        Bundle.main.loadNibNamed("facebook_google_view", owner: self, options: nil)
        addSubview(contentView)
        contentView.bounds = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
