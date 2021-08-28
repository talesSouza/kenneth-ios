//
//  ViewController.swift
//  Kenneth
//
//  Created by Tales Silveira de Souza on 14/08/21.
//

import UIKit

class SliderViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private var startButton: UIButton!
    @IBOutlet private var pageControl: UIPageControl!
}

// MARK: - Life Cycle
extension SliderViewController {

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - ScrollViewDelegate
extension SliderViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.view.layoutIfNeeded()
        if scrollView.contentOffset.y != 0 {
            scrollView.contentOffset.y = 0
        }
        updatePageControll(scrollView: scrollView)
    }
    
    private func updatePageControll(scrollView: UIScrollView) {
        
        let scrollX = scrollView.contentOffset.x
        let percent = scrollX / scrollView.contentSize.width

        if percent < 0.25 {
            pageControl.currentPage = 0
        } else if percent < 0.50 {
            pageControl.currentPage = 1
        } else if percent < 0.75 {
            pageControl.currentPage = 2
            UIView.animate(withDuration: 0.5) {
                self.startButton.alpha = 0
            }
        } else {
            pageControl.currentPage = 3
            UIView.animate(withDuration: 0.5) {
                self.startButton.alpha = 1
            }
        }
    }
}

