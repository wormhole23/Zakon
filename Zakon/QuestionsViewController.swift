//
//  QuestionsViewController.swift
//  Zakon
//
//  Created by assel on 12/22/16.
//  Copyright © 2016 AA. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var variantsTable: UITableView!
    var questions = [Question]()
    var questionIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        variantsTable.delegate = self
        variantsTable.dataSource = self
        
        populateQuestions()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateQuestions() {
        // Заполняет массив questions вопросами с базы,
        // но пока будем вбивать значения вручную
        let q1 = Question()
        q1.question = "Вы знаете конституцию РК?"
        q1.varinats = ["Да", "Нет", "Может быть"]
        q1.rightAnswer = "Может быть"
        
        let q2 = Question()
        q2.question = "Легальна ли марихуана в РК?"
        q2.varinats = ["Да", "Нет"]
        q2.rightAnswer = "Нет"
        
        questions.append(q1)
        questions.append(q2)
        
        showNextQuestion()
    }
    
    func showNextQuestion() {
        // Выводит на view следующий вопрос по индексу
        questionIndex = questionIndex+1
        questionText.text = questions[questionIndex].question
        self.variantsTable.reloadData()
    }
    
    func showPrevQuestion(){
        // Выводит на view предыдущий вопрос по индексу
        questionIndex = questionIndex-1
        questionText.text = questions[questionIndex].question
        self.variantsTable.reloadData()

    }

    @IBAction func nextButtonPressed(_ sender: AnyObject) {
        if(questionIndex == 1){
            self.performSegue(withIdentifier: "toResultVC", sender: nil)
        } else {
            showNextQuestion()
        }
    }

    @IBAction func prevButtonPressed(_ sender: AnyObject) {
        if(questionIndex == 0){
            
        } else {
            showPrevQuestion()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination.isKind(of: ResultViewController.self)) {
            let resultVC = segue.destination as! ResultViewController
            resultVC.questions = self.questions
        }
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

extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (questions[questionIndex].varinats!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "variantCell", for: indexPath) as! VariantTableViewCell

        
        cell.variantText.text = questions[questionIndex].varinats?[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: tableView.indexPathForSelectedRow!) as? VariantTableViewCell
        
        questions[questionIndex].userAnswer = cell?.variantText.text
        
    }
    
}
