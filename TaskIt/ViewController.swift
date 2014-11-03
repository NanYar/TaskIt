//
//  ViewController.swift
//  TaskIt
//
//  Created by NanYar on 01.11.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    //var taskArray: [TaskModel] = []
    var baseArray: [[TaskModel]] = [] // = Array of TaskModel arrays
    

    override func viewDidLoad()
    {
        super.viewDidLoad()        
    }
    
    override func viewDidAppear(animated: Bool) // aktualisiert die Ansicht
    {
        super.viewDidAppear(animated)
        
//        func sortByDate (taskOne: TaskModel, taskTwo: TaskModel) -> Bool
//        {
//            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//        }
//        taskArray = taskArray.sorted(sortByDate)
        
        // Als Closure:
        baseArray[0] = baseArray[0].sorted // = taskArray
        {
            (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        baseArray[1] = baseArray[1].sorted // = completedTaskArray
        {
                (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
                return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }

        // Refresh UITableViewDataSource (= die beiden tableView Funktionen ausfuehren)
        self.tableView.reloadData() // bezieht sich auf: @IBOutlet weak var tableView: UITableView!
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) // func prepareForSegue is called before a segue occurs
    {
        if segue.identifier == "showTaskDetail"
        {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
        }
        else if segue.identifier == "showTaskAdd"
        {
            let addTaskVC: AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
        }
    
    }
    
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    

    // UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return baseArray.count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return baseArray[section].count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell // die Funktion wird taskArray.count mal aufgerufen
    {
        //println(indexPath.row) // indexPath.row zaehlt automatisch von 0 an aufwaerts
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell // bezieht sich auf: func tableView(tableView: UITableView...
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        return cell
    }
    
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println(indexPath.row)
        self.performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "To do"
        }
        else
        {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        if indexPath.section == 0
        {
            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, isCompleted: true)
            baseArray[1].append(newTask)
        }
        else
        {
            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, isCompleted: false)
            baseArray[0].append(newTask)
        }
        
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        tableView.reloadData()
    }
    
    
    // Helper Functions
}


















