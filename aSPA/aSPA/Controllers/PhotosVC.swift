//
//  PhotosVC.swift
//  aSPA
//
//  Created by dmdm on 01/12/2021.
//

import UIKit

protocol  MoveToNextIndex {
    func  moveToNextIndex()
}

class PhotosVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , MoveToNextIndex{
//    Add collection view to show many photos
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionview: UICollectionView!
    
    var arrPhotos =
    [UIImage(named: "a")!,
     UIImage(named: "b")!,
     UIImage(named: "c")!,
     UIImage(named: "d")!,
     UIImage(named: "e")!,
     UIImage(named: "f")!,
     UIImage(named: "g")!,
     UIImage(named: "h")!,]
    
//    Timer
    var timer :Timer?
    var currentCellIndex = 0
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    @objc func moveToNextIndex(){
        if currentCellIndex < arrPhotos.count - 1{
            currentCellIndex += 1
        }else{
            currentCellIndex = 0
        }
        collectionview.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotosCell
        cell.imgNalis.image = arrPhotos[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: collectionview.frame.width, height: collectionview.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if (collectionView == collectionview) {
            return 0
        }
        return 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        view.backgroundColor = UIColor(named: "bgColor")
        
        startTimer()
        pageControl.numberOfPages = arrPhotos.count
    }
}
