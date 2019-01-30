//  SizeCrust.swift
//  Domestic Violence Pizza App

import UIKit

class SizeView: UIViewController {
    @IBOutlet var AllSize: [UISwitch]!
    @IBOutlet var AllCrust: [UISwitch]!

    @IBAction func AllSwitches(_ sender: Any) {
        if AllSize.contains(sender as! UISwitch) {
            AllSize.forEach { s in s.setOn(false, animated: true) }
        }
        if AllCrust.contains(sender as! UISwitch) {
            AllCrust.forEach { s in s.setOn(false, animated: true) }
        }
        (sender as! UISwitch).setOn(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
