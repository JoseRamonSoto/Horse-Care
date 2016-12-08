//
//  ViewController.swift
//  Horse care
//
//  Created by Jose Ramon Soto on 12/5/16.
//  Copyright © 2016 Jose Ramon Soto. All rights reserved.
//

import UIKit
import LocalAuthentication

enum LAError : Int {
    case AuthenticationFailed
    case UserCancel
    case UserFallback
    case SystemCancel
    case PasscodeNotSet
    case TouchIDNotAvailable
    case TouchIDNotEnrolled

class ViewController: UIViewController
{

    var profileImageView = UIImage()
    var TouchIDNotEnrolled = LATouchIDAuthenticationMaximumAllowableReuseDuration
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        authenticateUser()
    }
    
    func authenticateUser()
    {
        let context : LAContext = LAContext()
        var error : NSError?
        var myLocalizedReasonString : NSString = "Authentication is required"
        
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error)
        {
        context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString as String, reply: { (success : Bool, evaluationError : NSError?) -> Void in } as! (Bool, Error?) -> Void)

        }
    
        
    switch error!.code
    {
    case LAError.TouchIDNotEnrolled.rawValue:
    print("TouchID not enrolled")
    case LAError.PasscodeNotSet.rawValue:
    print("Passcode not set")
    default:
    print("TouchID not available")
        }
    self.showPasswordAlert()
    }
    
    
    func loadData()
    {
        print("Load data")
    }

    
    func showPasswordAlert() {}
    

    }
}
