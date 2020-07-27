//
//  ViewController.swift
//  DoodleBlueTask
//
//  Created by jenish x on 27/07/20.
//  Copyright © 2020 jenish x. All rights reserved.
//

import UIKit

class SequenceViewController: UIViewController {
    
    @IBOutlet weak var sequenceTableview: UITableView!
    var sequenceviewmodel:SequenceViewModel?
    
    var headerView : UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        let titleLable = UILabel(frame: CGRect(x: 20, y: 0, width: view.frame.width - 20, height: 50))
        titleLable.text = "Here the question will be ordered in the correct sequence"
        titleLable.font = UIFont.systemFont(ofSize: 11)
        view.addSubview(titleLable)
        return view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sequenceviewmodel = SequenceViewModel.standerd
        sequenceviewmodel?.delegate = self
        RegisterTableviewCell()
        sequenceviewmodel?.loaddata()
    }
    
    private func RegisterTableviewCell(){ // register cell and data & delegate.
        sequenceTableview.dataSource = self
        sequenceTableview.delegate   = self
        sequenceTableview.tableFooterView = UIView()
        sequenceTableview.separatorStyle  = .none
        sequenceTableview.register(UINib(nibName: ReuseIdentifier.SequenceUnorderReuseIdentifier.rawValue, bundle: nil), forCellReuseIdentifier: ReuseIdentifier.SequenceUnorderReuseIdentifier.rawValue)
        sequenceTableview.register(UINib(nibName: ReuseIdentifier.SequenceOrderReuseIdentifier.rawValue, bundle: nil), forCellReuseIdentifier: ReuseIdentifier.SequenceOrderReuseIdentifier.rawValue)
    }
    
   //MARK: Button Action
/// This Button action are help to reset all data's.
    
    @IBAction func ResetButtonAction(_ sender: Any) {
        sequenceviewmodel?.resetallData()
    }
    
    
}
//MARK: - UITABLEVIEW.
extension SequenceViewController: UITableViewDataSource ,UITableViewDelegate {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return sequenceviewmodel?.sequenceData.count ?? 0
        }
        return sequenceviewmodel?.answersequenceData.count ?? 0

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.SequenceUnorderReuseIdentifier.rawValue) as! SequenceTableViewCell
            cell.celldata = sequenceviewmodel?.sequenceData[indexPath.row]
            cell.tag = indexPath.row
            return cell
        }
        
        let sequenceResultCell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.SequenceOrderReuseIdentifier.rawValue) as! SequenceResultTableViewCell
        sequenceResultCell.celldata = sequenceviewmodel?.answersequenceData[indexPath.row]
        return sequenceResultCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1{
            return headerView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
//MARK: VIEWMODEL DELEGATE.
extension SequenceViewController:SequenceViewModelDelegate{
    func reloadtableview() { // reload tableview.
        DispatchQueue.main.async {
            self.sequenceTableview.reloadData()
        }
    }
}
