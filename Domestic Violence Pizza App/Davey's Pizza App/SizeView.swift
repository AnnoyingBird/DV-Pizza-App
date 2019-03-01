//  SizeCrust.swift
//  Domestic Violence Pizza App

import UIKit

class SizeView: UIViewController {
    @IBOutlet var allSize: [UISwitch]!
    @IBOutlet var allCrust: [UISwitch]!

    @IBAction func allSwitchesChanges(_ sender: UISwitch) {
        if allSize.contains(sender) {
            allSize.forEach { size in size.setOn(false, animated: true) }
        }
        if allCrust.contains(sender) {
            allCrust.forEach { crust in crust.setOn(false, animated: true) }
        }
        sender.setOn(true, animated: true)
    }

    @IBAction func next(_: Any) {
        var opts: [String: String] = ["size": "", "crust": ""]
        allSize.forEach { size in
            if size.isOn {
                opts["size"] = size.accessibilityLabel!
            }
        }
        allCrust.forEach { crust in
            if crust.isOn {
                opts["crust"] = crust.accessibilityLabel!
            }
        }
        if (opts["size"]?.isEmpty)! || (opts["crust"]?.isEmpty)! {
            return
        }
        if let view = storyboard?.instantiateViewController(withIdentifier: "SauceView") as? SauceView {
            navigationController?.pushViewController(view, animated: true)
            UserDefaults.standard.set(opts, forKey: "current")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
