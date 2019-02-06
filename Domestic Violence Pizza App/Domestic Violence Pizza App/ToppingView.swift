//  Toppings.swift
//  Domestic Violence Pizza App

import UIKit

class ToppingView: UIViewController {
    @IBOutlet var AllMeat: [UISwitch]!
    @IBOutlet var AllVeggies: [UISwitch]!

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
        opts["meats"] = ""
        opts["veggies"] = ""
        AllMeat.forEach { s in
            if s.isOn {
                opts["meat"]!.append(s.accessibilityLabel! + ",")
            }
        }
        AllVeggies.forEach { s in
            if s.isOn {
                opts["veggies"]!.append(s.accessibilityLabel! + ",")
            }
        }
        if opts["meats"]!.isEmpty, opts["veggies"]!.isEmpty {
            return
        }
        let OrderComplete = storyboard?.instantiateViewController(withIdentifier: "OrderComplete")
        navigationController?.pushViewController(OrderComplete!, animated: true)
        UserDefaults.standard.set(opts, forKey: "current")
    }
}
