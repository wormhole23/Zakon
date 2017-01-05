//
//  QuestionsViewController.swift
//  Zakon
//
//  Created by assel on 12/22/16.
//  Copyright © 2016 AA. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var questionText: UITextView!
    var questions = [Question]()
    var questionIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateQuestions()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if(questionIndex==10){
            self.performSegue(withIdentifier: "toResultVC", sender: nil)
        }else{
            showNextQuestion()
        }
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
        //var1.text = questions[questionIndex].varinats?[0]
        //var2.text = questions[questionIndex].varinats?[1]
        //var3.text = questions[questionIndex].varinats?[2]
    }
    
    func showPrevQuestion(){
        // Выводит на view предыдущий вопрос по индексу
        questionIndex = questionIndex-1
        questionText.text = questions[questionIndex].question
        //var1.text = questions[questionIndex].varinats?[0]
        //var2.text = questions[questionIndex].varinats?[1]
        //var3.text = questions[questionIndex].varinats?[2]
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
