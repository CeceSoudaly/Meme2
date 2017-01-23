    //
    //  SendMemeCollectionView.swift
    //  Meme2
    //
    //  Created by Cece Soudaly on 1/14/17.
    //  Copyright © 2017 CeceMobile. All rights reserved.
    //

    import Foundation
    import UIKit

    class MemeCollectionController: UICollectionViewController {


    // MARK: Life Cycle
    // Get ahold of some memes, for the table
    // This is an array of Memes instances
    //    let object = UIApplication.shared.delegate
    //    let appDelegate = object as! AppDelegate

    var allMemes = [Meme]()
    
    let margin: CGFloat = 10
    let cellsPerRow: CGFloat = 3
    
    let memeFontAttributes = [
        
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 30)!,
        NSStrokeWidthAttributeName: -3.0
        
        ] as [String : Any]
    

        override func viewDidLoad() {
            super.viewDidLoad()
            
            navigationItem.rightBarButtonItem =   UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(editMeme))
        
            
            //view flowlayout
            guard let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
            flowLayout.minimumInteritemSpacing = margin
            flowLayout.minimumLineSpacing = margin
            flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin) // not required
        }

        func editMeme() {
            let editController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
            
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
            
//            cell.TopLabel.font = UIFont (name: "HelveticaNeue-Bold", size: 30)
//            cell.BottomLabel.font = UIFont (name: "HelveticaNeue-Bold", size: 30)
//            // Set the name and image
//            cell.TopLabel?.text = meme.topTextField
//            cell.BottomLabel?.text = meme.bottomTextField
            cell.ImageView?.image = meme.memedImage
           

            
            return cell
        }

        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {

            let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
            
            detailController.meme = self.allMemes[(indexPath as NSIndexPath).row]
            self.navigationController!.pushViewController(detailController, animated: true)

        }
        
        override func viewWillLayoutSubviews() {
            guard let collectionView = collectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
            let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * (cellsPerRow - 1)
            let itemWidth = (collectionView.bounds.size.width - marginsAndInsets) / cellsPerRow
            flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        }

    }

