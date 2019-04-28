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
//    @IBOutlet weak var profilePicture: UIImageView!
//    @IBOutlet weak var profileName: UILabel!
//    @IBOutlet weak var tweetLabel: UILabel!
//    @IBOutlet weak var tweetTitle: UILabel!
    @IBOutlet weak var barImage: UIImageView!
    @IBOutlet weak var gigPostTitle: UILabel!
    @IBOutlet weak var barName: UILabel!
    @IBOutlet weak var gigDesc: UILabel!
}

class GigsTableVC: UITableViewController {
    var gigPostsList: [String] = []

//    var teamSocialList: [TeamSocial] = []
//    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tbvc = self.tabBarController  as! TeamInfoTBC
//        team = tbvc.team
//
//        let ruwt = RuwtRestClient()
//        ruwt.getTeamSocial(completion: {tms in
//            self.teamSocialList = tms!
//            self.tableView.reloadData()
//            print(tms![5].name)
//        }, teamId: String(team!.teamID))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gigPostsList.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
//        switch(segue.identifier ?? "") {
//        case "ShowSocialWeb":
//            print("inside ShowSocialWebSegue")
//            let webViewVC : WebViewVC = segue.destination as! WebViewVC;
//
//            guard let selectedSocialCell = sender as? TeamSocialTableViewCell else {
//                fatalError("Unexpected sender: \(sender)")
//            }
//
//            guard let indexPath = tableView.indexPath(for: selectedSocialCell) else {
//                fatalError("The selected cell is not being displayed by the table")
//            }
//
//            let selectedSocial = teamSocialList[indexPath.row]
//            webViewVC.sourceVc = WebViewSource.social
//            webViewVC.teamSocial = selectedSocial
//
//        default:
//            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
//        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GigPostCell", for: indexPath) as! GigsTableViewCell
        
//        let socialTweet = teamSocialList[indexPath.row]
//        cell.profileName?.text = socialTweet.name
//        cell.tweetLabel?.text = " "+socialTweet.label
//        cell.tweetTitle?.text = socialTweet.title
//
//        cell.profilePicture?.sd_setImage(with: URL(string: socialTweet.assetURLs.profileImage), placeholderImage: UIImage(named: "7073"))
        
        return cell
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
