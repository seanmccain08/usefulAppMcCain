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
        
        if let savedImage = loadImages(prefix: "image", count: 1) {
            
            imageViewOutlet.image = savedImage[AppData.currentCar.imageIndex]
            
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
        AppData.images.append(info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        
    }
    @IBAction func imageSelectorAction(_ sender: UIButton) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func saveButtonAction(_ sender: UIButton) {

//Make filenames dependant on the current car index
        print(saveImages(images: AppData.images, prefix: "image"))
        
    }
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        imageViewOutlet.image = nil
    }
    
    func loadImages(prefix: String, count: Int) -> [UIImage]? {
        var images: [UIImage] = []
        
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        for index in 0..<count {
            let fileName = "\(prefix)_\(index).png"
            let fileURL = directory.appendingPathComponent(fileName)
            
            if FileManager.default.fileExists(atPath: fileURL.path) {
                do {
                    let data = try Data(contentsOf: fileURL)
                    if let image = UIImage(data: data) {
                        images.append(image)
                        print("Loaded image \(index) from \(fileURL)")
                    }
                } catch {
                    print("Error loading image \(index): \(error)")
                }
            } else {
                print("File \(fileName) does not exist")
            }
        }
        return images.isEmpty ? nil : images
    }
    
    func saveImages(images: [UIImage], prefix: String) -> [URL]? {
        var savedURLs: [URL] = []
        
        for (index, image) in images.enumerated() {
            let fileName = "\(prefix)_\(index).png" // Unique filename
            guard let data = image.pngData() else {
                print("Failed to convert image \(index) to PNG data")
                continue
            }
            
            let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = directory.appendingPathComponent(fileName)
            
            do {
                if FileManager.default.fileExists(atPath: fileURL.path) {
                    try FileManager.default.removeItem(at: fileURL)
                }
                try data.write(to: fileURL)
                savedURLs.append(fileURL)
                print("Image \(index) saved at \(fileURL)")
            } catch {
                print("Error saving image \(index): \(error)")
            }
        }
        AppData.imageCount+=1
        UserDefaults.standard.set(AppData.imageCount, forKey: "imageCount")
        return savedURLs.isEmpty ? nil : savedURLs
    }
    
}
