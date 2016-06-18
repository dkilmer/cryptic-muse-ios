//
//  ViewController.swift
//  CrypticMuse
//
//  Created by david kilmer on 6/15/16.
//  Copyright © 2016 david kilmer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: Properties
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var anagramButton: UIButton!
  @IBOutlet weak var hiddenButton: UIButton!
  @IBOutlet weak var deletionButton: UIButton!
  @IBOutlet weak var wildcardButton: UIButton!
  @IBOutlet weak var indicatorButton: UIButton!

  // MARK: Actions
  @IBAction func anagramSearch(_ sender: AnyObject) {
    performSegue(withIdentifier: "resultsSegue", sender: sender)
  }
  
  @IBAction func hiddenSearch(_ sender: AnyObject) {
    if let term = searchTextField.text {
      let res = Hidden.search(term: term)
      for s in res {
        print(s)
      }
    }
  }
  
  @IBAction func deletionSearch(_ sender: AnyObject) {
    if let term = searchTextField.text {
      let res = Deletion.search(term: term)
      for s in res {
        print(s)
      }
    }
  }

  @IBAction func wildcardSearch(_ sender: AnyObject) {
    if let term = searchTextField.text {
      let res = Wildcard.search(term: term)
      for s in res {
        print(s)
      }
    }    
  }
  
  @IBAction func indicatorSearch(_ sender: AnyObject) {
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

