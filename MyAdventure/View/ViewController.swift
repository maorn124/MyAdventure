//
//  ViewController.swift
//  MyAdventure
//
//  Created by Maor Niv on 2/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    var adventuremodel = AdventureModel()
    var currentLayer = 1
    var congratulationsShown = false

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI() {
        let choices = adventuremodel.getChoices(forLayer: currentLayer)
        questionLabel.text = "Floor \(currentLayer)"
        
        optionOne.setTitle(choices[0].title, for: .normal)
        optionOne.tag = 0
        
        optionTwo.setTitle(choices[1].title, for: .normal)
        optionTwo.tag = 1
        
        optionOne.backgroundColor = UIColor.clear
        optionTwo.backgroundColor = UIColor.clear
    }


    @IBAction func choiceHit(_ sender: UIButton) {
        let choices = adventuremodel.getChoices(forLayer: currentLayer)
        let selectedChoice = choices[sender.tag]
        showAlert(with: selectedChoice.outcome)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            self.advanceToNextLayer()
            }
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title:"Adventure Outcome", message: message,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK",style: .default,handler: {_ in self.advanceToNextLayer() }))
        present(alert, animated: true,completion: nil)
    }
    
    func advanceToNextLayer() {
        if currentLayer < 3 {
            currentLayer += 1
            updateUI()
        } else {
            if !congratulationsShown {
                congratulationsShown = true
                showAlert(with: "Thank you for playing.")
            }
        }
    }
}

