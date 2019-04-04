//
//  ViewController.swift
//  OtpSecureShowcase
//
//  Created by Diego Sepúlveda Blanco on 07/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import UIKit

import OtpSecure

class OperationInfoViewController: UIViewController {
    
    let FROM_OPERATION_INFO_TO_VALIDATE_TOKEN_VC = "toValidateTokenViewController"
    
    var token: String = ""
    
    @IBOutlet weak var tokenTextField: UITextField!
    
    @IBOutlet weak var mandatoryTokenLabel: UILabel!
    
    @IBOutlet weak var invalidTokenLabel: UILabel!
    
    @IBAction func onRetrieveOperationInfo(_ sender: Any) {
        mandatoryTokenLabel.isHidden = true
        invalidTokenLabel.isHidden = true
        
        token = tokenTextField.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        if token.isEmpty {
            mandatoryTokenLabel.isHidden = false
            return;
        }
        
        OtpSecure.retrieveOperationInfoByToken(token: token, completionHandler: onOperationInfoRetrieved)

    }
    
    func onOperationInfoRetrieved(result: Result<OperationInfo, Error>) -> Void {
        switch result {
        case .success(let data):
            if data.status != nil {
                self.setErrorText(text: data.html)
                return
            }
            print("Success --> prepare for segue with data: \(data)")
            DispatchQueue.main.async(execute: {
                self.performSegue(withIdentifier: self.FROM_OPERATION_INFO_TO_VALIDATE_TOKEN_VC, sender: data)
            })
        case .failure(let error):
            print("Error while retrieving token --> \(error)")
            self.setErrorText(text: error.localizedDescription)
        }
    }

    func setErrorText(text: String) {
        DispatchQueue.main.async(execute: {
            self.invalidTokenLabel.text = text
            self.invalidTokenLabel.isHidden = false
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == FROM_OPERATION_INFO_TO_VALIDATE_TOKEN_VC {
                if let validateTokenViewController = segue.destination as? ValidateTokenViewController {
                    validateTokenViewController.token = token
                    validateTokenViewController.operationInfo = (sender as! OperationInfo)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
