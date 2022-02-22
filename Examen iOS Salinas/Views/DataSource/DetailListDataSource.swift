//
//  DetailListDataSource.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 22/02/22.
//

import Foundation
import UIKit

class DetailListDataSource: NSObject{
    var items: [DetailListItem] = []
    var colors: [UIColor] = []
    var PhonetxtFieldDelegate: NumeroDelegate?
    var NametxtFieldDelegate: NameDelegate?
    var itemAction:(()->Void)?
    var image: UIImage? = nil
    func getDatePicker() -> UIDatePicker{
        let  datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "es_MX")
        
        //datePicker.maximumDate = currentDate
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
       
        let currentDate = Date()
        datePicker.maximumDate = currentDate
        datePicker.date = currentDate
        
        return datePicker
    }
}
extension DetailListDataSource: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].list!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch items[indexPath.section].list![indexPath.item].type {
        case "camera":
           let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.reuseIdentifier) as! ImageTableViewCell
            if let img = self.image{
                cell.display(image: img)
            }
            return cell
        case "inputText":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: InputTextTableViewCell.reuseIdentifier) as! InputTextTableViewCell
            cell.display(item:items[indexPath.section].list![indexPath.item])
            if items[indexPath.section].header == "Nombre completo"{
                cell.txtField.delegate = NametxtFieldDelegate
            }else{
                cell.txtField.delegate = PhonetxtFieldDelegate
            }
            cell.itemAction = {
                self.itemAction?()
            }
            return cell
            
        case "image":
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.reuseIdentifier) as! ImageTableViewCell
            cell.display(url: items[indexPath.section].list![indexPath.item].value!)
            return cell
        case "selectInput":
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectTableViewCell.reuseIdentifier) as! SelectTableViewCell
            cell.datePicker = getDatePicker()
            cell.itemAction = {
                self.itemAction?()
            }
            return cell
        case "multiOption":
           let cell = tableView.dequeueReusableCell(withIdentifier: OptionTableViewCell.reuseIdentifier) as! OptionTableViewCell
            cell.clear()
            if items[indexPath.section].header == "Color favorito"{
                if self.colors.count < items[indexPath.section].list!.count{
                    self.colors.append(.random)
                }
                cell.display(color: self.colors[indexPath.item], isSelected: items[indexPath.section].list![indexPath.item].didSelected!)
            }
            if items[indexPath.section].header == "Sexo"{
                
                cell.display(item: items[indexPath.section].list![indexPath.item])
            }
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: OptionTableViewCell.reuseIdentifier) as! OptionTableViewCell
            return cell
        }
        
    }
    
    
}
