//
//  ViewController.swift
//  Horizontal ScrollView
//
//  Created by Jai Nijhawan on 30/08/19.
//  Copyright © 2019 Jai Nijhawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  
  lazy var redView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    return view
  }()
  
  lazy var blueView: UIView = {
    let view = UIView()
    view.backgroundColor = .blue
    return view
  }()
  
  lazy var cyanView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.6162123084, green: 0.9662854075, blue: 0.8571907878, alpha: 1)
    return view
  }()
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    scrollView.addSubview(redView)
    scrollView.addSubview(blueView)
    self.view.addSubview(cyanView)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let width = scrollView.frame.width
    let height = scrollView.frame.height
    let contentSize = CGSize(width: (width * 2), height: height)
    scrollView.contentSize = contentSize
    
    let viewSize = CGSize(width: width, height: height)
    redView.frame = CGRect(origin: .zero, size: viewSize)
    
    let blueViewOrigin = CGPoint(x: width, y: 0)
    blueView.frame = CGRect(origin: blueViewOrigin, size: viewSize)
    
    let cyanViewSize = CGSize(width: 100, height: 100)
    cyanView.layer.cornerRadius = 50
    cyanView.frame = CGRect(origin:CGPoint(x: redView.frame.width - 100, y: redView.frame.height/2 - 50), size: cyanViewSize)
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let x = scrollView.contentOffset.x/2
    let y :CGFloat = (cyanView.frame.width/2)/(scrollView.frame.width/2) + 0.5
    let z = scrollView.frame.width-cyanView.frame.width
    let newX  = z - x * y
    
    cyanView.frame = CGRect(origin: CGPoint(x: newX , y: cyanView.frame.origin.y), size: cyanView.frame.size)
    
  }
}
