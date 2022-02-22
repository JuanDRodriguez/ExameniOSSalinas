//
//  InputTextTableViewCell.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 22/02/22.
//

import UIKit

class InputTextTableViewCell: UITableViewCell {
    static var reuseIdentifier: String = "InputTextTableViewCell"
    @IBOutlet weak var txtField: UITextField!{
        didSet{
            txtField.inputAccessoryView = self.getToolbar()
        }
    }
    var itemAction:(()-> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func display(item: ListItem){
        txtField.placeholder = item.value
    }
    @objc func doneDatePicker(){
       
        itemAction?()
    }
    private func getToolbar() -> UIToolbar{
        let toolbar = UIToolbar();
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Ok", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneDatePicker))
        
        toolbar.setItems([doneButton], animated: false)
        return toolbar
        
    }
    
}
