//
//  RoundTableView.swift
//  testnamesbyalphabet
//
//  Created by samuel on 16/11/2017.
//  Copyright © 2017 samuel. All rights reserved.
//

import UIKit

class RoundTableView: UITableView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }

}
