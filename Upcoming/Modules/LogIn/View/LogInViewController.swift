//
//  LogInViewController.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import UIKit

protocol LogInViewControllerPresenterProtocol: AnyObject {
    
}

class LogInViewController: UIViewController {
    
    var presenter: LogInPresenterViewControllerProtocol?
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func validateButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

extension LogInViewController: LogInViewControllerPresenterProtocol {
    
}
