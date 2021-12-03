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
        
     weak var viewModel: NewsCellViewModelProtocol! {
        didSet {
            if let viewModel = viewModel {
                self.nameLabel.text = viewModel.newsName
                self.titleLabel.text = viewModel.newsTitle
                self.descriptionLabel.text = viewModel.newsDescription

                ImageManager.shared.getImageRequest(urlString: viewModel.urlToImage) { data in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.newsImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.newsImage.image = nil
        self.nameLabel.text = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
