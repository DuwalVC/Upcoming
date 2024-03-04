//
//  ListOfMoviesTableViewCell.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import UIKit

class ListOfMoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title: String){
        titleLabel.text = title
    }

}
