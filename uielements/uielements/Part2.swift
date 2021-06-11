//
//  Part2.swift
//  uielements
//
//  Created by RG on 6/8/21.
//

import UIKit

class Part2: UIViewController {
    
    // Activity Indicator View
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Toggle Activity", for: .normal)
        button.addTarget(self, action: #selector(handleActivity), for: .touchUpInside)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func handleActivity() {
        DispatchQueue.main.async {
            self.myActivityIndicatorView.isHidden = !self.myActivityIndicatorView.isHidden
            self.myActivityIndicatorView.isHidden ? self.myActivityIndicatorView.stopAnimating() : self.myActivityIndicatorView.startAnimating()
        }
    }
    
    private let myActivityIndicatorView:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.style = .large
        activity.color = .blue
        return activity
    }()
    
    // Image View
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "wwdc21")
        return imageView
    }()
    
    // Progress View
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.0, animated: true)
        return progressView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0) {
            self.myProgressView.setProgress(1.0, animated: true)
        }
    }
    
    // Picker View
    private let myPickerView = UIPickerView()
    private let pickerData = ["One", "Two", "Three"]
    
    // Part 3
    private let part3Button:UIButton = {
        let button = UIButton()
        button.setTitle("Part 3", for: .normal)
        button.addTarget(self, action: #selector(goToPart3), for: .touchUpInside)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc private func goToPart3() {
        let vc = Part3()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.setNavigationBarHidden(true, animated: false)
        present(nav, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Part 2"
        view.backgroundColor = .white
        
        view.addSubview(myButton)
        view.addSubview(myActivityIndicatorView)
        view.addSubview(myImageView)
        view.addSubview(myProgressView)
        view.addSubview(myPickerView)
        
        myPickerView.dataSource = self
        myPickerView.delegate = self
        
        view.addSubview(part3Button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myButton.frame = CGRect(x: 20, y: 80, width: view.width - 40, height: 40)
        myActivityIndicatorView.frame = CGRect(x: 20, y: myButton.bottom + 20, width: view.width - 40, height: 40)
        myImageView.frame = CGRect(x: 20, y: myActivityIndicatorView.bottom + 20, width: view.width - 40, height: 80)
        myProgressView.frame = CGRect(x: 20, y: myImageView.bottom + 20, width: view.width - 40, height: 40)
        myPickerView.frame = CGRect(x: 20, y: myProgressView.bottom + 20, width: view.width - 40, height: 80)
        part3Button.frame = CGRect(x: 20, y: myPickerView.bottom + 20, width: view.width - 40, height: 40)
    }
}

extension Part2: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerData[row])
    }
}
