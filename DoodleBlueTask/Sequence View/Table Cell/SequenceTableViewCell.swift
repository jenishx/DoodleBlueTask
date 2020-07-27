//
//  SequenceTableViewCell.swift
//  DoodleBlueTask
//
//  Created by jenish x on 27/07/20.
//  Copyright © 2020 jenish x. All rights reserved.
//

import UIKit
import EzPopup


class SequenceTableViewCell: UITableViewCell {

    @IBOutlet weak var title_lable: UILabel!
    
    @IBOutlet weak var selectedIndex_Lable: UILabel!
    @IBOutlet weak var dropDownButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var celldata:SequenceModel?{
        didSet{
            title_lable.text = celldata?.title
            if let selectedIndex = celldata?.selected_Index {
                selectedIndex_Lable.text = "\(selectedIndex)"
            }else{
                selectedIndex_Lable.text = "" // if have any selected index it not show any values.
            }
        }
    }
    
    
    @IBAction func dropDownButtonAction(_ sender: Any) { /// Show drop down when click the arrow down button.
        
        guard SequenceViewModel.standerd.dropdownData.count > 0 else { /// if drop down having no value it prevent to show empty drop down.
            return
        }
      ///Show Drop down on button location.
        let frame = self.frame.origin
        let dropdown = DropDown()
        dropdown.delegate = self
        let popupVC = PopupViewController(contentController: dropdown, position: .topRight(CGPoint(x: frame.x + 10, y: frame.y)), popupWidth: 50, popupHeight:150)
        // Init popup view controller with content is your content view controller
        // show it by call present(_ , animated:) method from a current UIViewController
        UIApplication.topViewController()?.present(popupVC, animated: true)
    }
}

//MARK: DropDownDelegate.
extension SequenceTableViewCell:DropDownDelegate {
   
    func SelectedIndex(index: Int) {
        SequenceViewModel.standerd.UpdateValueOnCell(Cellindex: self.tag, index: index)
    }
    
    
}
