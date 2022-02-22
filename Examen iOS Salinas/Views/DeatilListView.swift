//
//  DeatilListView.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import UIKit

class DeatilListView: UIView {
    
    @IBOutlet weak var detailListTable: UITableView!
    var dataSource: DetailListDataSource! {
        didSet{
            self.detailListTable.dataSource = dataSource
        }
    }
    var itemAction: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        detailListTable.register(UINib(nibName: "OptionTableViewCell", bundle: nil), forCellReuseIdentifier: OptionTableViewCell.reuseIdentifier)
        detailListTable.register(UINib(nibName: "InputTextTableViewCell", bundle: nil), forCellReuseIdentifier: InputTextTableViewCell.reuseIdentifier)
        detailListTable.register(UINib(nibName: "SelectTableViewCell", bundle: nil), forCellReuseIdentifier: SelectTableViewCell.reuseIdentifier)
        detailListTable.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: ImageTableViewCell.reuseIdentifier)
        self.detailListTable.delegate = self
    }

}
extension DeatilListView: DetailListViewInput, UITableViewDelegate{
    func display(_ image: UIImage) {
        self.dataSource.image = image
        self.detailListTable.reloadData()
    }
    
  
    func display(_ items: [DetailListItem]?) {
        self.dataSource.items = items ?? []
        self.detailListTable.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.dataSource.items[indexPath.section].header == "Cámara"{
            itemAction?()
        }
        if self.dataSource.items[indexPath.section].header == "Sexo"{
            self.dataSource.items[indexPath.section].list![indexPath.item].didSelected = !self.dataSource.items[indexPath.section].list![indexPath.item].didSelected!
            if indexPath.item == 0{
                if self.dataSource.items[indexPath.section].list![indexPath.item].didSelected! {
                    self.dataSource.items[indexPath.section].list![1].didSelected = false
                }
            }else{
                if self.dataSource.items[indexPath.section].list![indexPath.item].didSelected!{
                    self.dataSource.items[indexPath.section].list![0].didSelected = false
                }
            }
            tableView.reloadData()
        }
        if self.dataSource.items[indexPath.section].header == "Color favorito"{
            self.dataSource.items[indexPath.section].list![indexPath.item].didSelected = !self.dataSource.items[indexPath.section].list![indexPath.item].didSelected!
            tableView.reloadData()
        }
        
    }
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = UIColor.gray
        
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        lbl.font = UIFont.systemFont(ofSize: 20)
         lbl.text = dataSource.items[section].header
        view.addSubview(lbl)
        return view
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.dataSource.items[indexPath.section].header == "Cámara" || self.dataSource.items[indexPath.section].header == "Foto"{
            return 250
        }else{
            return 60
        }
    }

}
