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

class SendMemeTableController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: Properties

    
   var allMemes = [Meme]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
        //get the save Memes
        
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        
        allMemes = appDelegate.memes
        
        print("table allMemes === ",allMemes.count)
//        tableView.reloadData()
    }
   

    // MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allMemes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell")!
        let meme = self.allMemes[(indexPath as NSIndexPath).row]
 
        // Set the name and image
        cell.textLabel?.text = meme.topTextField
        cell.imageView?.image = meme.originalImage
        
    
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
