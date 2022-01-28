//
//  ViewController.swift
//  Stopwatch
//
//  Created by Emily Nozaki on 2022/01/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var result: UILabel!
    
    var count: Double = 0.0
    
    var timer: Timer = Timer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func start() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        
    }
    
    @IBAction func stop() {
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
            //hanteiメソッドを呼び出し、結果を表示する
            hantei()
        }
        
    }
    @IBAction func reset(_ sender: Any) {
        if timer.isValid {
            timer.invalidate()
        }
        count = 0.0
        label.text = String(format: "%.2f", count)
    }
    
    @objc func up() {
        count += 0.01
        
        label.text = String(format: "%.2f", count)
    }
    
    func hantei() {
        if 9.8 <= count && count <= 10.2 {
            result.text = "perfect!"
        } else if 9.7 <= count && count <= 10.3 {
            result.text = "great!"
        } else if 9.5 <= count && count <= 10.5 {
            result.text = "good!"
        } else {
            result.text = "bad!!!!!"
        }
        
    }
    

}

