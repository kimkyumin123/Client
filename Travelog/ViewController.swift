//
//  ViewController.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let text = UILabel()
    text.text = "Hello world"
    text.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(text)
    view.backgroundColor = .systemBackground
    NSLayoutConstraint.activate([
      text.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      text.widthAnchor.constraint(greaterThanOrEqualToConstant: 30),
    ])
  }

}
