//  SaucesDrinks.swift
//  Domestic Violence Pizza App

import UIKit

class SauceView: UIViewController {
    @IBAction func RedS(_: Any) {}

    @IBAction func WhiteS(_: Any) {}

    @IBAction func NoS(_: Any) {}

    @IBAction func ColaD(_: Any) {}

    @IBAction func OrangeD(_: Any) {}

    @IBAction func RootD(_: Any) {}

    override func viewDidLoad() {
        super.viewDidLoad()

    @IBAction func SaucesChanged(_ sender: Any) {
        AllSauces.forEach { s in s.setOn(false, animated: true) }
        (sender as! UISwitch).setOn(true, animated: true)
    }

    @IBAction func Next(_: Any) {
        var opts: [String: String] = [:]
        if let ok = UserDefaults.standard.object(forKey: "current") as? [String: String] {
            opts = ok
        } else {
            // ERR!
            return
        }
        opts["sauces"] = ""
        opts["drinks"] = ""
        AllSauces.forEach { s in
            if s.isOn {
                opts["sauce"] = s.accessibilityLabel!
            }
        }
        AllDrinks.forEach { s in
            if s.isOn {
                opts["drinks"]!.append(s.accessibilityLabel! + ",")
            }
        }
        if opts["sauce"]!.isEmpty {
            return
        }
        let ToppingView = storyboard?.instantiateViewController(withIdentifier: "ToppingView") as! ToppingView
        navigationController?.pushViewController(ToppingView, animated: true)
        UserDefaults.standard.set(opts, forKey: "current")
    }
}
