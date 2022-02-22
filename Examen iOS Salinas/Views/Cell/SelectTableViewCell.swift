//
//  SelectTableViewCell.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 22/02/22.
//

import UIKit

class SelectTableViewCell: UITableViewCell {
    static var reuseIdentifier: String = "SelectTableViewCell"
    @IBOutlet weak var txtField: UITextField!
    var datePicker: UIDatePicker! {
        didSet{
            txtField.inputAccessoryView = self.getToolbar()
            txtField.inputView = datePicker
        }
    }
    var itemAction:(()-> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @objc func doneDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd / MM / yyyy"
        txtField.text = formatter.string(from: datePicker.date)
        let stringdate = txtField.text?.split(separator: " ")
        self.txtField.text = "\(stringdate![0] ?? "")-\(stringdate![2] ?? "")-\(stringdate![4] ?? "")"
        //self.view.endEditing(true)
        itemAction?()
    }
    @objc func cancelDatePicker(){
        if let Fecha = txtField.text{
            if Fecha.isEmpty {
                txtField.text = "DD-MM-YYYY"
            }
        //self.view.endEditing(true)
            itemAction?()
        }
    }
    private func getToolbar() -> UIToolbar{
        let toolbar = UIToolbar();
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Ok", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        return toolbar
        
    }
    
    
}
