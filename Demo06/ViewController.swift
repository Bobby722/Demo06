//
//  ViewController.swift
//  Demo06
//
//  Created by 林嫈沛 on 2019/3/16.
//  Copyright © 2019 lohaslab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var dateslider: UISlider!
    @IBOutlet weak var changeimg: UIImageView!
    let dateFormatter = DateFormatter()
    var dateString:String = ""
    var timer:Timer?
    var num=0
    var num1=0
    let img=["20180529","20180610","20180706","20180820","20180912","20181010","20181117","20181210","20190126","20190205"]
    override func viewDidLoad() {
        super.viewDidLoad()
        time()
        datepicker.locale=Locale(identifier: "zh_TW")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateslider.isContinuous=false
        datepicker.isEnabled=false
    }
    func ticker(){
        if num>=img.count{
            num=0
            switchtime(num2: num)
            changeimg.image=UIImage(named: img[num])
        }else{
            switchtime(num2: num)
            changeimg.image=UIImage(named: img[num])
        }
        num+=1
    }
    @IBAction func change(_ sender: UISwitch) {
        if sender.isOn {
            time()
            num=num1
            dateslider.isEnabled=false
        }else{
            dateslider.isEnabled=true
            timer?.invalidate()
        }
    }
    
    @IBAction func dateSlider(_ sender: UISlider) {
        sender.value.round()
        num1=Int(sender.value)
        changeimg.image=UIImage(named: img[num1])
        print(num1)
        switchtime(num2: num1)
    }
    func time(){
        timer=Timer.scheduledTimer(withTimeInterval: 2, repeats: true){(timer) in self.ticker()}
    }
    func switchtime(num2:Int) {
        switch num2 {
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
        datepicker.date=date!
    }
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }

}

