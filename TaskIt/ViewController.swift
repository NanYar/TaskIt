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
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: "01/14/2014")
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: "01/14/2014")
        let task3 = TaskModel(task: "Gym", subTask: "Leg day", date: "01/14/2014")
        
        taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg day", date: "01/14/2014")] // task3 als alternative Eingabe
        
        // Refresh UITableViewDataSource (= die beiden tableView Funktionen ausfuehren)
        self.tableView.reloadData() // bezieht sich auf: @IBOutlet weak var tableView: UITableView!
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
    
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
        cell.dateLabel.text = thisTask.date
        return cell
    }
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println(indexPath.row)
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
}
