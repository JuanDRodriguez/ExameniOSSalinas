//
//  DetailListViewController.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import UIKit

class DetailListViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var model: DetailListModelInput!
    private var items: [ListItem]!
    lazy var content: DetailListViewInput! = {return view as! DetailListViewInput}()
    override func viewDidLoad() {
        super.viewDidLoad()
        initConfig()
        self.model.load(items: self.items)
        
    }
    
    func initConfig(){
        self.content.dataSource = DetailListDataSource()
        self.content.dataSource.PhonetxtFieldDelegate = NumeroDelegate()
        self.content.dataSource.NametxtFieldDelegate = NameDelegate()
        self.content.dataSource.itemAction = {
            self.view.endEditing(true)
        }
        self.content.itemAction = {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                   var imagePicker = UIImagePickerController()
                   imagePicker.delegate = self
                   imagePicker.sourceType = .camera;
                   imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
               }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.content.display(image)
        dismiss(animated:true, completion: nil)
        
    }
}
extension DetailListViewController: DetailListViewControllerInput, DetailListModelOutput{
    func modelDidload(_ items: [DetailListItem]) {
        self.content.display(items)
        self.content.display(UIImage(named: "camara")!)
    }
    
    func setItems(_ items: [ListItem]) {
        self.items = items
        
    }
        
}
