//  SaucesDrinks.swift
//  Domestic Violence Pizza App

import UIKit

class SauceView: UIViewController {
    @IBOutlet var allSauces: [UISwitch]!
    @IBOutlet var allDrinks: [UISwitch]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saucesChanged(_ sender: UISwitch) {
        allSauces.forEach { sauce in sauce.setOn(false, animated: true) }
        sender.setOn(true, animated: true)
    }

    @IBAction func next(_: Any) {
        var opts: [String: String] = [:]
        if let tmp = UserDefaults.standard.object(forKey: "current") as? [String: String] {
            opts = tmp
        } else {
            // ERR!
            return
        }
        opts["sauces"] = ""
        opts["drinks"] = ""
        allSauces.forEach { sauce in
            if sauce.isOn {
                opts["sauce"] = sauce.accessibilityLabel!
            }
        }
        allDrinks.forEach { drink in
            if drink.isOn {
                opts["drinks"]!.append(drink.accessibilityLabel! + ",")
            }
        }
        if opts["sauce"]!.isEmpty {
            return
        }
        if let view = storyboard?.instantiateViewController(withIdentifier: "ToppingView") as? ToppingView {
            navigationController?.pushViewController(view, animated: true)
            UserDefaults.standard.set(opts, forKey: "current")
        }
    }
}
