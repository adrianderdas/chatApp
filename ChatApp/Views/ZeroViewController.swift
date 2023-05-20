//
//  ZeroViewController.swift
//  ChatApp
//
//  Created by Adrian Derdaś on 20/05/2023.
//

import UIKit
import FirebaseAuth
import JGProgressHUD

class ZeroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 


    }
    
    override func viewDidAppear(_ animated: Bool) {
        validateAuth()
        spinner.show(in: view)
    }
    
    private let spinner = JGProgressHUD(style: .dark)
    
    

    func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
            print("User no logged in")
        }
        else {
            //let wc = ConversationsViewController()
            //let naw = UINavigationController(rootViewController: wc)
            //naw.modalPresentationStyle = .fullScreen
            //present(naw, animated: false)
            performSegue(withIdentifier: "run", sender: nil)
            print("User logged in")
        }
        
    }
}
