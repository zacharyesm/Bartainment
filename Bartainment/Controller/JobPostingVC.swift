//
//  JobPostingVC.swift
//  Bartainment
//
//  Created by Zack Aroui on 4/28/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import Foundation
import UIKit

class JobPostingVC: UIViewController {
    
    @IBOutlet weak var barImage: UIImageView!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var barName: UILabel!
    @IBOutlet weak var jobTime: UILabel!
    @IBOutlet weak var jobType: UILabel!
    @IBOutlet weak var jobBudget: UILabel!
    @IBAction func passBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "Job discarded", message:
            "You archived this job.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func applyBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "Job Applied To", message:
            "You applied to this job.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    var jobPost: Job?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobTitle?.text = jobPost!.jobTitle
        barName?.text = " "+jobPost!.barName
        jobTime?.text = " "+jobPost!.date+" - "+jobPost!.time
        jobType?.text = " "+jobPost!.type
        jobBudget?.text = " $"+String(jobPost!.budget)
        barImage?.image = UIImage(named: (jobPost?.barImage)!)
        
    }
    
}
