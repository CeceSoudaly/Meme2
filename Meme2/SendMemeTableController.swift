//
//  SendMemeTableController.swift
//  Meme2
//
//  Created by Cece Soudaly on 1/14/17.
//  Copyright © 2017 CeceMobile. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate

class SendMemeTableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances
   var allMemes = [Meme]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
        
        print("how many saved ",self.allMemes.count)
        
    }
    // MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allMemes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
 //       let cell = tableView.dequeueReusableCell(withIdentifier: "MemeViewCell", for: indexPath) as! MemeViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell")!
        let meme = self.allMemes[(indexPath as NSIndexPath).row]

        // Set the name and image
  /*      cell.TopLabel.text = meme.topTextField
        cell.BottomLabel.text = meme.bottomTextField
        cell.ImageView.image = meme.memedImage*/
      
        
//        // If the cell has a detail label, we will put the evil scheme in.
//        if let detailTextLabel = cell.detailTextLabel {
//            detailTextLabel.text = "Scheme: \(villain.evilScheme)"
//        }
        tableView.reloadData()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "VillainDetailViewController") as! VillainDetailViewController
//        detailController.villain = self.allVillains[(indexPath as NSIndexPath).row]
//        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
