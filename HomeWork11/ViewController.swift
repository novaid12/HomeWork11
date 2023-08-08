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

    @IBOutlet private var dpTime: UIDatePicker!
    @IBOutlet private var setTimeBtn: UIButton!
    @IBOutlet private var textTimeLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func volumeLevelFunc(_ sender: UISlider) {
        progressView.progress = sender.value
        valueVL.text = String(round(sender.value * 10) / 10)
    }

    @IBAction func chengedVL(_ sender: UITextField) {
        guard let vlValue = sender.text else { return }
        progressView.progress = Float(vlValue) ?? 0.5
        changedVolumeLevel.value = Float(round(Float(progressView.progress) * 10) / 10)
    }

    @IBAction func setTimeFunc(_ sender: UIButton) {
        let getDate = dpTime.date
        let calendar = Calendar.current
        let date = calendar.dateComponents([.hour, .minute], from: getDate)

        guard let hour = date.hour,
              let minute = date.minute else { return }
        textTimeLbl.text = String(hour) + ":" + String(minute)
    }
}
