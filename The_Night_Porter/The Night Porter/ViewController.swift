//
//  ViewController.swift
//  The Night Porter
//
//  Created by Devon Dapuzzo on 8/10/20.
//  Copyright © 2020 Devon Dapuzzo. All rights reserved.
//

import UIKit

struct TaskSection {
    var title: String
    var tasks: [String]
}


struct Superhero {
    var background: UIColor
    var text: UIColor
    var name: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    let superheroColors: [Superhero] = [
        Superhero(background: UIColor.purple, text: UIColor.green, name: "HULK"),
        Superhero(background: UIColor.red, text: UIColor.blue, name: "SPIDERMAN"),
        Superhero(background: UIColor.blue, text: UIColor.red, name: "SUPERMAN"),
        Superhero(background: UIColor.yellow, text: UIColor.red, name: "IRONMAN"),
        Superhero(background: UIColor.black, text: UIColor.yellow, name: "BATMAN")
    ]
    var superheroIndex = 0;

    let tasks = [
        TaskSection(
                title: "Daily Tasks",
                tasks: [
                    "Check all windows",
                    "Check all doors",
                    "Check boiler fuel",
                    "Check mailbox",
                    "Empty trash",
                    "Check pipes",
                    "Document ~spooky~ happenings",
                    "Check all windows",
                    "Check all doors",
                    "Check boiler fuel",
                    "Check mailbox",
                    "Empty trash",
                    "Check pipes",
                    "Document ~spooky~ happenings",
                ]
        ),
        TaskSection(
                title: "Weekly Tasks",
                tasks: [
                    "Check inside all cabins",
                    "Flush all lavatories in cabins",
                    "Walk perimeter of property",
                    "Check inside all cabins",
                    "Flush all lavatories in cabins",
                    "Walk perimeter of property",
                    "Check inside all cabins",
                    "Flush all lavatories in cabins",
                    "Walk perimeter of property",
                    "Check inside all cabins",
                    "Flush all lavatories in cabins",
                    "Walk perimeter of property",
                    "Check inside all cabins",
                    "Flush all lavatories in cabins",
                    "Walk perimeter of property"
                ]
        ),
        TaskSection(
                title: "Monthly Tasks",
                tasks: [
                    "Test security alarm",
                    "Test motion detector",
                    "Test smoke alarm",
                    "Test security alarm",
                    "Test motion detector",
                    "Test smoke alarm",
                    "Test security alarm",
                    "Test motion detector",
                    "Test smoke alarm",
                    "Test security alarm",
                    "Test motion detector",
                    "Test smoke alarm",
                    "Test security alarm",
                    "Test motion detector",
                    "Test smoke alarm"
                ]
        )
    ]


    @IBOutlet weak var superheroLabel: UILabel!

    @IBAction func togglePartyMode(_ sender: Any) {
        let superhero = superheroColors[superheroIndex]

        view.backgroundColor = superhero.background

        view.subviews.filter {
                    $0 is UILabel
                }
                .map {
                    $0 as! UILabel
                }
                .forEach {
                    $0.textColor = superhero.text
                }

        superheroLabel.text = superhero.name

        superheroIndex = (superheroIndex + 1) % superheroColors.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks[section].tasks.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tasks[section].title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.section].tasks[indexPath.row]
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(indexPath.row) in section \(indexPath.section)")
    }
}
