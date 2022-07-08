//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
	
	// MARK: - IB Outlets
	@IBOutlet var resultLabel: UILabel!
	@IBOutlet var definitionLabel: UILabel!
	
	// MARK: - Public Properties
	var answers: [Answer]!
	
	// MARK: - Life Cycle Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.hidesBackButton = true
		showResult()
	}
	
	// MARK: - IB Actions
	@IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
		navigationController?.dismiss(animated: true)
	}
	
	// MARK: - Private Methods
	private func showResult() {
		let popularAnswer = answers.reduce(into: [Animal : Int]()) { partialResult, answer in
			partialResult[answer.animal, default: 0] += 1
		}
			.sorted {
				$0.value > $1.value
			}
			.first
		
		guard let result = popularAnswer else { return }
		
		resultLabel.text = "Вы - \(String(result.key.rawValue))"
		definitionLabel.text = result.key.definition
	}
	
}
