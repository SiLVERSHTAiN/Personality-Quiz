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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
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
    
    private func showSingleSV(using answer: [Answer]) {
        singleStackView.isHidden = false
    }
    
    private func showMultipleSV(using answer: [Answer]) {
        multipleStackView.isHidden = false
    }
    
    private func showRangedSV(using answer: [Answer]) {
        rangedStackView.isHidden = false
    }

}
