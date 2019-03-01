//  Toppings.swift
//  Domestic Violence Pizza App

import UIKit

class ToppingView: UIViewController {
    @IBOutlet var allToppings: [UISwitch]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func next(_: Any) {
        var opts: [String: String] = [:]
        if let tmp = UserDefaults.standard.object(forKey: "current") as? [String: String] {
            opts = tmp
        } else {
            // ERR!
            return
        }
        opts["toppings"] = ""
        allToppings.forEach { topping in
            if topping.isOn {
                opts["toppings"]!.append(topping.accessibilityLabel! + ",")
            }
        }
        let view = storyboard?.instantiateViewController(withIdentifier: "OrderMethod")
        navigationController?.pushViewController(view!, animated: true)
        UserDefaults.standard.set(opts, forKey: "current")
    }
}
