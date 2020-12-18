//
//  StarWarsTableViewController.swift
//  StarWarsAPI
//
//  Created by Field Employee on 12/18/20.
//

import UIKit

class StarWarsTableViewController: UITableViewController {
    var characters = ["Luke Skywalker", "C-3PO", "R2-D2", "Darth Vader", "Leia Organa", "Owen Lars", "Beru Whitesun lars", "R5-D4", "Biggs Darklighter", "Obi-Wan Kenobi"]
    
    var starWarsResults: [StarWarsResults] = []
    var starWars: [StarWars] = []
    var characterNames:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacters()
    }
    func getNames() {
        for i in self.starWars {
            self.characterNames.append(i.name)
            print("line 46 pokemonNames \(self.characterNames)")
        }
    }
    
    func getCharacters()  {
        URLSession.shared.dataTask(with:
        URL(string: "https://swapi.dev/api/people/?offset=1&limit=10")!)
        { (data, response, error) in
          guard let data = data else {
            print("no data found")
            return
          }
          do {
            let results = try JSONDecoder().decode(StarWarsResults.self, from: data)
            self.starWars.append(contentsOf: results.results)
            print("var character\(self.starWars)")
            print("starWarsResults returns \(self.starWarsResults)")
            self.getNames()
            
          } catch {
            print("There was an error")
          }
        }.resume()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = characters[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCharacter = characters[indexPath.row]
        performSegue(withIdentifier: "moveToCharacterDetail", sender: selectedCharacter)
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let characterViewController = segue.destination as?
            CharacterDetailViewController{
            if let selectedCharacter = sender as? String {
                characterViewController.character = selectedCharacter
            }
        }
    }
    

}
