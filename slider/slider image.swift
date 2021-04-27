//
//  slider image.swift
//  slider
//
//  Created by Amira on 10/13/20.
//  Copyright © 2020 Amira. All rights reserved.
//

import UIKit

class slider_image: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    
    @IBOutlet weak var pagecontroller: UIPageControl!
    var images:[UIImage] = [#imageLiteral(resourceName: "IMG-20200629-WA0027"),#imageLiteral(resourceName: "IMG-20200629-WA0030"),#imageLiteral(resourceName: "IMG-20200629-WA0022"),#imageLiteral(resourceName: "IMG-20200629-WA0028"),#imageLiteral(resourceName: "IMG-20200629-WA0025")]
   
    var currentindex = 0
    var timer:Timer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pagecontroller.numberOfPages = images.count
        playtimer()
    }
    


}
extension slider_image:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mera", for: indexPath)as! slidercell
        cell.imageview.image = images[indexPath.row]
        return cell 
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension slider_image{
    @objc func getcurrentindex() {
        currentindex = currentindex != images.count-1 ? currentindex+1 : 0
        pagecontroller.currentPage = currentindex
        collectionview.scrollToItem(at: IndexPath(row: currentindex, section: 0), at:.top, animated: true)
    }
    func playtimer(){
       timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(self.getcurrentindex), userInfo: nil, repeats: true)
        
    }    }

