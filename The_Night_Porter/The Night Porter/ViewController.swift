//
//  ViewController.swift
//  The Night Porter
//
//  Created by Devon Dapuzzo on 8/10/20.
//  Copyright © 2020 Devon Dapuzzo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    struct Superhero {
        var background: UIColor
        var text: UIColor
        var name: String
    }

    let superheroColors: [Superhero] = [
        Superhero(background: UIColor.purple, text: UIColor.green, name: "HULK"),
        Superhero(background: UIColor.red, text: UIColor.blue, name: "SPIDERMAN"),
        Superhero(background: UIColor.blue, text: UIColor.red, name: "SUPERMAN"),
        Superhero(background: UIColor.yellow, text: UIColor.red, name: "IRONMAN"),
        Superhero(background: UIColor.black, text: UIColor.yellow, name: "BATMAN")
    ]

    var superheroIndex = 0;

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


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
