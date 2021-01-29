//
//  ViewController.swift
//  DayOfYear
//
//  Created by Алим Куприянов on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var hereLabel: UILabel!
    @IBOutlet weak var dateButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  hideKeyboardWhenTappedAround()
        
        dateButton.layer.cornerRadius = 7
        dateButton.clipsToBounds = true
    }
    
    
    
    @IBAction func DateButton(_ sender: UIButton) {
        
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int (month)
        dateComponents.year = Int (year)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale.init(identifier: "ru_RU")
        
        guard   let date = calendar.date(from: dateComponents) else { return }
        
        let weekDay = dateFormatter.string(from:date)
        let capitalizedWeekDay = weekDay.capitalized
        
        
        
        hereLabel.text = capitalizedWeekDay
        
        
        
        
        
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
}

//
//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tapGesture = UITapGestureRecognizer(target: self,
//                         action: #selector(hideKeyboard))
//        view.addGestureRecognizer(tapGesture)
//    }
//
//    @objc func hideKeyboard() {
//        view.endEditing(true)
//    }
//}
