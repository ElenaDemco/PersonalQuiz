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
        getResultTitle()
        getResultDefinition()
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
    
    func getResultTitle() {
        if let animal = calculatedAnswers(from: answers) {
            return resultTitle.text = "Вы - \(String(animal.rawValue))"
        }
    }
    
    func getResultDefinition() {
        if let animal = calculatedAnswers(from: answers) {
            return resultDefinition.text = animal.definition
        }
    }
}
