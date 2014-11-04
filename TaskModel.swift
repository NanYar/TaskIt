//
//  TaskModel.swift
//  TaskIt
//
//  Created by NanYar on 04.11.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel) // = Objective-C Bridge

class TaskModel: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var completed: NSNumber
    @NSManaged var subtask: String
    @NSManaged var task: String

}
