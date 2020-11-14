//
//  CharactersTableViewController.swift
//  HW.2.10
//
//  Created by Сергей on 14.11.2020.
//

import UIKit

enum URLRickAndMorty: String {
    case character = "https://rickandmortyapi.com/api/character/"
    //удалить если не пригодятся
    case location = "https://rickandmortyapi.com/api/location/"
    case episode = "https://rickandmortyapi.com/api/episode/"
}

class CharactersTableViewController: UITableViewController {
    var characters = Character(results: [])
    
//    var character: Result = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchcharacters()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.results.count
//        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "character", for: indexPath)
        let person = characters.results[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = person.name
        cell.contentConfiguration = content
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension CharactersTableViewController {
    private func fetchcharacters() {
        guard let url = URL(string: URLRickAndMorty.character.rawValue) else { return }
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
