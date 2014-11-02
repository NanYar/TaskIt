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
    var taskArray: [TaskModel] = []
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let date1 = Date.from(year: 2014, month: 01, day: 01)
        let date2 = Date.from(year: 2014, month: 8, day: 9)
        let date3 = Date.from(year: 2014, month: 10, day: 27)
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2)
        let task3 = TaskModel(task: "Gym", subTask: "Leg day", date: date3)
        
        taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg day", date: Date.from(year: 2014, month: 10, day: 27))] // task3 als alternative Eingabe
        
        // Refresh UITableViewDataSource (= die beiden tableView Funktionen ausfuehren)
        self.tableView.reloadData() // bezieht sich auf: @IBOutlet weak var tableView: UITableView!
    }
    
    override func viewDidAppear(animated: Bool) // aktualisiert die Ansicht
    {
        super.viewDidAppear(animated)
        
        self.tableView.reloadData()
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
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell // die Funktion wird taskArray.count mal aufgerufen
    {
        //println(indexPath.row) // indexPath.row zaehlt automatisch von 0 an aufwaerts
        let thisTask = taskArray[indexPath.row]
        
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
}
