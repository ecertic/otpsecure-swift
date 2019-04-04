//
//  ValidateViewController.swift
//  OtpSecureShowcase
//
//  Created by Diego Sepúlveda Blanco on 14/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import UIKit

import OtpSecure

class ValidateTokenViewController: UIViewController {
    
    var token: String!
    
    var operationInfo: OperationInfo!
    
    @IBOutlet weak var htmlLabel: UILabel!
    
    @IBOutlet weak var otpTextField: UITextField!
    
    @IBOutlet weak var mandatoryOtpLabel: UILabel!
    
    @IBOutlet weak var invalidOtpLabel: UILabel!
    
    @IBAction func onValidateOtp(_ sender: Any) {
        mandatoryOtpLabel.isHidden = true
        invalidOtpLabel.isHidden = true

        let otp = otpTextField.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        if otp.isEmpty {
            mandatoryOtpLabel.isHidden = false
            return;
        }

        OtpSecure.validateToken(token: token, otp: otp, completionHandler: onTokenValidated)

    }
    
    func onTokenValidated(result: Result<Validation, Error>) -> Void {        
        switch result {
        case .success(let data):
            print("Success --> data: \(data)")
            self.setErrorText(text: data.msg)
        case .failure(let error):
            print("Error while retrieving token --> \(error)")
            self.setErrorText(text: error.localizedDescription)
        }
    }
    
    func setErrorText(text: String) {
        DispatchQueue.main.async(execute: {
            self.invalidOtpLabel.text = text
            self.invalidOtpLabel.isHidden = false
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("ValidateViewController.token --> \(token!)")
        print("ValidateViewController.operationInfo --> \(operationInfo!)")
        
        htmlLabel.text = operationInfo.html
    }
}
