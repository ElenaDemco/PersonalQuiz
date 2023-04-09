//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var resultTitle: UILabel!
    @IBOutlet var resultDefinition: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        getResult(from: calculatedAnswers(from: answers))
    }
    // MARK: - Public Properties
    
    var answers: [Answer]!
    
    // MARK: - IB Action
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func calculatedAnswers(from answers: [Answer]) -> Animal? {
        return answers.reduce(into: [:]) { counts, answer in
            counts[answer.animal, default: 0] += 1
        }.max(by: { $0.value < $1.value })?.key
    }
    
    private func getResult(from animal: Animal?) {
        resultTitle.text = "Вы - \(animal?.rawValue ?? "🐱")"
        resultDefinition.text = animal?.definition
    }
}
