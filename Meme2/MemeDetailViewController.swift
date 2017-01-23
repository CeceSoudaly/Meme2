//
//  MemeDetailView.swift
//  Meme2
//
//  Created by Cece Soudaly on 1/19/17.
//  Copyright © 2017 CeceMobile. All rights reserved.
//

import UIKit

// MARK: - MemeDetailViewController: UIViewController

class MemeDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var meme: Meme!
    
    @IBOutlet weak var imageView: UIImageView!
    // MARK: Outlets
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var bottomText: UILabel!
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        self.topText.text = self.meme.topTextField
      
        self.bottomText.text = self.meme.bottomTextField
        
        self.imageView!.image = meme.memedImage
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        navigationItem.rightBarButtonItem =   UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editMeme))
        
         navigationItem.leftBarButtonItem =   UIBarButtonItem(title: "SentMemes", style: .plain, target: self, action: #selector(SentMemes))
      
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    func SentMemes() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func editMeme() {
        let editController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
 
        
        editController.sentMeme = self.meme
        
        self.navigationController!.pushViewController(editController, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }

}
