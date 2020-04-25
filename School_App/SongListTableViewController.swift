//
//  SongListTableViewController.swift
//  School_App
//
//  Created by Adam B on 4/19/20.
//  Copyright © 2020 Adam B. All rights reserved.
//

import UIKit
import CoreData

class SongListTableViewController: UITableViewController {
    
    //let SongList = ["Hey Jude", "Yesterday", "When I'm 64"]
    
    //Variables for communicating with CoreData
    var dataSource: [Song] = []
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            dataSource = try context?.fetch(Song.fetchRequest()) ?? []
        }
        catch let error as NSError {
            print("Cannot load data: \(error)")
        }
    }
    
    @IBAction func unwindFromSave(segue: UIStoryboardSegue){
        // Get the segure Source.
        guard let source = segue.source as? AddChordsChorusViewController else {
            print("cannot get segue source.")
            return
        }
        
        // Create a new song record
        let song = Song(context: context!)
        //Set attributes in the new song record
        song.songTitle = source.songTitle
        song.songArtist = source.songArtist
        song.chorusChords = source.chorusChords as NSObject
        song.verseChords = source.verseChords as NSObject
        
        
        do {
            // Update the data store with the manage context
            try context?.save()
            // Add this record to the table view data source
            dataSource.append(song)
            // Reload the data in the table view
            self.tableView.reloadData()
        }
        catch let error as NSError {
            print("Cannot save data: \(error)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dataSource[indexPath[1]].songTitle
        cell.detailTextLabel?.text = dataSource[indexPath[1]].songArtist
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedIndex = indexPath
        performSegue(withIdentifier: "toChordList", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toChordList") {
            
        }
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
