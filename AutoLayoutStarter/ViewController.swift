//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
    
    let purpleView: UIView = {
//        let purple = UIView()
      let purple = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
      // important when setting contraints programmatically
        purple.translatesAutoresizingMaskIntoConstraints = false
        purple.backgroundColor = .purple
      return purple
    }()
    
    let label1 : UILabel = {
        let lb = UILabel()
        lb.text = "Label 1"
        lb.font = .boldSystemFont(ofSize: 20)
        lb.textAlignment = .center
        lb.backgroundColor = .blue
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let label2 : UILabel = {
        let lb = UILabel()
        lb.text = "Label 2"
        lb.font = .boldSystemFont(ofSize: 20)
        lb.textAlignment = .center
        lb.backgroundColor = .blue
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let label3 : UILabel = {
        let lb = UILabel()
        lb.text = "Label 3"
        lb.font = .boldSystemFont(ofSize: 20)
        lb.textAlignment = .center
        lb.backgroundColor = .blue
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
    
    view.addSubview(purpleView)
    purpleView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
    purpleView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    purpleView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6, constant: 0).isActive = true
    purpleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
    purpleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//    purpleView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.1, constant: 0).isActive = true
    
    let labelStackView = UIStackView(arrangedSubviews: [label1, label2, label3])
    labelStackView.translatesAutoresizingMaskIntoConstraints = false
    labelStackView.axis = .vertical
    labelStackView.alignment = .center
    labelStackView.distribution = .equalSpacing
//    labelStackView.backgroundColor = .red
//    labelStackView.spacing = 10
    
    view.addSubview(labelStackView)
    NSLayoutConstraint.activate([
        label1.widthAnchor.constraint(equalToConstant: 100),
        label1.heightAnchor.constraint(equalToConstant: 100),
        label2.widthAnchor.constraint(equalToConstant: 100),
        label2.heightAnchor.constraint(equalToConstant: 100),
        label3.widthAnchor.constraint(equalToConstant: 100),
        label3.heightAnchor.constraint(equalToConstant: 100),
        labelStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
        labelStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
        labelStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7),
        labelStackView.widthAnchor.constraint(equalToConstant: 300),
      ])
    
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

