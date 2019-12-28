//
//  ViewController.swift
//  Wayfinder
//
//  Created by andre insigne on 03/04/2018.
//  Copyright © 2018 andre insigne. All rights reserved.
//

import UIKit

class SchedViewController: UIViewController, UITabBarDelegate, UIScrollViewDelegate {


    @IBOutlet weak var tabBar: CustomTabBar!
    
   
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var schedTitleImage: UIImageView!
    
    @IBOutlet weak var schedPrevImage: UIImageView!
    
    @IBOutlet weak var schedNextImage: UIImageView!
    
    @IBOutlet weak var schedBgImage: UIImageView!
    
    
    var tabBars = [UITabBarItem]()
    
    var currentTabIndex : Int = 0
    var currentIndex : Int = 0
    var selectedImages = [UIImage]()
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("END Scrolling \(scrollView.contentOffset.x / scrollView.bounds.size.width)")
        currentIndex = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        if currentIndex < tabBars.count
        {
            tabBar.selectedItem = tabBars[currentIndex]
        }
    }
    
    @IBAction func prevSchedClicked(_ sender: Any) {
        
        currentIndex-=1
        if currentIndex == 1
        {
            fridayTab()
        }
        else if currentIndex == 0
        {
            thursdayTab()
        }
        else
        {
            self.dismiss(animated: true, completion: nil)
            print("Go home")
        }
        
    }

    
    @IBAction func nextSchedClicked(_ sender: Any) {
        currentIndex+=1
        if currentIndex == 2
        {
            saturdayTab()
        }
        else if currentIndex == 1
        {
            fridayTab()
        }
        else
        {
            self.dismiss(animated: true, completion: nil)
            print("Go home")
        }
        
        
        
    }
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        scrollTo(item.tag)
        currentIndex = item.tag
        //schedSpeakerImage.image = selectedImages[item.tag]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.scrollView.delegate = self
        self.scrollView.clipsToBounds = false
        self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.scrollView.isPagingEnabled = true
        thursdayTab()
        tabBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func generateImageViews(_ count:Int)
    {
        let subviews = self.scrollView.subviews
        for subview in subviews{
            subview.removeFromSuperview()
        }
        var position = self.scrollView.frame.size.width;
        for var i in (0..<count)
        {
            position = self.scrollView.frame.size.width  * CGFloat(i)
            let imgV : UIImageView = UIImageView.init(frame: CGRect.init(x: position, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height))
            imgV.image = selectedImages[i]
            self.scrollView .addSubview(imgV)
        }
        self.scrollView.contentSize = CGSize.init(width: position + scrollView.frame.size.width, height: self.scrollView.frame.size.height)
        
    }
    
    func scrollTo(_ position : Int)
    {
   
        var speed : Int = position - currentIndex
        if(currentIndex > position)
        {
            speed = currentIndex - position
        }
        DispatchQueue.main.async() {
            UIView.animate(withDuration: TimeInterval(speed/3), delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                     self.scrollView.contentOffset = CGPoint.init(x: self.scrollView.frame.size.width * CGFloat(position), y: 0)
            }, completion: nil)
        }
    }
    
    
    func thursdayTab()
    {
        tabBars.removeAll()
        selectedImages.removeAll()
        selectedImages.append(#imageLiteral(resourceName: "louiecomplete"))
        selectedImages.append(#imageLiteral(resourceName: "chotcomplete"))
        selectedImages.append(#imageLiteral(resourceName: "marcuscomplete"))
        selectedImages.append(#imageLiteral(resourceName: "sandipancomplete"))
        selectedImages.append(#imageLiteral(resourceName: "boycomplete"))
        selectedImages.append(#imageLiteral(resourceName: "dickcomplete"))
        generateImageViews(selectedImages.count)
        currentIndex = 0
        currentTabIndex = 5
        let tabItem1 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"louieunsel"), selectedImage: UIImage(named:"louiesel"))
        let tabItem2 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"chotunsel"), selectedImage: UIImage(named:"chotsel"))
        let tabItem3 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"marcusunsel"), selectedImage: UIImage(named:"marcussel"))
        let tabItem4 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"sandipanunsel"), selectedImage: UIImage(named:"sandipansel"))
        let tabItem5 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"boyunsel"), selectedImage: UIImage(named:"boysel"))
        let tabItem6 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"dickunsel"), selectedImage: UIImage(named:"dicksel"))
        
        tabBars.append(tabItem1)
        tabBars.append(tabItem2)
        tabBars.append(tabItem3)
        tabBars.append(tabItem4)
        tabBars.append(tabItem5)
        tabBars.append(tabItem6)
        schedPrevImage.image = UIImage(named:"home")
        schedNextImage.image = UIImage(named:"next")
        schedBgImage.image = UIImage(named:"thuschedbg")
        //schedSpeakerImage.image = UIImage(named:"dickcomplete")
        schedTitleImage.image = UIImage(named:"schedtitlethu")
        var index : Int = 0
        for item in tabBars {
            item.tag = index
            item.image = item.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            item.selectedImage = item.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            item.imageInsets = UIEdgeInsetsMake(3, 5, -3, -5)
            index+=1
        }
       
        tabBar.itemWidth = self.view.frame.size.width/CGFloat(selectedImages.count)
        tabBar.setItems(tabBars, animated: true)
        tabBar.itemPositioning = .fill
       
    }

    func fridayTab()
    {
        tabBars.removeAll()
        selectedImages.removeAll()
        selectedImages.append(#imageLiteral(resourceName: "merleecomplete"))
        selectedImages.append(#imageLiteral(resourceName: "cheukcomplete"))
        selectedImages.append(#imageLiteral(resourceName: "simoncomplete"))
        selectedImages.append(#imageLiteral(resourceName: "arielcomplete"))
        
        generateImageViews(selectedImages.count)
        currentTabIndex = 3
        currentIndex = 1
        let tabItem1 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"merleeunsel"), selectedImage: UIImage(named:"merleesel"))
        let tabItem2 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"cheukunsel"), selectedImage: UIImage(named:"cheuksel"))
        let tabItem3 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"simonunsel"), selectedImage: UIImage(named:"simonsel"))
        let tabItem4 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"arielunsel"), selectedImage: UIImage(named:"arielsel"))

        
        tabBars.append(tabItem1)
        tabBars.append(tabItem2)
        tabBars.append(tabItem3)
        tabBars.append(tabItem4)

        schedPrevImage.image = UIImage(named:"previous")
        schedNextImage.image = UIImage(named:"next")
        //schedSpeakerImage.image = UIImage(named:"arielcomplete")
        schedBgImage.image = UIImage(named:"frischedbg")
        schedTitleImage.image = UIImage(named:"schedtitlefri")
        var index : Int = 0
        for item in tabBars {
            item.tag = index
            item.image = item.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            item.selectedImage = item.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            item.imageInsets = UIEdgeInsetsMake(3, 5, -3, -5)
            index+=1
        }
        tabBar.itemWidth = self.view.frame.size.width/CGFloat(selectedImages.count)
        tabBar.setItems(tabBars, animated: true)
        tabBar.itemPositioning = .fill
    }
    
    func saturdayTab()
    {
        tabBars.removeAll()
        selectedImages.removeAll()
        selectedImages.append(#imageLiteral(resourceName: "charlescomplete"))
        selectedImages.append(#imageLiteral(resourceName: "emilycomplete"))
        selectedImages.append(#imageLiteral(resourceName: "tomcomplete"))
        
        generateImageViews(selectedImages.count)
        
        currentTabIndex = 2
        currentIndex = 2
        let tabItem1 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"charlesunsel"), selectedImage: UIImage(named:"charlessel"))
        let tabItem2 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"emilyunsel"), selectedImage: UIImage(named:"emilysel"))
        let tabItem3 : UITabBarItem = UITabBarItem.init(title: nil, image: UIImage(named:"tomunsel"), selectedImage: UIImage(named:"tomsel"))

        
        tabBars.append(tabItem1)
        tabBars.append(tabItem2)
        tabBars.append(tabItem3)

        schedPrevImage.image = UIImage(named:"previous")
        schedNextImage.image = UIImage(named:"home")
        schedBgImage.image = UIImage(named:"satschedbg")
        //schedSpeakerImage.image = UIImage(named:"tomcomplete")
        schedTitleImage.image = UIImage(named:"schedtitlesat")
        var index : Int = 0
        for item in tabBars {
            item.tag = index
            item.image = item.image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            item.selectedImage = item.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            item.imageInsets = UIEdgeInsetsMake(3, 5, -3, -5)
            index+=1
        }
        tabBar.itemWidth = self.view.frame.size.width/CGFloat(selectedImages.count)
        tabBar.setItems(tabBars, animated: true)
        tabBar.itemPositioning = .fill
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

