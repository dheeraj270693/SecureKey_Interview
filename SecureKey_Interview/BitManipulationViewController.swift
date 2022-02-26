//
//  ViewController.swift
//  SecureKey_Interview
//
//  Created by Dheeraj's MacBook Pro on 2022-02-26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstIntegerTextfield: UITextField!
    @IBOutlet weak var secondIntegerTextfield: UITextField!
    @IBOutlet weak var resultTextfield: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    var first: String = ""
    var second: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstIntegerTextfield.delegate = self
        secondIntegerTextfield.delegate = self
        resultTextfield.delegate = self
        errorLabel.isHidden = true
    }
    
    @IBAction func calculateBtnClicked(_ sender: Any) {
        if firstIntegerTextfield.text == "" || secondIntegerTextfield.text == "" {
            errorLabel.isHidden = false
            errorLabel.text = "Please enter X Integer and Y integer and then click Calculate."
        }
        else{
            errorLabel.isHidden = true
            first = firstIntegerTextfield.text!
            second = secondIntegerTextfield.text!
            first = String(UInt8(first)!.binaryDescription)
            second = String(UInt8(second)!.binaryDescription)
            
            resultTextfield.text = String(numberOfBits(s1: first, s2: second))
        }
    }
    
    func numberOfBits(s1: String, s2: String) -> Int {
        let nums1 = s1.split(separator: ".").map({ Int($0) ?? 0 })
        let nums2 = s2.split(separator: ".").map({ Int($0) ?? 0 })
        
        var count = 0
        for i in 0..<max(nums1.count, nums2.count) {
            
            let num1 = i < nums1.count ? nums1[i] : 0
            let num2 = i < nums2.count ? nums2[i] : 0
            
            let diff = num1 - num2
            if diff != 0 {
                count = count + 1
            }
        }
        return count
    }
}

extension BinaryInteger {
    var binaryDescription: String {
        var binaryString = ""
        var internalNumber = self
        var counter = 0

        for _ in (1...self.bitWidth) {
            binaryString.insert(contentsOf: "\(internalNumber & 1)", at: binaryString.startIndex)
            internalNumber >>= 1
            counter += 1
            if counter % 1 == 0 {
                binaryString.insert(contentsOf: ".", at: binaryString.startIndex)
            }
        }
        return binaryString
    }
}

