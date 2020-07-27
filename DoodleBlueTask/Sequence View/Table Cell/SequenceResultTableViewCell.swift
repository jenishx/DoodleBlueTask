//
//  SequenceResultTableViewCell.swift
//  DoodleBlueTask
//
//  Created by jenish x on 27/07/20.
//  Copyright © 2020 jenish x. All rights reserved.
//

import UIKit

class SequenceResultTableViewCell: UITableViewCell {

    @IBOutlet weak var indexLable: UILabel!
    @IBOutlet weak var answerLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    var celldata:SequenceModel?{
           didSet{
               answerLable.text = celldata?.title
               if let selectedIndex = celldata?.selected_Index {
                   indexLable.text = "\(selectedIndex)"
               }
           }
       }
    
    
    
    
    
    
   
}
