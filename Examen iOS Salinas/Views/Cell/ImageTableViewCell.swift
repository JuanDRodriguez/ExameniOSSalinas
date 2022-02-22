//
//  ImageTableViewCell.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 22/02/22.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    static var reuseIdentifier: String = "ImageTableViewCell"
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func display(url: String){
        self.imgView.load(urlString: url)
    }
    func display(image: UIImage){
        self.imgView.image = image
    }
}
