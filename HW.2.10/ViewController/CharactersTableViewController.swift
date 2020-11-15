//
//  CharactersTableViewController.swift
//  HW.2.10
//
//  Created by Сергей on 14.11.2020.
//

import UIKit


class CharactersTableViewController: UITableViewController {
    private var characters = Character(results: [])
    private let characterURL = "https://rickandmortyapi.com/api/character/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.results.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "character", for: indexPath) as! CharacterTableViewCell

        let person = characters.results[indexPath.row]
        cell.configure(with: person)
        /*
        var content = cell.defaultContentConfiguration()
        content.text = person.name
        content.imageProperties.cornerRadius = 20
        content.imageProperties.reservedLayoutSize = CGSize(width: 40, height: 40)
        content.imageProperties.maximumSize = CGSize(width: 40, height: 40)
        content.image = UIImage(named: "default")
        
        DispatchQueue.global().async {
            let stringURL = person.image
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                content.image = UIImage(data: imageData)
                cell.contentConfiguration = content
            }
        }
        
        cell.contentConfiguration = content
         */
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! DetailsViewController
        guard let indexPath = tableView.indexPathForSelectedRow else
        { return }
        detailsVC.characterInfo = characters.results[indexPath.row]
    }

}


extension CharactersTableViewController {
  
    private func fetchCharacters() {
        guard let url = URL(string: characterURL) else { return }
        URLSession.shared.dataTask(with: url) { [self] (data, _, error) in
            
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            do {
                self.characters = try JSONDecoder().decode(Character.self, from: data)
                print(data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
        
    }
    
}
