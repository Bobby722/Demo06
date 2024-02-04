//
//  ViewController.swift
//  Demo06
//
//  Created by 林嫈沛 on 2019/3/16.
//  Copyright © 2019 lohaslab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateSlider: UISlider!
    @IBOutlet weak var changeImg: UIImageView!
    
    let dateFormatter = DateFormatter()
    var dateString: String = ""
    var timer: Timer?
    var index = 0
    var selectedIndex = 0
    let img = ["20180529","20180610","20180706","20180820","20180912","20181010","20181117","20181210","20190126","20190205"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time()
        datePicker.locale = Locale(identifier: "zh_TW")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateSlider.isContinuous = false
        datePicker.isEnabled = false
        datePicker.contentHorizontalAlignment = .center
    }
    
    func ticker() {
        if index >= img.count{
            index = 0
            switchtime(index)
            changeImg.image = UIImage(named: img[index])
        }else{
            switchtime(index)
            changeImg.image = UIImage(named: img[index])
        }
        index += 1
    }
    
    @IBAction func change(_ sender: UISwitch) {
        if sender.isOn {
            time()
            index = selectedIndex
            dateSlider.isEnabled=false
        } else {
            dateSlider.isEnabled=true
            timer?.invalidate()
        }
    }
    
    @IBAction func dateSlider(_ sender: UISlider) {
        sender.value.round()
        selectedIndex = Int(sender.value)
        changeImg.image = UIImage(named: img[selectedIndex])
        print(selectedIndex)
        switchtime(selectedIndex)
    }
    
    func time(){
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true){(timer) in self.ticker()}
    }
    
    func switchtime(_ index:Int) {
        switch index {
        case 0:
            dateString = "2018/05/29"
        case 1:
            dateString = "2018/06/10"
        case 2:
            dateString = "2018/07/06"
        case 3:
            dateString = "2018/08/20"
        case 4:
            dateString = "2018/09/12"
        case 5:
            dateString = "2018/10/10"
        case 6:
            dateString = "2018/11/17"
        case 7:
            dateString = "2018/12/10"
        case 8:
            dateString = "2019/01/26"
        case 9:
            dateString = "2019/02/05"
        default:
            dateString = "2019/03/10"
        }
        let date = dateFormatter.date(from: dateString)
        datePicker.date = date!
        dateSlider.value = Float(index)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }

}

