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
        /*
         esli ya pravilno ponela =D, tipa esli user pravilno otvetil to vyvodit vopros i ego otvet (2 row), esli ne pravilno to vopros,otvet usera, pravilnyi otvet (3row)
    if(questions[questionIndex].userAnswer==questions[questionIndex].rightAnswer){
         return 2
        }else{
         return 3
         */
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionsViewCell
        
        cell.questionLabel.text = "eee"
        
        return cell
        
    }
    
    
}

