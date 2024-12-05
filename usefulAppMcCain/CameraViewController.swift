//
//  CameraViewController.swift
//  usefulAppMcCain
//
//  Created by MICHAEL GRUPER on 12/4/24.
//

import UIKit

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var takePictureButton: UIButton!
    @IBOutlet weak var photoLibraryButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cameraButtonAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
        }
        else{
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        self.imageViewOutlet.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
    }
    @IBAction func imageSelectorAction(_ sender: UIButton) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func saveButtonAction(_ sender: UIButton) {
        Car.imageIVC = imageViewOutlet.image ?? UIImage()
    }
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        imageViewOutlet.image = nil
    }
}
