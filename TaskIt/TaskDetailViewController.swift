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
    var mainVC: ViewController!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //println(self.detailTaskModel.task + " / " + self.detailTaskModel.subTask)
        self.taskTextField.text = self.detailTaskModel.task
        self.subtaskTextField.text = self.detailTaskModel.subTask
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
        var task = TaskModel(task: taskTextField.text, subTask: subtaskTextField.text, date: dueDatePicker.date, isCompleted: false)
        mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
