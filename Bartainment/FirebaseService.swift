//
//  FirebaseService.swift
//  Bartainment
//
//  Created by Zack Esm on 4/27/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseService {
    static let service = FirebaseService()
    
    let jobs = Database.database().reference().child("jobs")
    
    func postJob(jobType: String, budget: Int, date: String, time: String) {
        let postDict: [String: Any] = [
            "jobType": jobType,
            "budget": budget,
            "date": date,
            "time": time
        ]
        
        jobs.childByAutoId().updateChildValues(postDict)
    }
    
}
