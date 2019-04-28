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
    
    @IBOutlet weak var startTimePicker: UIPickerView!
    @IBOutlet weak var endTimePicker: UIPickerView!
    
    let startTimes = ["6 PM", "7 PM", "8 PM", "9 PM", "10 PM", "11 PM", "12 AM"]
    let endTimes = ["8 PM", "9 PM", "10 PM", "11 PM", "12 AM", "1 AM", "2 AM"]
    
    @IBAction func submitJob(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
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
    
}

extension BarVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == entertainerTypeCollectionView,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EntertainerTypeCell", for: indexPath) as? EntertainerTypeCell {
            cell.entertainerType = entertainmentTypes[indexPath.row]
            return cell
        } else if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell", for: indexPath) as? DateCell {
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("SELECTED")
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
