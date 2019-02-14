//  Toppings.swift
//  Domestic Violence Pizza App

import UIKit

class ToppingView: UIViewController {
    @IBOutlet var AllToppings: [UISwitch]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Next(_: Any) {
        var opts: [String: String] = [:]
        if let ok = UserDefaults.standard.object(forKey: "current") as? [String: String] {
            opts = ok
        } else {
            // ERR!
            return
        }
        opts["toppings"] = ""
        AllToppings.forEach { s in
            if s.isOn {
                opts["toppings"]!.append(s.accessibilityLabel! + ",")
            }
        }
        let OrderComplete = storyboard?.instantiateViewController(withIdentifier: "OrderMethod")
        navigationController?.pushViewController(OrderComplete!, animated: true)
        UserDefaults.standard.set(opts, forKey: "current")
    }
}
