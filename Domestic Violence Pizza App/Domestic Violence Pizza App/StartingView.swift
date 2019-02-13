//  StartingPage.swift
//  Domestic Violence Pizza App

import UIKit

class StartingView: UIViewController {
    @IBOutlet var Customize: UIButton!
    @IBOutlet var QuickOrder: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true 

        // Do any additional setup after loading the view.
    }
}
