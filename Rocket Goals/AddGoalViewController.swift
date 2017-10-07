//
//  AddGoalViewController.swift
//  Goals
//
//  Created by Dominic Alvaro on 19/08/2017.
//  Copyright © 2017 Dominic Alvaro. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var termTextField: UITextField!
    @IBOutlet weak var addGoalButton: UIButton!
    @IBOutlet weak var addDescrTextField: UITextView!
    @IBOutlet weak var pickerViewCat: UIPickerView!
   
    @IBOutlet var addPicView: UIView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    
    var effect:UIVisualEffect!
    var getImage:UIImage!
    
    var catagory = ["Fitness","Academic","Personal","Work","Travel"]
    var cataPicker: String?
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catagory[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catagory.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //This is where I will save what the user picks, so similiar to when a user writes something and I save it to core data. I will do the same here x
        cataPicker = catagory[row]
    }
    
    
    @IBAction func addGoal(_ sender: Any) {
        
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //This is an object that access a property called persistant container in app delegate.swift
        
        let goal = Task(context: context)
        goal.name = goalTextField.text!
        goal.term = termTextField.text!
        goal.descr = addDescrTextField.text!
        goal.catagory = cataPicker!
        
        //Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addGoalButton.layer.cornerRadius = 5
        
        effect = visualView.effect
        visualView.effect = nil
        
        addPicView.layer.cornerRadius = 5
        
        myImageView.image = getImage
    }
    
    func animateIn()
    {
        self.view.addSubview(addPicView)
        addPicView.center = self.view.center
        addPicView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addPicView.alpha = 0
        
        UIView.animate(withDuration: 0.4)
        {
            self.visualView.effect = self.effect
            self.addPicView.alpha = 1
            self.addPicView.transform = CGAffineTransform.identity
        }
        
    }
    func animateOut()
    {
        UIView.animate(withDuration: 0.3, animations:
            {
                self.addPicView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                self.addPicView.alpha = 0
                self.visualView.effect = nil
        }) { (success:Bool) in
            self.addPicView.removeFromSuperview()
        }
    }

    @IBAction func addPic(_ sender: Any)
    {
        animateIn()
    }
    @IBAction func donePic(_ sender: Any)
    {
        animateOut()
    }
    
    @IBOutlet weak var myImageView: UIImageView! 
   
    @IBAction func imageImport(_ sender: AnyObject)
    {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction) in
           
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
            else
            {
                print("Camera is not available")
            }
            
        }))
            
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
//    @IBAction func takePhoto(_ sender: UIButton)
//    {
//        let image = UIImagePickerController()
//        image.delegate = self
//        image.sourceType = UIImagePickerControllerSourceType.camera
//        
//        self.present(image, animated: true)
//    }

    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            myImageView.image = image
        }
        else
        {
            print("the photo could not be displayed")
        }
        picker.dismiss(animated: true, completion: nil)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
//    @IBAction func addPic(_ sender: Any)
//    {
//        let actVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
//        actVC.popoverPresentationController?.sourceView = self.view
//        
//        self.present(actVC, animated: true, completion: nil)
//    }
    
    
}
