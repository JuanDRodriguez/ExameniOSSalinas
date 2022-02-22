//
//  ViewController.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import UIKit

class ListViewController: UIViewController {
    
    lazy var contentView: ListViewInput! = {return view as! ListViewInput}()
    var model: ListModelInput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initConfig()
    }
    private func initConfig(){
        self.model.load()
        self.contentView.dataSource = ListOptionsDataSource()
        self.contentView.itemAction = {
            let newList = $0.filter({$0.didSelected!})
            if newList.isEmpty {
                self.showAlert("Se tienen que seleccionar al menos una celda")
            }else{
                self.performSegue(withIdentifier: "showDetailList", sender: newList)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailList",
            let controller = segue.destination as? DetailListViewControllerInput,
           let item = sender as? [ListItem]{
            controller.setItems(item)
        }
    }

}

extension ListViewController: ListModelOutput{
    func modelDidload(_ items: [ListItem]) {
        self.contentView.display(items)
    }
    
}
