//
//  AnswersViewController.swift
//  Zakon
//
//  Created by assel on 12/24/16.
//  Copyright © 2016 AA. All rights reserved.
//

import UIKit

class AnswersViewController: UIViewController {

    @IBOutlet weak var answersTable: UITableView!
    var questions = [Question]()
    var numOfRightAns = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answersTable.delegate = self
        answersTable.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toResultVC", sender: nil)
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
extension AnswersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numOfRows=numOfQuestions+numOfRightAns+(numOfQuestions-numOfRightAns)*2
        return numOfRightAns//numOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionsViewCell
        
        cell.questionLabel.text = "question,user's answer and right answer(if user's answer not right"
        
        return cell
        
    }
    
    
}

