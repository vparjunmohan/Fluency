//
//  LanguagesTableViewCell.swift
//  Fluency
//
//  Created by Arjun Mohan on 10/11/22.
//

import UIKit

class LanguagesTableViewCell: UITableViewCell {

    @IBOutlet weak var languageName: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        downloadButton.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
