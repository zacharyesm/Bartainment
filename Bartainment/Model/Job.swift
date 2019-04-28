//
//  Job.swift
//  Bartainment
//
//  Created by Zack Esm on 4/27/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import Foundation

class Job {
    let key: String
    let type: String
    let budget: Int
    let date: String
    let jobTitle: String
    let barName: String
    let time: String
    
    init(key: String, type: String, budget: Int, date: String, jobTitle: String, barName: String , time: String) {
        self.key = key
        self.type = type
        self.budget = budget
        self.date = date
        self.jobTitle = jobTitle
        self.barName = barName
        self.time = time
    }
}
