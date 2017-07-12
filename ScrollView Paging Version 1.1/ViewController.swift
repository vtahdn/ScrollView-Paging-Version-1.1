//
//  ViewController.swift
//  ScrollView Paging Version 1.1
//
//  Created by Viet Anh Doan on 7/12/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var photo = UIImageView()
    var first = true
    var imageList = ["shop1-0","shop1-1","shop1-2","shop1-3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageControl.numberOfPages = imageList.count
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        if first {
            first = false
            let size = scrollView.frame.size
            scrollView.contentSize = CGSizeMake(size.width*CGFloat(imageList.count), 0)
            for i in 0..<imageList.count {
                let imageView = UIImageView(image: UIImage(named: imageList[i]+".jpg"))
                imageView.frame = CGRectMake(size.width*CGFloat(i), 0, size.width, size.height)
                imageView.contentMode = .ScaleAspectFit
                if i==0 {
                    photo = imageView
                }
                scrollView.addSubview(imageView)
            }
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return photo
    }
    
    @IBAction func pageChanged(sender: UIPageControl) {
        scrollView.contentOffset = CGPointMake(CGFloat(sender.currentPage)*scrollView.frame.size.width, 0)
    }
}

