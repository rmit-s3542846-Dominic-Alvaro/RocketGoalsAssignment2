//
//  DetailViewController.swift
//  Goals
//
//  Created by Dominic Alvaro on 23/08/2017.
//  Copyright © 2017 Dominic Alvaro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var descrText: UITextView!
    @IBOutlet weak var catagoryText: UILabel!
    
    var myGoal: String?
    var myTerm: String?
    var myDescr: String?
    
    var myCatagory: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalLabel.text = myGoal
        termLabel.text = myTerm
        descrText.text = myDescr
        //catagoryText.text = myCatagory
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
