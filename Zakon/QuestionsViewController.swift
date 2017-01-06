//
//  QuestionsViewController.swift
//  Zakon
//
//  Created by assel on 12/22/16.
//  Copyright © 2016 AA. All rights reserved.
//

import UIKit
import Firebase

class QuestionsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var variantsTable: UITableView!
    var questions = [Question]()
    var questionIndex = -1
    var ref: FIRDatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
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
        // Заполняет массив questions вопросами с базы
        
        ref.child("questions").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let ques = snapshot.children
            
            while let question = ques.nextObject() as? FIRDataSnapshot{
                let val = question.value as? NSDictionary
                let q = Question()
                q.question = val?["question"] as? String
                var variants = [String]()
                for v in (val?["variants"] as? [String: String])! {
                    variants.append(v.value)
                    if v.key == "r" {
                        q.rightAnswer = v.value
                    }
                }
                q.variants = variants
                
                self.questions.append(q)
            }
        
            self.showNextQuestion()
            
            DispatchQueue.main.async {
                self.variantsTable.reloadData()
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
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
        if questions.count > 0 {
            return (questions[questionIndex].variants!.count)
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "variantCell", for: indexPath) as! VariantTableViewCell

        if questions.count > 0 {
            cell.variantText.text = questions[questionIndex].variants?[indexPath.row]
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: tableView.indexPathForSelectedRow!) as? VariantTableViewCell
        
        questions[questionIndex].userAnswer = cell?.variantText.text
        
    }
    
}
