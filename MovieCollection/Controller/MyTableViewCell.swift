//
//  MyTableViewCell.swift
//  MovieCollection
//
//  Created by user235836 on 5/9/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var moviePoster: UIImageView!
    @IBOutlet var movieTitle: UITextView!
    @IBOutlet var releasedYear: UITextField!
    @IBOutlet var seriesSwitch: UISwitch!        
    @IBOutlet var episodeSwitch: UISwitch!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
