//
//  PostJobVC.swift
//  Bartainment
//
//  Created by Zack Esm on 4/27/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import UIKit

class BarVC: UIViewController {
    
    let entertainmentTypes = ["Singer", "Live Band", "DJ", "Comedian"]
    var selectedJobType: String?
    
    @IBOutlet weak var entertainerTypeContainer: UIView!
    lazy var entertainerTypeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        
        cv.delegate = self
        cv.dataSource = self
        cv.register(EntertainerTypeCell.self, forCellWithReuseIdentifier: "EntertainerTypeCell")
        
        return cv
    }()
    
    @IBOutlet weak var budgetValue: UILabel!
    @IBOutlet weak var budgetSlider: UISlider!
    @IBAction func budgetSliderValueChange(_ sender: Any) {
        guard let slider = sender as? UISlider else { return }
        budgetValue.text = "$\(Int(slider.value))"
    }
    
    @IBOutlet weak var collectionViewContainer: UIView!
    lazy var dateCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        
        cv.delegate = self
        cv.dataSource = self
        cv.register(DateCell.self, forCellWithReuseIdentifier: "DateCell")
        
        return cv
    }()
    let dates = ["4/28", "4/29", "4/30", "5/1", "5/2", "5/3", "5/4"]
    var selectedDate: String?
    
    @IBOutlet weak var startTimePicker: UIPickerView!
    var selectedStartTime: String?
    @IBOutlet weak var endTimePicker: UIPickerView!
    var selectedEndTime: String?
    
    let startTimes = ["6PM", "7PM", "8PM", "9PM", "10PM", "11PM", "12AM"]
    let endTimes = ["8PM", "9PM", "10PM", "11PM", "12AM", "1AM", "2AM"]
    
    @IBAction func submitJob(_ sender: Any) {
        guard let jobType = selectedJobType,
        let date = selectedDate,
        let startTime = selectedStartTime,
        let endTime = selectedEndTime else { return }
        
        let time = "\(startTime)-\(endTime)"
        FirebaseService.service.postJob(jobType: jobType, budget: Int(budgetSlider.value), date: date, time: time)
        
        let alert = UIAlertController(title: nil, message: "Job Posted!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        addJobsButton()
    }
    
    fileprivate func addJobsButton() {
        let button = UIButton(type: .custom)
        button.setTitle("Proposals", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.addTarget(self, action: #selector(showJobs), for: .touchUpInside)
        let item = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func showJobs() {
        let vc = SwipeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func configureView() {
        view.addSubview(entertainerTypeCollectionView)
        NSLayoutConstraint.activate([
            entertainerTypeCollectionView.topAnchor.constraint(equalTo: entertainerTypeContainer.topAnchor, constant: 10),
            entertainerTypeCollectionView.leadingAnchor.constraint(equalTo: entertainerTypeContainer.leadingAnchor, constant: 10),
            entertainerTypeCollectionView.trailingAnchor.constraint(equalTo: entertainerTypeContainer.trailingAnchor, constant: -10),
            entertainerTypeCollectionView.bottomAnchor.constraint(equalTo: entertainerTypeContainer.bottomAnchor)
            ])
        
        view.addSubview(dateCollectionView)
        NSLayoutConstraint.activate([
            dateCollectionView.topAnchor.constraint(equalTo: collectionViewContainer.topAnchor),
            dateCollectionView.leadingAnchor.constraint(equalTo: collectionViewContainer.leadingAnchor, constant: 20),
            dateCollectionView.trailingAnchor.constraint(equalTo: collectionViewContainer.trailingAnchor),
            dateCollectionView.bottomAnchor.constraint(equalTo: collectionViewContainer.bottomAnchor)
            ])
        
        startTimePicker.delegate = self
        startTimePicker.dataSource = self
        
        endTimePicker.delegate = self
        endTimePicker.dataSource = self
        
        selectedStartTime = startTimes[0]
        selectedEndTime = endTimes[0]
    }

}

extension BarVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == startTimePicker {
            return startTimes.count
        } else if pickerView == endTimePicker {
            return endTimes.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == startTimePicker {
            return startTimes[row]
        } else if pickerView == endTimePicker {
            return endTimes[row]
        }
        
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == startTimePicker {
            selectedStartTime = startTimes[row]
        } else if pickerView == endTimePicker {
            selectedEndTime = endTimes[row]
        }
    }
    
}

extension BarVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == entertainerTypeCollectionView,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EntertainerTypeCell", for: indexPath) as? EntertainerTypeCell {
            cell.entertainerType = entertainmentTypes[indexPath.row]
            return cell
        } else if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell", for: indexPath) as? DateCell {
            cell.date = dates[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == entertainerTypeCollectionView {
            selectedJobType = entertainmentTypes[indexPath.row]
        } else {
            selectedDate = dates[indexPath.row]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == entertainerTypeCollectionView ? 4 : 7
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == entertainerTypeCollectionView {
            return CGSize(width: (collectionView.bounds.size.width * 0.95) / 2, height: (collectionView.bounds.size.height * 0.90) / 2)
        } else {
            return CGSize(width: collectionView.bounds.size.height * 0.9, height: collectionView.bounds.size.height)
        }
        
    }
    
}
