//
//  OptionTableViewCell.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import UIKit

class OptionTableViewCell: UITableViewCell {
    static var reuseIdentifier: String = "OptionTableViewCell"
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgSelected: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func clear(){
        self.lblTitle.text = ""
        self.backgroundColor = UIColor.clear
        self.imgSelected.isHidden = true
    }
    
    func display(item:  ListItem){
        self.lblTitle.text = item.title
        self.imgSelected.isHidden = !(item.didSelected ?? false)
        
    }
    func display(color: UIColor, isSelected: Bool){
        self.backgroundColor = color
        self.imgSelected.isHidden = !isSelected
    }
    
}
