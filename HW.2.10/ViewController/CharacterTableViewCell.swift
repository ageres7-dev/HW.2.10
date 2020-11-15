//
//  CharacterTableViewCell.swift
//  HW.2.10
//
//  Created by Сергей on 15.11.2020.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    func configure(with character: Results) {
        let selectedColor = UIView()
        selectedColor.backgroundColor = .systemGreen
        selectedBackgroundView = selectedColor
        
        var content = defaultContentConfiguration()
        
        content.text = character.name
        content.imageProperties.cornerRadius = 20
        content.imageProperties.reservedLayoutSize = CGSize(width: 40, height: 40)
        content.imageProperties.maximumSize = CGSize(width: 40, height: 40)
        content.image = UIImage(named: "default")
        
        DispatchQueue.global().async {
            let stringURL = character.image
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                content.image = UIImage(data: imageData)
                self.contentConfiguration = content
            }
            
        }
        contentConfiguration = content
    }
}
