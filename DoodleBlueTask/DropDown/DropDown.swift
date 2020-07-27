//
//  DropDown.swift
//  DoodleBlueTask
//
//  Created by jenish x on 27/07/20.
//  Copyright © 2020 jenish x. All rights reserved.
//

import UIKit

protocol DropDownDelegate {
    func SelectedIndex(index:Int)
}


class DropDown: UIViewController {

    @IBOutlet weak var dropdownTableview: UITableView!
    var sequenceview:SequenceViewModel?
    var delegate:DropDownDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sequenceview = SequenceViewModel.standerd
        setupdropdownTable()
        
        // Do any additional setup after loading the view.
    }

    private func setupdropdownTable(){
        dropdownTableview.dataSource = self
        dropdownTableview.delegate   = self
        
    }
}

extension DropDown: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sequenceview?.dropdownData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var dropdownCell = tableView.dequeueReusableCell(withIdentifier: "CELL") as UITableViewCell?
        if !(dropdownCell != nil) {
            dropdownCell = UITableViewCell(style:.default, reuseIdentifier: "CELL")
        }
        
        dropdownCell?.textLabel?.text = "\(sequenceview?.dropdownData[indexPath.row] ?? 0)"
        return dropdownCell!
    }
    
    // MARK: Delegate.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            self.delegate?.SelectedIndex(index: self.sequenceview?.dropdownData[indexPath.row] ?? 0)
        }
    }
}
