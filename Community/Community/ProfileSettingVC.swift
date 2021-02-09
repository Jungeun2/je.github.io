//
//  ProfileSettingVC.swift
//  Community
//
//  Created by 이정은 on 2020/10/14.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit
import MobileCoreServices

class ProfileSettingVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var txtIdProfile: UILabel!
    @IBOutlet var profileImage: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage : UIImage!
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType]
        as! NSString
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage]
            as? UIImage
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            profileImage.image = captureImage
        } else {
            return
        }
        self.dismiss(animated: true, completion: nil)
    
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSeleteImage(_ sender: Any) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            print("not found")
        }
    }
    
}
