//
//  ViewController.swift
//  DoodleBlueTask
//
//  Created by jenish x on 26/07/20.
//  Copyright © 2020 jenish x. All rights reserved.
//

import UIKit

class SequenceViewController: UIViewController {

    let sequenceTableviewcellReuseIdentifier = ""
    
    @IBOutlet weak var sequenceTableview: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func RegisterTableviewCell(){
        sequenceTableview.register(UINib(nibName: "MissionCell", bundle: nil), forCellReuseIdentifier: "MissionCell")

    }


}

