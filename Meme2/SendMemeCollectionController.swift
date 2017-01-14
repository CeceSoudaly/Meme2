//
//  SendMemeCollectionView.swift
//  Meme2
//
//  Created by Cece Soudaly on 1/14/17.
//  Copyright © 2017 CeceMobile. All rights reserved.
//

import Foundation
import UIKit

class SendMemeCollectionController: UICollectionViewController {
    
    
//    // MARK: Life Cycle
//    // Get ahold of some memes, for the table
//    // This is an array of Memes instances
//    let allMemes = Meme2ViewController.allMemes
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //TODO: Implement flowLayout here.
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            title: "Edit",
//            style: .plain,
//            target: self,
//            action: #selector(editMeme))
//    }
//    
//    func editMeme() {
//        let editController = self.storyboard!.instantiateViewController(withIdentifier: "Meme2ViewController") as! Meme2ViewController
//        
//        self.navigationController!.pushViewController(editController, animated: true)
//    }
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.tabBarController?.tabBar.isHidden = false
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.tabBarController?.tabBar.isHidden = true
//        
//    }
//    
//    // MARK: Collection View Data Source
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.allMemes.count
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
//        let meme = self.allMemes[(indexPath as NSIndexPath).row]
//        
//        // Set the name and image
//        cell.TopLabel.text = meme.topTextField
//        cell.BottomLabel.text = meme.bottomTextField
//        cell.ImageView.image = meme.memedImage
//        
//        return cell
//    }
//    //
//    //        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
//    //
//    //            let detailController = self.storyboard!.instantiateViewController(withIdentifier: "VillainDetailViewController") as! VillainDetailViewController
//    //            detailController.villain = self.allVillains[(indexPath as NSIndexPath).row]
//    //            self.navigationController!.pushViewController(detailController, animated: true)
//    //
//    //        }
//    
    
}

