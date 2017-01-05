//
//  ViewController.swift
//  Zakon
//
//  Created by assel on 12/20/16.
//  Copyright © 2016 AA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var questions: [Question]?
    var questionIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        
        questions?.append(q1)
        questions?.append(q2)
        
        showNextQuestion()
    }
    
    func showNextQuestion() {
        // Выводит на view следующий вопрос по индексу
        
    }
    
    func showPrevQuestion(){
        // Выводит на view предыдущий вопрос по индексу
        
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toQuestionsVC", sender: nil)
    }

}

