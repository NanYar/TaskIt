//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by NanYar on 02.11.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController
{
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
        

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func cancelButtonTapped(sender: UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(sender: UIButton)
    {
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate) // = Zugriff auf AppDelegate.swift
        let managedObjectContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!) // = Problem mit Autocomplete (Xcode Bug?)
        task.task = taskTextField.text
        task.subtask = subtaskTextField.text
        task.date = dueDatePicker.date
        task.completed = false
        
        appDelegate.saveContext()
        
        var request = NSFetchRequest(entityName: "TaskModel")
        var error: NSError? = nil
        var results: NSArray = managedObjectContext!.executeFetchRequest(request, error: &error)!
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
