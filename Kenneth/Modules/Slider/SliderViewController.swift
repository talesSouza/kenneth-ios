//
//  ViewController.swift
//  Kenneth
//
//  Created by Tales Silveira de Souza on 14/08/21.
//

import UIKit

class SliderViewController: BaseViewController {

    // MARK: - Dependencies
    let viewModel: SliderViewModel = SliderViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet private var startButtonView: ButtonView!
    @IBOutlet private var pageControl: UIPageControl!
}

// MARK: - Life Cycle
extension SliderViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setObserver()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - View State
extension SliderViewController {
    
    private func setObserver() {
        observe(viewModel.$state) { [weak self] state in
            guard let self = self else { return }
            self.changed(state: state)
        }
    }
    
    private func changed(state: SliderViewState) {
        switch state {
        case .started:
            setupButtons()
        case .finishedSlider:
            goToOnboarding()
        }
    }
}

// MARK: - Private Methods
extension SliderViewController {
    
    private func setupButtons() {
        startButtonView.set(title: "slider.enter".localized,
                            style: .primary)
        startButtonView.set { [weak self] in
            guard let self = self else { return }
            self.viewModel.setFinishedTutorial()
        }
    }
    
    private func goToOnboarding() {
        performSegue(withIdentifier: "goToOnboarding", sender: self)
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
                self.startButtonView.alpha = 0
            }
        } else {
            pageControl.currentPage = 3
            UIView.animate(withDuration: 0.5) {
                self.startButtonView.alpha = 1
            }
        }
    }
}

