//
//  HomeTableViewCell.swift
//  TodaysOutside
//
//  Created by sapere4ude on 2021/02/14.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var highestDegree: UILabel!
    @IBOutlet weak var lowestDegree: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var airPollution: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
