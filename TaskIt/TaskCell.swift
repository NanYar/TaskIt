//
//  TaskCell.swift
//  TaskIt
//
//  Created by NanYar on 01.11.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell
{
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
        

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

}
