//
//  ViewController.swift
//  DataPersistence
//
//  Created by Tom Diggle on 13/11/2015.
//  Copyright © 2015 Tom Diggle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dataToSaveTextField: UITextField!
    @IBOutlet weak var dataSavedLabel: UILabel!
    @IBOutlet weak var loadSavedDataButton: UIButton!
    @IBOutlet weak var loadedDataLabel: UILabel!
    
    @IBAction func saveData(_: UIButton) {
        if let data = self.dataToSaveTextField.text?.dataUsingEncoding(NSUTF8StringEncoding) {
            try! DataPersistence.saveData(data, directory: .DocumentDirectory, filename: "Demo.data")
            
            dataSavedLabel.hidden = false
            dataSavedLabel.textColor = .greenColor()
            loadSavedDataButton.hidden = false
        } else {
            dataSavedLabel.hidden = false
            dataSavedLabel.textColor = .redColor()
            dataSavedLabel.text = "Data Failed to Save"
        }
    }
    
    @IBAction func loadSavedData(_: UIButton) {
        if let savedData = try! DataPersistence.loadData(.DocumentDirectory, filename: "Demo.data") as? NSData {
            let string = String(data: savedData, encoding:NSUTF8StringEncoding)
            self.loadedDataLabel.hidden = false
            self.loadedDataLabel.text = string
        }
    }
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

