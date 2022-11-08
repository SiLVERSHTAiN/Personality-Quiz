//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Aleksandr on 11/7/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var singleButton: [UIButton]!
    @IBOutlet var singleStackView: UIStackView!
    
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    private let question = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func singleAnswerBtnPressed(_ sender: UIButton) {
        let currentAnswers = question[questionIndex].answers
        guard let currentIndex = singleButton.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerBtnPressed() {
        let currentAnswers = question[questionIndex].answers
        
        for (switches, answer) in zip(multipleSwitches, currentAnswers) {
            if switches.isOn {
                answersChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerBtnPressed() {
        let currentAnswers = question[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = question[questionIndex]
        questionLabel.text = currentQuestion.text
        
        let totalProgress = Float(questionIndex / question.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(question.count)"
        let currentAnswers = currentQuestion.answers
        
        switch currentQuestion.type {
        case .single:
            showSingleSV(using: currentAnswers)
        case .multiple:
            showMultipleSV(using: currentAnswers)
        case .ranged:
            showRangedSV(using: currentAnswers)
        }
    }
    
    private func showSingleSV(using answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButton, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleSV(using answers: [Answer]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedSV(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < question.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }

}
