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


    // MARK: Life Cycle
    // Get ahold of some memes, for the table
    // This is an array of Memes instances
    //    let object = UIApplication.shared.delegate
    //    let appDelegate = object as! AppDelegate

    var allMemes = [Meme]()



        override func viewDidLoad() {
            super.viewDidLoad()
            //TODO: Implement flowLayout here.
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: "EditMeme",
                style: .plain,
                target: self,
                action: #selector(editMeme))
        }

        func editMeme() {
            let editController = self.storyboard!.instantiateViewController(withIdentifier: "Meme2ViewController") as! Meme2ViewController
            
            self.navigationController!.pushViewController(editController, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        }


        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.tabBarController?.tabBar.isHidden = false
            
            //get the save Memes
            
            let object = UIApplication.shared.delegate
            let appDelegate = object as! AppDelegate
            
            allMemes = appDelegate.memes
            
            print("allMemes === ",allMemes.count)
            collectionView?.reloadData()
         }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
        }

        // MARK: Collection View Data Source

        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.allMemes.count
        }

        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeViewCell", for: indexPath) as! MemeViewCell
            let meme = self.allMemes[(indexPath as NSIndexPath).row]
            
            // Set the name and image
            cell.TopLabel.text = meme.topTextField
            cell.BottomLabel.text = meme.bottomTextField
            cell.ImageView.image = meme.originalImage
            
            return cell
        }

        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {

            let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
            
            detailController.meme = self.allMemes[(indexPath as NSIndexPath).row]
            self.navigationController!.pushViewController(detailController, animated: true)

        }
        
        func adjustFlowLayout(size: CGSize) {
            let space: CGFloat = 1.5
            let dimension:CGFloat = size.width >= size.height ? (size.width - (5 * space)) / 6.0 :  (size.width - (2 * space)) / 3.0
            
//            ç.minimumInteritemSpacing = space
//            flowLayout.minimumLineSpacing = space
//            flowLayout.itemSize = CGSizeMake(dimension, dimension)
        }


    }

