//
//  ViewController.swift
//  UITextFieldIssueDemo
//
//  Created by Marcin Iwanicki on 10/01/2018.
//  Copyright © 2018 Marcin Iwanicki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!
    @IBOutlet private weak var onOffTimerButton: UIButton!

    private var timer: Timer?
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .long
        return dateFormatter
    }()

    deinit {
        self.timer?.invalidate()
    }

    @IBAction
    func onOffTimer(_sender: UIButton) {
        if let timer = self.timer {
            timer.invalidate()
            self.timer = nil
            self.setSecondButtonTitle("Start updating 2nd UITextField")
        } else {
            self.setSecondButtonTitle("Stop updating 2nd UITextField")
            self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { [unowned self] _ in
                self.secondTextField.text = self.dateFormatter.string(from: Date())
            })
        }
    }

    private func setSecondButtonTitle(_ title: String) {
        self.onOffTimerButton.setTitle(title, for: .normal)
    }
}
