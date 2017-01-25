//
//  MemeViewController
//  Meme2
//
//  Created by Cece Soudaly on 1/3/17.
//  Copyright © 2017 CeceMobile. All rights reserved.
//


import UIKit
import AVFoundation
import Social




class MemeViewController: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    
    @IBOutlet weak var imagePicker: UIImageView!
    
    @IBOutlet weak var topText: UITextField!
    
    @IBOutlet weak var bottomText: UITextField!
    
    @IBOutlet weak var takePictue: UIBarButtonItem!
    
    
    let picker = UIImagePickerController()
    
    var memedImage: UIImage! = nil
    var meme: Meme!
    var sentMeme: Meme?
  
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    let memeTextAttributes = [
        
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 30)!,
        NSStrokeWidthAttributeName: -3.0
        
        ] as [String : Any]
    
    func stylizeTextField(textField: UITextField) {
        if(textField == topText)
        {
            topText.text = "TOP"
        }
        else{
            bottomText.text = "BOTTOM"
        }
        textField.isHidden = true
        textField.defaultTextAttributes = memeTextAttributes
        textField.autocapitalizationType = .allCharacters
        textField.textAlignment = NSTextAlignment.center
        textField.delegate = self
        textField.becomeFirstResponder()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
         navigationItem.rightBarButtonItem =   UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(Cancel))
        
        picker.delegate = self
        stylizeTextField(textField: topText)
        stylizeTextField(textField: bottomText)
        
        //Check for camera option
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            takePictue.isEnabled = false;
        }
        
        if !(sentMeme == nil) {
            setSentMeme(sentMeme: sentMeme!)
        }
  
        toolBar.isHidden = false
    }
    
    func setSentMeme(sentMeme: Meme) {
        
        imagePicker?.image = sentMeme.originalImage
        topText?.text = sentMeme.topTextField
        bottomText?.text = sentMeme.bottomTextField
        topText.isHidden = false
        bottomText.isHidden = false
        
    }
    
    func Cancel() {
        self.navigationController?.popViewController(animated: true)
    }
    

    
    func modifiedImage()
    {
        picker.delegate = self
        picker.allowsEditing = false
        topText.isHidden = false
        bottomText.isHidden = false
        
    }
    
    //camera option
    @IBAction func takePhoto(_ sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            modifiedImage()
            picker.sourceType = UIImagePickerControllerSourceType.camera;
            self.present(picker, animated: true, completion: nil)
            
        }else
        {
            
            let alertController = UIAlertController(title: title, message: "camera not available",preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func pickAnImage(_ sender: AnyObject) {
        modifiedImage()
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
        picker.popoverPresentationController?.barButtonItem = (sender as! UIBarButtonItem)
        
    }
    
    @IBAction func sharePhoto(_ sender: Any) {
        // memed image to activity view
        self.memedImage = generateMemedImage()
        let activityVC = UIActivityViewController(activityItems: [self.memedImage!],
                                                  applicationActivities: nil)
        
        // Save image to shared
        activityVC.completionWithItemsHandler = {
            activity, completed, items, error in
            if completed {
                self.saveMeme()
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    func saveMeme() {
       let meme = Meme(topTextField: topText.text!, bottomTextField: bottomText.text!, originalImage: imagePicker.image!, memedImage:  self.memedImage)
        // Add it to the memes array in the Application Delegate
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func generateMemedImage() -> UIImage {
        
        //hide the tool bar
        toolBar.isHidden = true
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        //resumed the tool bar
        toolBar.isHidden = false
        
        return memedImage
    }
    
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingImage image:UIImage!,editingInfo:[NSObject:AnyObject]!)
    {
        imagePicker.image = image
        self.dismiss(animated: true, completion: nil)
        
    }
    // Subscribe
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        topText.resignFirstResponder()
        bottomText.resignFirstResponder()
    }
    
    //Unsubscribe
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    /// This is for editing text
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if(textField == bottomText)
        {
            bottomText.text = ""
            subscribeToKeyboardNotifications()
        }else{
            topText.text = ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if(textField == bottomText){
            unsubscribeFromKeyboardNotifications()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        topText.resignFirstResponder();
        bottomText.resignFirstResponder();
        return true;
    }
    
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(MemeViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MemeViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    func keyboardWillShow(_ notification:Notification) {
        
        if bottomText.isFirstResponder{
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    func keyboardWillHide(_ notification:Notification) {
        
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    
    
}


