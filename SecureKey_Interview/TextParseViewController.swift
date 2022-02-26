//
//  TextParseViewController.swift
//  SecureKey_Interview
//
//  Created by Dheeraj's MacBook Pro on 2022-02-26.
//

import UIKit

class TextParseViewController: UIViewController {
    
    var dataDict:[String:Any] = ["a":["above", "apple", "about", "application"],
                                 "b":["boy", "ball", "bowl", "bomb"],
                                 "c":["cat", "cow", "camp", "catch"],
                                 "p":["pie", "pot", "pod", "pattern"],
                                 "s":["some", "show", "shoe", "shake"],
    ]
    
    @IBOutlet weak var inputTextfield: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.isHidden = true
        inputTextfield.delegate = self
    }
    
    @IBAction func parseBtnClicked(_ sender: Any) {
        outputLabel.isHidden = false
        if inputTextfield.text == ""  {
            outputLabel.text = "Please enter an input string and then click Parse."
            outputLabel.textColor = UIColor.red
        }
        else{
            let str = String(inputTextfield.text!)
            let response = findSubstring(searchText: str)
            print("REsposne \(response)")
            
            outputLabel.textColor = UIColor.black
            outputLabel.text = response.joined(separator: ", ")
        }
    }
    
    func findSubstring(searchText: String) -> [String]{
        var output: [String] = []
        var remainingSearch: [String] = []
        
        var tempArr:[String] = dataDict[String(searchText.prefix(1))] as! [String]
        tempArr.compactMap{ Int($0) }
        
        for item in tempArr {
            if searchText.contains(item){
                remainingSearch = searchText.components(separatedBy: item)
                output.append(item)
            }
        }
        remainingSearch = remainingSearch.filter({ $0 != ""})
        
        if !remainingSearch.isEmpty && remainingSearch.first != "" {
            output.append(contentsOf: findSubstring(searchText: remainingSearch.first!))
        }
        return output
    }
}
