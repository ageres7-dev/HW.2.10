//
//  DetailsViewController.swift
//  HW.2.10
//
//  Created by Сергей on 15.11.2020.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var characterPhoto: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var infoLabels: [UILabel]!
    
    var characterInfo: Results!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = characterInfo.name
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        characterPhoto.layer.cornerRadius = characterPhoto.frame.width / 2
        fetchImage()
        setInfoLabels()
        
//        characterInfo.origin.name
        
    }
    private func setInfoLabels() {
        infoLabels.forEach { (label) in

            switch label.tag {
            case 0: label.text = "Status: \(characterInfo.status)"
            case 1: label.text = "Species: \(characterInfo.species)"
            case 2: label.text = "Type: \(characterInfo.type)"
            case 3: label.text = "Gender: \(characterInfo.gender)"
            case 4: label.text = "Origin location: \(characterInfo.origin.name)"
            default: label.text =
                "Last known location endpoint:\n \(characterInfo.location.name)"
            }
        }
        
    }
    
    private func fetchImage() {
        guard let url = URL(string: characterInfo.image) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.characterPhoto.image = image
                    self.activityIndicator.stopAnimating()
                }
            }
            
        }.resume()
    }

}
