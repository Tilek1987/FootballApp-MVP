//
//  LogoView.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 26/6/22.
//

import UIKit

class LogoView: BaseNibView {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureView(data: League) {
        if let urlString = data.logos.light {
            logoImageView.downloaded(from: urlString)
        }
        titleLabel.text = data.name
    }
}
