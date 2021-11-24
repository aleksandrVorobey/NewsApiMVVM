//
//  NewsTableViewCell.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 23.11.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "NewsTableViewCell"
        
    var newsCellViewModel: NewsCellViewModelProtocol! {
        didSet {
            self.nameLabel.text = newsCellViewModel.newsName
            self.titleLabel.text = newsCellViewModel.newsTitle
            self.descriptionLabel.text = newsCellViewModel.newsDescription
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
