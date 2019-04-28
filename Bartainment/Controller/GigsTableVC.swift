//
//  GigsTableVC.swift
//  Bartainment
//
//  Created by Zack Aroui on 4/27/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class GigsTableViewCell: UITableViewCell {
    @IBOutlet weak var barImage: UIImageView!
    @IBOutlet weak var gigPostTitle: UILabel!
    @IBOutlet weak var barName: UILabel!
    @IBOutlet weak var gigDesc: UILabel!
    @IBOutlet weak var jobTime: UILabel!
    @IBOutlet weak var jobType: UILabel!
}

class GigsTableVC: UITableViewController {
    var gigPostsList: [Job] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let fbs = FirebaseService()
        fbs.getJobs(completion: {jobs in
            self.gigPostsList = jobs
            self.tableView.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gigPostsList.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "ShowJobPost":
            let jobPostingVC : JobPostingVC = segue.destination as! JobPostingVC;

            guard let selectedJobCell = sender as? GigsTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }

            guard let indexPath = tableView.indexPath(for: selectedJobCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }

            let selectedJob = gigPostsList[indexPath.row]
            jobPostingVC.jobPost = selectedJob

        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GigPostCell", for: indexPath) as! GigsTableViewCell
        
        let gigPost = gigPostsList[indexPath.row]
        cell.gigPostTitle?.text = gigPost.jobTitle
        cell.barName?.text = " "+gigPost.barName
        cell.jobTime?.text = " "+gigPost.date+" - "+gigPost.time
        cell.jobType?.text = " "+gigPost.type
        cell.gigDesc?.text = " $"+String(gigPost.budget)
        cell.barImage?.image = UIImage(named: gigPost.barImage)

//        cell.profilePicture?.sd_setImage(with: URL(string: socialTweet.assetURLs.profileImage), placeholderImage: UIImage(named: "7073"))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
