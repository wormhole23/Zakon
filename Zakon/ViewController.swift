//
//  ViewController.swift
//  Zakon
//
//  Created by assel on 12/20/16.
//  Copyright © 2016 AA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toQuestionsVC", sender: nil)
    }

}

