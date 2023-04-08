//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultTitle: UILabel!
    
    @IBOutlet var resultDefinition: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    var answers: [Answer]!
    var animalDefinition = Animal.cat
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func calculatedAnswers(from answers: [Answer]) -> Animal? {
        let animalCounts = answers.reduce(into: [:]) { counts, answer in
            counts[answer.animal, default: 0] += 1
        }
        
        let frequentAnimals = animalCounts.filter { $0.value == animalCounts.values.max() }.keys
        return frequentAnimals.first
    }
    func getResultTitle() -> String {
        if let animal = answers.first?.animal {
            resultTitle.text = "Вы - \(String(animal.rawValue))"
        }
        return ""
    }
    
    func getResultDefinition() -> String {
        if let animal = answers.first?.animal {
            resultDefinition.text = animal.definition
        }
        return ""
    }
}
