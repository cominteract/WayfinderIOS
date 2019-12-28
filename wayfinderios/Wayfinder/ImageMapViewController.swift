//
//  ImageMapViewController.swift
//  Wayfinder
//
//  Created by andre insigne on 05/04/2018.
//  Copyright © 2018 andre insigne. All rights reserved.
//

import UIKit

class ImageMapViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageMap: UIImageView!
    var currentYOffset = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell") as UITableViewCell!
        
        // set the text from the data model
        cell?.textLabel?.text = sortedBooth()[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offsetX_List().count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        imageMap.subviews.forEach({ $0.removeFromSuperview() })
        let p = getPosition(sortedBooth()[indexPath.row])
        var img : UIImageView
        img = UIImageView.init(frame: CGRect.init(x: offsetX_List()[p!], y: offsetY_List()[p!], width: width_List()[p!], height: height_List()[p!]))
        img.image = #imageLiteral(resourceName: "scube")
        imageMap.addSubview(img)
    }
    
    func getPosition (_ text:String) -> Int?
    {
        return booth_List().index(of: text)
    }
    
    func sortedBooth () -> Array<String> {
        var sortedArray = booth_List().sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        return sortedArray;
    }
    
    func offsetX_List() -> Array<Int> {
        return  [55,75,95,115,135,155,175,195,215,
                 52,52,80,80,80,94,94,94,123,138,138,174,174,194,
                 118,118,118,138,138,138,173,
                  52,52,52,80,80,80,94,124,124,138,173,
                    52,92,132,172,212]
    }
    
    func offsetY_List() -> Array<Int> {
        return  [30,30,30,30,30,30,30,30,30,
        62,76,62,76,62,62,76,90,62,62,62,62,62,62,
        117,157,177,117,157,177,117,
        212,226,240,212,226,240,240,212,226,212,212,
        267,267,267,267,267]
    }
    
    func width_List() -> Array<Int> {
        return  [19,19,19,19,19,19,19,19,36,
                 13,13,13,13,28,13,13,13,14,19,19,19,19,17,
                 19,19,19,19,19,19,59,
                 13,13,13,27,27,13,13,13,13,19,5,
                 39,39,39,39,39]
    }
    
    
    
    func height_List() -> Array<Int> {
        return  [19,19,19,19,19,19,19,19,72,
                 13,26,13,13,13,13,13,13,39,19,19,19,19,39,
                 38,19,19,38,19,19,80,
                 13,13,13,13,13,13,13,13,26,41,41,
                 25,25,25,25,25]
    }
    
    
    func booth_List() -> Array<String> {
        return  ["EXIST EXHIBIT SYSTEMS TECHNOLOGY CORP.",
                 "GREEN LITE",
                 "SPIN MANILA",
                 "MEGA MOBILE",
                 "MBC",
                 "ABS CBN",
                 "MOBEXT",
                 "FILIPINO STAR NGAYON",
                 "ADOBO",
                 "M3",
                 "MANILA NORTH TOLLWAYS CORPORATION",
                 "NONE",
                 "BROTHER",
                 "MEGAWORLD",
                 "M1",
                 "ALVEO LAND",
                 "SM LIFESTYLE",
                 "M2",
                 "WI FUN",
                 "VITAL STRATS",
                 "CCI",
                 "BIG PIX",
                 "OMAG",
                 "SMX",
                 "URLED ENTERPRISE",
                 "SBMA",
                 "MANILA BULLETIN",
                 "I ACADEMY",
                 "PLDT",
                 "NET PLAY INC",
                 "VIDEO SONIC",
                 "NONE",
                 "ALC",
                 "UNITED PRINT MEDIA GROUP (UPMG)",
                 "NONE",
                 "RCBC",
                 "V CARGO",
                 "CPE METROBANK",
                 "PINOY XTREME",
                 "MANILA NATURES",
                 "SMART/TV 5",
                 "PUREFOODS",
                 "SECRETARIAT",
                 "ASAP & HAND CREATIVE",
                 "AIR21",
        "BOMBORADYO"]
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        print("offset : \(offsetX_List().count) yoffset : \(offsetY_List().count) width : \(width_List().count) height : \(height_List().count)")
//        firstRow()
//        secondRow()
//        thirdRow()
//        fourthRow()
//        fifthRow()
        // Do any additional setup after loading the view.
    }
    
    func firstRow()
    {
        var offset  = 17
        var img : UIImageView
        currentYOffset = 30
        for var i in (0..<8)
        {
            var img : UIImageView
            img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset, width: 19, height: 18))
            img.image = #imageLiteral(resourceName: "scube")
            imageMap.addSubview(img)
            print("offset : \(offset + 38) yoffset : \(currentYOffset) width : 19 height : 19")
            offset += 20
        }
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: 30, width: 36, height: 72))
        img.image = #imageLiteral(resourceName: "lcube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset) width : 36 height : 72")
        imageMap.addSubview(img)
        currentYOffset = 30 + 32
    }

    func secondRow()
    {
        var offset  = 17
        var img : UIImageView
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 13 height : 13")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 14, width: 13, height: 26))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 14) width : 13 height : 26")
        imageMap.addSubview(img)
        
        offset += 25
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset) width : 13 height : 13")
        imageMap.addSubview(img)
        
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset + 14, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset + 14) width : 13 height : 13")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset + 28, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset) width : 28 height : 13")
        imageMap.addSubview(img)
        
        
        
        offset += 14
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset) width : 13 height : 13")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset + 14, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset + 14) width : 13 height : 13")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset + 28, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset + 28) width : 13 height : 13")
        
        imageMap.addSubview(img)
        
        
        
        offset += 29
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset, width: 14, height: 39))
        img.image = #imageLiteral(resourceName: "icube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset) width : 14 height : 39")
        imageMap.addSubview(img)
        offset += 15
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset, width: 19, height: 19))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset) width : 19 height : 19")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset + 20, width: 19, height: 19))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset + 20) width : 19 height : 19")
        imageMap.addSubview(img)
        offset += 36
        
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset, width: 19, height: 19))
        img.image = #imageLiteral(resourceName: "icube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset) width : 19 height : 19")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset + 20, width: 19, height: 19))
        img.image = #imageLiteral(resourceName: "icube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset + 20) width : 19 height : 19")
        imageMap.addSubview(img)
        offset += 20
        
        
        
        
        img = UIImageView.init(frame: CGRect.init(x: 38 + offset, y: currentYOffset, width: 17, height: 39))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 38) yoffset : \(currentYOffset) width : 17 height : 39")
        imageMap.addSubview(img)
        offset += 25
        currentYOffset += 55
    }
    
    func thirdRow()
    {
        var offset  = 83
        var img : UIImageView
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 19, height: 38))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 19 height : 38")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 40, width: 19, height: 19))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 40) width : 19 height : 19")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 60, width: 19, height: 19))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 60) width : 19 height : 19")
        imageMap.addSubview(img)
        
        
        
        
        
        offset += 20
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 19, height: 38))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 19 height : 38")
        imageMap.addSubview(img)
        
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 40, width: 19, height: 19))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 40) width : 19 height : 19")
        imageMap.addSubview(img)
        
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 60, width: 19, height: 19))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 60) width : 19 height : 19")
        imageMap.addSubview(img)
        offset += 35
        
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 59, height: 80))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 59 height : 80")
        imageMap.addSubview(img)
        
        
        currentYOffset += 95
        
    }
    
    func fourthRow()
    {
        var offset = 17
        
        var img : UIImageView
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 13 height : 13")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 14, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 14) width : 13 height : 13")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 28, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 28) width : 13 height : 13")
        imageMap.addSubview(img)
        
        
        offset += 28
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 27, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 27 height : 13")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 14, width: 27, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 14) width : 27 height : 13")
        imageMap.addSubview(img)
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 28, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 28) width : 13 height : 13")
        imageMap.addSubview(img)
        
        offset += 14
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 28, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 28) width : 13 height : 13")
        imageMap.addSubview(img)
        
        
        offset += 30
        
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 13, height: 13))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 13 height : 13")
        imageMap.addSubview(img)
        
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset + 14, width: 13, height: 26))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset + 14) width : 13 height : 26")
        imageMap.addSubview(img)
        
        offset += 14
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 19, height: 41))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 19 height : 41")
        imageMap.addSubview(img)
        
        offset += 35
        
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 59, height: 41))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 59 height : 41")
        imageMap.addSubview(img)
        
        
        currentYOffset += 55
        
    }
    
    func fifthRow()
    {
        var offset  = 17
        var img : UIImageView
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 39, height: 25))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 39 height : 25")
        imageMap.addSubview(img)
        
        offset+=40
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 39, height: 25))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 39 height : 25")
        imageMap.addSubview(img)
        
        offset+=40
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 39, height: 25))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 39 height : 25")
        imageMap.addSubview(img)
        
        offset+=40
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 39, height: 25))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 39 height : 25")
        imageMap.addSubview(img)
        
        offset+=40
        img = UIImageView.init(frame: CGRect.init(x: 35 + offset, y: currentYOffset, width: 39, height: 25))
        img.image = #imageLiteral(resourceName: "scube")
        print("offset : \(offset + 35) yoffset : \(currentYOffset) width : 39 height : 25")
        imageMap.addSubview(img)
        
        offset+=30
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
