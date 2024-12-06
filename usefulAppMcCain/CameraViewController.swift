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
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let savedImage = loadImage(fileName: "image.png") {
            imageViewOutlet.image = savedImage
            
        }
        
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

//Make filenames dependant on the current car index
        AppData.imageURL = saveImage(image: imageViewOutlet.image!, fileName: "image.png")
        
    }
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        imageViewOutlet.image = nil
    }
    
    func loadImage(fileName: String) -> UIImage? {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = directory.appendingPathComponent(fileName)
        
        if let data = try? Data(contentsOf: fileURL) {
            return UIImage(data: data)
        }
        return nil
    }
    
    func saveImage(image: UIImage, fileName: String) -> URL? {
        guard let data = image.jpegData(compressionQuality: 1.0) else { return nil }
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileURL = documents?.appendingPathComponent(fileName)
        do {
            try data.write(to: fileURL!)
            return fileURL
        } catch {
            print("Error saving image: \(error)")
            return nil
        }
    }
    
}
