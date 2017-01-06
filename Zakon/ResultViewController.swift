//
//  ResultViewController.swift
//  Zakon
//
//  Created by assel on 12/22/16.
//  Copyright © 2016 AA. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getResult()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getResult(){
        var rightCount = 0
        for (index, question) in questions.enumerated(){
            print(question)
            if(questions[index].userAnswer==questions[index].rightAnswer){
                rightCount = rightCount+1
            }
        }
        resultLabel.text = String(rightCount)+" iz 10"
    }
    
    @IBAction func answersButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toAnswersVC", sender: nil)
    }
    
    @IBAction func menuButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toMenuVC", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
