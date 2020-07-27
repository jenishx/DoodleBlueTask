//
//  SequenceViewModel.swift
//  DoodleBlueTask
//
//  Created by jenish x on 27/07/20.
//  Copyright © 2020 jenish x. All rights reserved.
//

import Foundation

enum ReuseIdentifier:String {
    case SequenceUnorderReuseIdentifier = "SequenceTableViewCell"
    case SequenceOrderReuseIdentifier   = "SequenceResultTableViewCell"
}

protocol SequenceType {
    var title:String?{get set}
    var selected_Index:Int?{get set}
   mutating func updateSelectedIndex(index:Int)
}


struct SequenceModel:SequenceType  {
    var title: String?
    var selected_Index: Int?
    mutating func updateSelectedIndex(index: Int) {
        self.selected_Index = index
    }
}

protocol SequenceViewModelDelegate {
    func reloadtableview()
}

class SequenceViewModel {
    
    static let standerd = SequenceViewModel()
    var dropdownData = [Int]()
    var sequenceData:[SequenceModel] = [SequenceModel]()
    var answersequenceData:[SequenceModel] = [SequenceModel]()
    var delegate:SequenceViewModelDelegate?
    
    
     func resetallData()  {
        answersequenceData.removeAll()
        dropdownData.removeAll()
        sequenceData.removeAll() // remove all data.
        self.loaddata()          // load default.
    }
    
     func loaddata(){ // load default data.
        let first   = SequenceModel(title: "This is the third sentence", selected_Index: nil)
        let secound = SequenceModel(title: "This is the secound sentence, example for having more words when compared to the first one", selected_Index: nil)
        let third   = SequenceModel(title: "This is the secound sentence, example for having more words when compared to the first one", selected_Index: nil)
        sequenceData.append(first)
        sequenceData.append(secound)
        sequenceData.append(third)
        delegate?.reloadtableview()
        loadDropdownData()
    }
    
    func loadDropdownData()  {
        for (index,_) in sequenceData.enumerated() {
            dropdownData.append(index + 1)
        }
    }
    
    func UpdateValueOnCell(Cellindex:Int, index:Int) { // Update Value.
        sequenceData[Cellindex].selected_Index = index
        if let removedropDownindex = dropdownData.firstIndex(of: index) {
          dropdownData.remove(at: removedropDownindex)
        }
        answersequenceData.append(sequenceData[Cellindex]) // Add To Answer Stack.
        RearangeTheAnswerValues()
        delegate?.reloadtableview()

    }
    
    func RearangeTheAnswerValues()  { // Re-Arrange the Answer value.
        answersequenceData.sort {  $0.selected_Index! <  $1.selected_Index! }
    }
    
}
