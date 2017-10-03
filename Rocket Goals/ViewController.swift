//
//  ViewController.swift
//  Goals
//
//  Created by Dominic Alvaro on 19/08/2017.
//  Copyright © 2017 Dominic Alvaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []

    var myGoalPass: String?
    var myTermPass: String?
    var myDescrPass: String?
    
    var myCatagoryPass: String?
    var myString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain , target: nil, action: nil)
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from core data
        getData()
        
        
        //reload the table view
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tasks.count
    }
        
        
    // Code here is for loading in the data from the add goal screen into the goal cellsis
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       
        let cell = UITableViewCell()
            
        let task = tasks[indexPath.row]
        
        myGoalPass = task.name!
        myTermPass = task.term!
        myDescrPass = task.descr!
        myCatagoryPass = task.catagory!
        
        cell.textLabel?.text = task.name!
        
        
            
        return cell
            
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "showDetail", sender: tasks[indexPath.row])
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let task = tasks[indexPath.row]
                let destination = segue.destination as! DetailViewController
                destination.myGoal = task.name!
                destination.myTerm = task.term!
                destination.myDescr = task.descr!
                destination.myCatagory = task.catagory!
            }
            
            
            
                
            

        }
        
        
    }
    
    
    
    
    // Code below is for deleting a cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        tableView.reloadData()
    }
    

}

