//
//  ListView.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import UIKit

class ListView: UIView {
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var continueButton: UIButton!
    var dataSource: ListOptionsDataSource! {
        didSet{
            self.listTableView.dataSource = dataSource
        }
    }
    var itemAction: (([ListItem]) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.listTableView.register(UINib(nibName: "OptionTableViewCell", bundle: nil), forCellReuseIdentifier: OptionTableViewCell.reuseIdentifier)
        self.listTableView.delegate = self
    }
    @IBAction func onClickDone(){
        itemAction?(dataSource.items)
    }
    
    func display(_ items: [ListItem]?) {
        if let data = items{
            self.dataSource.items = data
        }
        self.listTableView.reloadData()
    }
}
extension ListView: ListViewInput, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource.items[indexPath.item].didSelected = !dataSource.items[indexPath.item].didSelected!
        tableView.reloadData()
    }
    
}
