//
//  MainViewController.swift
//  Wayfinder
//
//  Created by andre insigne on 06/04/2018.
//  Copyright © 2018 andre insigne. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var schedSummit: UIButton!
    
    
    @IBOutlet weak var adSummit: UIButton!
    
    @IBOutlet weak var header: UIImageView!
    
    
    @IBAction func adSummitClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ImageMapViewController") as! ImageMapViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func schedSummitClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SchedViewController") as! SchedViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 1.5, animations: {
            self.header.alpha = 1.0
            self.schedSummit.alpha = 1.0
            self.adSummit.alpha = 1.0
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
