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
        
        self.imageView!.image = meme.originalImage
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
