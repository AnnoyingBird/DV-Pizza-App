//  SaucesDrinks.swift
//  Domestic Violence Pizza App

import UIKit

class SauceView: UIViewController {
    @IBOutlet var AllSauces: [UISwitch]!
    @IBOutlet var AllDrinks: [UISwitch]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Next(_ sender: Any) {
        UserDefaults.standard.object(forKey: "current") as? [String:String]
    }
}
