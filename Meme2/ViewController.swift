//
//  ViewController.swift
//  Meme2
//
//  Created by Cece Soudaly on 1/18/17.
//  Copyright © 2017 CeceMobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    // Get ahold of some villains, for the table
    // This is an array of Villain instances
    var allMemes = [Meme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: Implement flowLayout here.
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "EditMeme",
            style: .plain,
            target: self,
            action: #selector(editMeme))
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func editMeme() {
        let editController = self.storyboard!.instantiateViewController(withIdentifier: "Meme2ViewController") as! Meme2ViewController
        
        self.navigationController!.pushViewController(editController, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: Table View Data Source
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //get the save Memes
        
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        
        allMemes = appDelegate.memes
        
        print("allMemes === ",allMemes.count)
        tableView.reloadData()
         self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allMemes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
        
        let meme = self.allMemes[(indexPath as NSIndexPath).row]
        
        // textfield1.text! + textfield2.text!
        let first = meme.topTextField!+"..." + meme.bottomTextField!
       
        
        // Set the name and image
        cell.textLabel?.text = first
       
        cell.imageView?.image =  meme.originalImage
        
//        // If the cell has a detail label, we will put the evil scheme in.
//        if let detailTextLabel = cell.detailTextLabel {
//            detailTextLabel.text = "Scheme: \(villain.evilScheme)"
//        }

        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "VillainDetailViewController") as! VillainDetailViewController
//        detailController.villain = self.allVillains[(indexPath as NSIndexPath).row]
//        self.navigationController!.pushViewController(detailController, animated: true)
//    }
}
