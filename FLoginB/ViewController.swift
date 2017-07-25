//
//  ViewController.swift
//  FLoginB
//
//  Created by AlexanderYakovenko on 7/25/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookShare
import FacebookCore


import FBSDKCoreKit
import FBSDKLoginKit


class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    // FB 1
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    // FB 1 end
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // FB 2
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self
        
        
        if let token = FBSDKAccessToken.current() {
            //fetchProfile()
            
            //goToTabBarController()
        }
        // FB 2 end
        
        
    }
    
    
    
    
    // FB 3
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("completed login")
        
        goToTabBarController()
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func fetchProfile() {
        print("fetch Profile")
        
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start {(connection, result, error) -> Void in
            if error != nil {
                print(error!)
            }
            
            if let email = (result as AnyObject)["email"]! as? String {
                print(email)
            }
           print(result!)
           
        }
        
    }
    // FB 3 end
    
    
    
    
    func goToTabBarController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBar") as! TabBar
        //navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true, completion: nil)
    }
    
    
    

}

