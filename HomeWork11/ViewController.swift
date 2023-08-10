//
//  ViewController.swift
//  HomeWork11
//
//  Created by  NovA on 8.08.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var progressView: UIProgressView!
    @IBOutlet private var changedVolumeLevel: UISlider!
    @IBOutlet private var valueVL: UITextField!

    @IBOutlet private var alarmActivate: UISwitch!
    @IBOutlet private var dpTime: UIDatePicker!
    @IBOutlet private var setTimeBtn: UIButton!
    @IBOutlet private var textTimeLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        textTimeLbl.text = ""
        textTimeLbl.backgroundColor = .red
        alarmActivate.isOn = false
    }

    @IBAction func volumeLevelFunc(_ sender: UISlider) {
        progressView.progress = sender.value
        valueVL.text = String(format: "%.1f", sender.value)
    }

    @IBAction func changedValue(_ sender: UITextField) {
        guard let vlValue = sender.text else { return }
        let volume = Float(vlValue) ?? 0
        if volume != 0, volume <= 1, volume >= 0 {
            progressView.progress = volume
            changedVolumeLevel.value = volume
            valueVL.backgroundColor = .systemTeal
        } else { valueVL.backgroundColor = .orange }
    }

    @IBAction func setTimeFunc(_ sender: UIButton) {
        let getDate = dpTime.date
        let calendar = Calendar.current
        let date = calendar.dateComponents([.hour, .minute], from: getDate)
        guard let hour = date.hour,
              let minute = date.minute else { return }
        let hourS = hour < 10 ? "0" + String(hour) : String(hour)
        let minuteS = minute < 10 ? "0" + String(minute) : String(minute)
        textTimeLbl.text = hourS + ":" + minuteS
        alarmActivate.isOn = true
        textTimeLbl.backgroundColor = .green
    }

    @IBAction func alarmOnOff(_ sender: UISwitch) {
        if !alarmActivate.isOn {
            textTimeLbl.backgroundColor = .red
            alarmActivate.isOn = false
        } else {
            textTimeLbl.backgroundColor = .green
        }
    }

    @IBAction func clearAlarm(_ sender: UIButton) {
        textTimeLbl.text = ""
    }
}
