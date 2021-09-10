import UIKit

class SliderViewController: BaseViewController {

    // MARK: - Dependencies
    let viewModel: SliderViewModel = SliderViewModel()
    
    // MARK: - IBOutlets
    
    @IBOutlet private var slide1TitleLabelView: LabelView!
    @IBOutlet private var slide1DescriptionLabelView: LabelView!
    @IBOutlet private var slide2TitleLabelView: LabelView!
    @IBOutlet private var slide2DescriptionLabelView: LabelView!
    @IBOutlet private var slide3TitleLabelView: LabelView!
    @IBOutlet private var slide3DescriptionLabelView: LabelView!
    @IBOutlet private var slide4TitleLabelView: LabelView!
    @IBOutlet private var slide4DescriptionLabelView: LabelView!
    
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
            setupLabels()
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
    
    private func setupLabels() {
        slide1TitleLabelView.set(text: "slider.title1".localized, textStyle: .primary)
        slide1DescriptionLabelView.set(text: "slider.description1".localized, textStyle: .secondary)
        slide2TitleLabelView.set(text: "slider.title2".localized, textStyle: .primary)
        slide2DescriptionLabelView.set(text: "slider.description2".localized, textStyle: .secondary)
        slide3TitleLabelView.set(text: "slider.title3".localized, textStyle: .primary)
        slide3DescriptionLabelView.set(text: "slider.description3".localized, textStyle: .secondary)
        slide4TitleLabelView.set(text: "slider.title4".localized, textStyle: .primary)
        slide4DescriptionLabelView.set(text: "slider.description4".localized, textStyle: .secondary)
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

