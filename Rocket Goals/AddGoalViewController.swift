//
//  AddGoalViewController.swift
//  Goals
//
//  Created by Dominic Alvaro on 19/08/2017.
//  Copyright © 2017 Dominic Alvaro. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var termTextField: UITextField!
    @IBOutlet weak var addGoalButton: UIButton!
    @IBOutlet weak var addDescrTextField: UITextView!
    @IBOutlet weak var pickerViewCat: UIPickerView!
    

    let catagory = ["Fitness","Academic","Personal","Work","Travel"]
    


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
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //This is an object that access a property called persistant container in app delegate.swift
        let pickerViewGoal = Task(context: context)
        pickerViewGoal.catagory = catagory[row]
        
        
    }
    
    
    @IBAction func addGoal(_ sender: Any) {
        
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //This is an object that access a property called persistant container in app delegate.swift
        
        let goal = Task(context: context)
        goal.name = goalTextField.text!
        goal.term = termTextField.text!
        goal.descr = addDescrTextField.text!
        
        
        //Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addGoalButton.layer.cornerRadius = 5
        
    }
    
    
    
}
