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

    @IBAction func Next(_: Any) {
        var opts: [String: String] = [:]
        AllSize.forEach { s in
            if s.isOn {
                opts["size"] = s.accessibilityLabel!
            }
        }
        AllCrust.forEach { s in
            if s.isOn {
                opts["crust"] = s.accessibilityLabel!
            }
        }
        if (opts["soze"]?.isEmpty)!, (opts["crust"]?.isEmpty)! {
            // ERR!
            return
        }
        UserDefaults.standard.set(opts, forKey: "current")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
