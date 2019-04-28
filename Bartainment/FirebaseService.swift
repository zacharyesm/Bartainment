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
    
    func postJob(jobType: String, budget: Int, date: String, time: String, jobTitle: String) {
        let postDict: [String: Any] = [
            "jobType": jobType,
            "budget": budget,
            "date": date,
            "jobTitle": jobTitle,
            "barName": "Hair of the Dog",
            "time": time
        ]
        
        jobs.childByAutoId().updateChildValues(postDict)
    }
    
    func getJobs(completion: @escaping ([Job]) -> Void) {
        jobs.observeSingleEvent(of: .value) { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                if snapshots.isEmpty { //no news feed
                    completion([])
                    return
                }
                
                var jobs = [Job]()
                for snap in snapshots {
                    guard let dict = snap.value as? [String: Any] else { continue }
                    
                    let jobKey = snap.key
                    guard let type = dict["jobType"] as? String,
                        let budget = dict["budget"] as? Int,
                        let date = dict["date"] as? String,
                        let jobTitle = dict["jobTitle"] as? String,
                        let barName = dict["barName"] as? String,
                        let time = dict["time"] as? String else { continue }
                    
                    let job = Job(key: jobKey, type: type, budget: budget, date: date, jobTitle: jobTitle, barName: barName,  time: time)
                    jobs.append(job)
                }
                
                completion(jobs)
            }
        }
    }
    
}
