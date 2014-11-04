//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by NanYar on 01.11.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController
{
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!    
    
    var detailTaskModel: TaskModel!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //println(self.detailTaskModel.task + " / " + self.detailTaskModel.subTask)
        self.taskTextField.text = self.detailTaskModel.task
        self.subtaskTextField.text = self.detailTaskModel.subtask
        self.dueDatePicker.date = self.detailTaskModel.date
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneBarButtonItemPressed(sender: UIBarButtonItem)
    {
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        detailTaskModel.task = taskTextField.text
        detailTaskModel.subtask = subtaskTextField.text
        detailTaskModel.date = dueDatePicker.date
        detailTaskModel.completed = detailTaskModel.completed
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
