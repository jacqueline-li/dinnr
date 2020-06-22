//
//  BaseView.swift
//  Food-Tinder
//
//  Created by Jacqueline Li on 2020-04-05.
//  Copyright © 2020 Jacqueline Li. All rights reserved.
//

import UIKit

@IBDesignable class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(code aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }

    func configure() {
        
    }
}
