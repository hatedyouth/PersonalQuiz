//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalTypeLabel: UILabel!
    @IBOutlet weak var animalDescriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResul()
        
        
    }

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }
}

extension ResultViewController {
    
    private func updateResul() {
        var counterOfAnimals: [Animal: Int] = [:]
        let animals = answers!.map { $0.animal }
        
        for animal in animals {
            if let counter = counterOfAnimals[animal] {
                counterOfAnimals.updateValue(counter + 1, forKey: animal)
            } else {
                counterOfAnimals[animal] = 1
            }
        }
        let sortedCounterOfAnimals = counterOfAnimals.sorted { $0.value > $1.value}
        guard let mostOfAnimals = sortedCounterOfAnimals.first?.key else {return}
        updateUI(with: mostOfAnimals)
        
    }
    
    private func updateUI(with animal: Animal?) {
        animalTypeLabel.text = "Вы  - \(animal?.rawValue ?? "🐼")!"
        animalDescriptionLabel.text = animal?.definition ?? ""

    }
    
    
}
