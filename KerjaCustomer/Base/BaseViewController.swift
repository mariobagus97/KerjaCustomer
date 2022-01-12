//
//  BaseViewController.swift
//  KerjaCustomer
//
//  Created by SehatQ on 12/01/22.
//

import NVActivityIndicatorView
import Toast_Swift
import FloatingPanel
import RxSwift

//enum RedirectSuccessLoginRegisterPage: Int {
//    case fabmenuLogin
//    case homeInbox
//    case homeLogin
//    case homeCart
//    case homeProfile
//    case homeTelemedFree
//    case smartclinicCovid
//    case telemedDetailRegister
//    case telemedLandingFreechat
//    case telemedLandingRegister
//    case telemedListingRegister
//    case forumDetailComment
//    case cartCheckout
//    case cartDigital
//    case cartVoucher
//    case telemedHistoryList // not on API
//    case bookingDoctorForm // not on API
//    case bookingProcedure
//    case bookingProcedureConsultation
//    case checkKipi
//    case kipiHistory
//    case none
//}
//
//enum MenuIconStyle {
//    case hamburger
//    case backArrow
//
//    func icon() -> UIImage? {
//        switch self {
//        case .hamburger:
//            return Constants.Images.SideMenuIcon.image()
//        case .backArrow:
//            return Constants.Images.NavigationBarBackIcon.image()
//        }
//    }
//}

class BaseViewController: UIViewController, NVActivityIndicatorViewable, UIGestureRecognizerDelegate {//, LaunchViewControllerDelegate {
    
}
//    var disposeBag = DisposeBag()
//    let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40.0, height: 40.0))
//
//    var isNavigationBarHidden: Bool = true
//
//    lazy var refreshControl: UIRefreshControl = {
//        let refreshControl = UIRefreshControl()
//        return refreshControl
//    }()
//
//    override func loadView() {
//        super.loadView()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupIndicatorView()
//        loadLocalizableTexts()
//        setupReachability()
//
//        // Enable swipe gesture back
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
//    }
//
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
//
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        if #available(iOS 12.0, *) {
//            if traitCollection.userInterfaceStyle == .light {
//                if #available(iOS 13.0, *) {
//                    return .darkContent
//                } else {
//                    return .default
//                }
//            } else {
//                return .lightContent
//            }
//        } else {
//            return .default
//        }
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: true)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    func setupIndicatorView() {
//        view.addSubview(activityIndicatorView)
//        activityIndicatorView.type = .circleStrokeSpin
//        activityIndicatorView.color = UIColor.black//Constants.Colors.AppBaseDarkBlueColor.color()
//        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
//        view.placeAtTheCenterWithView(view: activityIndicatorView)
//    }
//
////    func setupReachability() {
////        do {
////            let reachability = try Reachability()
////            NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
////            do {
////                try reachability.startNotifier()
////            } catch {
////                SQLogger.log("could not start reachability notifier")
////            }
////        } catch {
////            SQLogger.log("could not start reachability")
////        }
////    }
//
////    @objc func reachabilityChanged(note: Notification) {
////        if let reachability = note.object as? Reachability {
////            networkReachabilityStatus(reachability.connection)
////        }
////    }
//
////    func networkReachabilityStatus(_ status: Reachability.Connection) {
////
////    }
//
//    func handleRefreshContent() {
//
//    }
//
//    func loadLocalizableTexts() {
//
//    }
//
//    func confirmSendBirdDelegate() {
//
//    }
//
////    func keyboardHeight() -> Observable<CGFloat> {
////        return Observable
////            .from([
////                NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
////                    .map { notification -> CGFloat in
////                        (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
////                    },
////                NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
////                    .map { _ -> CGFloat in
////                        0
////                    }
////                ])
////            .merge()
////    }
//
//    func setupRefreshControl(_ scrollView: UIScrollView) {
//        refreshControl.addTarget(self, action: #selector(BaseViewController.triggerRefreshControl), for: .valueChanged)
//        scrollView.addSubview(refreshControl)
//    }
//
//    @objc func triggerRefreshControl() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            self.refreshControl.endRefreshing()
//        }
//        handleRefreshContent()
//    }
//
//    func toggleIndicatorLoadingMode(_ loading: Bool) {
//        DispatchQueue.main.async {
//            loading ? self.activityIndicatorView.startAnimating() : self.activityIndicatorView.stopAnimating()
//        }
//    }
//
////    deinit {
////        SQLogger.log("Deinit \(type(of: self))")
////    }
//
////    func setupAppLogoTitleView() {
////        let logoImageView = UIImageView(image: UIImage(named: Constants.Images.NavigationBarLogo.rawValue))
////        navigationItem.titleView = logoImageView
////    }
//
//    func bindErrorStateInViewModel(_ viewModel: BaseViewModel) {
//        viewModel.errorModelObservable
//            .asObservable()
//            .observeOn(MainScheduler.instance)
//            .subscribe(onNext: { [unowned self] errorModel in
//                self.showError(errorModel)
//            }).disposed(by: disposeBag)
//    }
//
//    func bindErrorStateInViewModel(_ viewModel: NewBaseViewModel) {
//        viewModel.errorModelObservable
//            .observeOn(MainScheduler.instance)
//            .skip(1)
//            .subscribe(onNext: { [weak self] errorModel in
//                self?.showError(errorModel)
//            }).disposed(by: disposeBag)
//    }
//
//    func bindErrorStateToast(_ viewModel: BaseViewModel) {
//        viewModel.errorModelObservable
//            .observeOn(MainScheduler.instance)
//            .subscribe(onNext: { [weak self] errorModel in
//                guard let errorModel = errorModel else { return }
//                self?.showToastError(errorModel)
//            }).disposed(by: disposeBag)
//    }
//
//    func showToastMessage(_ message: String, isAppWindow: Bool = false) {
////        UIApplication.shared.keyWindow?.makeTokoDefaultToast(message, type: .negative)
//    }
//
//    func showToast(message: String, isShowInAppWindow: Bool = false, backgroundColor: UIColor? = nil, textColor: UIColor? = nil) {
//        var style = ToastStyle()
//
//        if let textColor = textColor {
//            style.messageColor = textColor
//        }
//
//        if let backgroundColor = backgroundColor {
//            style.backgroundColor = backgroundColor
//        }
//
////        style.messageFont = Constants.Fonts.Regular.font(12)
//        style.messageAlignment = .center
//        style.cornerRadius = 4
//
//        var appView: UIView?
//
//        if isShowInAppWindow {
//           appView = UIApplication.shared.keyWindow
//        } else {
//            appView = view
//        }
//
//        let toastView = createDefaultToastView(message: message, title: nil, image: nil, style: style)
//        let point = CGPoint(x: view.bounds.size.width / 2.0, y: (view.bounds.size.height - (toastView.frame.size.height / 2.0)) - 100)
//        appView?.showToast(toastView, duration: 5.0, point: point, completion: nil)
//
//        // toggle "tap to dismiss" functionality
//        ToastManager.shared.isTapToDismissEnabled = true
//        ToastManager.shared.isQueueEnabled = true
//    }
//
//    // TODO: create better default view for generics toast
//    func createDefaultToastView(message: String?, title: String?, image: UIImage?, style: ToastStyle) -> UIView {
//        var messageLabel: UILabel?
//        var titleLabel: UILabel?
//        var imageView: UIImageView?
//
//        let wrapperView = UIView()
//        wrapperView.backgroundColor = style.backgroundColor
//        wrapperView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
//        wrapperView.layer.cornerRadius = style.cornerRadius
//        wrapperView.layer.borderWidth = 1
//        wrapperView.layer.borderColor = UIColor.red.cgColor//UIColor.sehatqRedLineError.withAlphaComponent(0.5).cgColor
//
//        if style.displayShadow {
//            wrapperView.layer.shadowColor = UIColor.black.cgColor
//            wrapperView.layer.shadowOpacity = style.shadowOpacity
//            wrapperView.layer.shadowRadius = style.shadowRadius
//            wrapperView.layer.shadowOffset = style.shadowOffset
//        }
//
//        if let image = image {
//            imageView = UIImageView(image: image)
//            imageView?.contentMode = .scaleAspectFit
//            imageView?.frame = CGRect(x: style.horizontalPadding, y: style.verticalPadding, width: style.imageSize.width, height: style.imageSize.height)
//        }
//
//        var imageRect = CGRect.zero
//
//        if let imageView = imageView {
//            imageRect.origin.x = style.horizontalPadding
//            imageRect.origin.y = style.verticalPadding
//            imageRect.size.width = imageView.bounds.size.width
//            imageRect.size.height = imageView.bounds.size.height
//        }
//
//        if let title = title {
//            titleLabel = UILabel()
//            titleLabel?.numberOfLines = style.titleNumberOfLines
//            titleLabel?.font = style.titleFont
//            titleLabel?.textAlignment = style.titleAlignment
//            titleLabel?.lineBreakMode = .byTruncatingTail
//            titleLabel?.textColor = style.titleColor
//            titleLabel?.backgroundColor = UIColor.clear
//            titleLabel?.text = title;
//
//            let maxTitleSize = CGSize(width: (self.view.bounds.size.width * style.maxWidthPercentage) - imageRect.size.width,
//                                      height: self.view.bounds.size.height * style.maxHeightPercentage)
//            let titleSize = titleLabel?.sizeThatFits(maxTitleSize)
//            if let titleSize = titleSize {
//                titleLabel?.frame = CGRect(x: 0.0, y: 0.0, width: titleSize.width, height: titleSize.height)
//            }
//        }
//
//        if let message = message {
//            messageLabel = UILabel()
//            messageLabel?.text = message
//            messageLabel?.numberOfLines = style.messageNumberOfLines
//            messageLabel?.font = style.messageFont
//            messageLabel?.textAlignment = style.messageAlignment
//            messageLabel?.lineBreakMode = .byTruncatingTail;
//            messageLabel?.textColor = style.messageColor
//            messageLabel?.backgroundColor = UIColor.clear
//
//            let maxMessageSize = CGSize(width: (self.view.bounds.size.width * style.maxWidthPercentage) - imageRect.size.width,
//                                        height: self.view.bounds.size.height * style.maxHeightPercentage)
//            let messageSize = messageLabel?.sizeThatFits(maxMessageSize)
//            if let messageSize = messageSize {
//                let actualWidth = UIScreen.main.bounds.width - 64
//                //min(messageSize.width, maxMessageSize.width)
//                let actualHeight = min(messageSize.height, maxMessageSize.height)
//                messageLabel?.frame = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
//            }
//        }
//
//        var titleRect = CGRect.zero
//
//        if let titleLabel = titleLabel {
//            titleRect.origin.x = imageRect.origin.x + imageRect.size.width + style.horizontalPadding
//            titleRect.origin.y = style.verticalPadding
//            titleRect.size.width = titleLabel.bounds.size.width
//            titleRect.size.height = titleLabel.bounds.size.height
//        }
//
//        var messageRect = CGRect.zero
//
//        if let messageLabel = messageLabel {
//            messageRect.origin.x = imageRect.origin.x + imageRect.size.width + style.horizontalPadding
//            messageRect.origin.y = titleRect.origin.y + titleRect.size.height + style.verticalPadding
//            messageRect.size.width = messageLabel.bounds.size.width
//            messageRect.size.height = messageLabel.bounds.size.height
//        }
//
//        let longerWidth = max(titleRect.size.width, messageRect.size.width)
//        //let longerX = max(titleRect.origin.x, messageRect.origin.x)
//        let wrapperWidth = UIScreen.main.bounds.width - 32
//        //max((imageRect.size.width + (style.horizontalPadding * 2.0)), (longerX + longerWidth + style.horizontalPadding))
//        let wrapperHeight = max((messageRect.origin.y + messageRect.size.height + style.verticalPadding), (imageRect.size.height + (style.verticalPadding * 2.0)))
//
//        wrapperView.frame = CGRect(x: 0.0, y: 0.0, width: wrapperWidth, height: wrapperHeight)
//
//        if let titleLabel = titleLabel {
//            titleRect.size.width = longerWidth
//            titleLabel.frame = titleRect
//            wrapperView.addSubview(titleLabel)
//        }
//
//        if let messageLabel = messageLabel {
//            messageRect.size.width = longerWidth
//            messageLabel.frame = messageRect
//            wrapperView.addSubview(messageLabel)
//        }
//
//        if let imageView = imageView {
//            wrapperView.addSubview(imageView)
//        }
//
//        return wrapperView
//    }
//
////    func showError(_ errorModel: ResponseErrorModel?) {
////        if let validErrorModel = errorModel {
////            if let statusCode = validErrorModel.status, statusCode.intValue == NSURLErrorNotConnectedToInternet { //Show login for Unauthorized access
////                self.showToastMessage("Internet connection not available.")
////            } else {
////                if let vc = BottomPopUpWireframe.makeNetworkErrorBottomPopUpView() as? NetworkErrorPopUpViewController {
////                    vc.titleString = validErrorModel.title ?? "Error"
////                    vc.descriptionString = validErrorModel.detail
////
////                    if errorModel?.field == "freeQuota" {
////                        vc.headerImageName = "icn_empty_qouta"
////                    } else {
////                        vc.headerImageViewUrl = validErrorModel.errorImageUrl
////                    }
////
////                    if let validUnauthorisedCode = validErrorModel.status, validUnauthorisedCode == NSNumber(value: 401) {
////                        UserManager.sharedInstance.clearUserCredential()
////                        ShippingAddressModel.clear()
////                        UIApplication.shared.keyWindow?.rootViewController = LoginWireframe.makeLoginView()
////                        if let validTokenExpireMessage = validErrorModel.detail {
////                             showToastMessage(validTokenExpireMessage, isAppWindow: true)
////                        }
////                        return
////                    }
////                    self.present(vc, animated: true, completion: nil)
////                } else {
////                    let errorAlert = AlertHelper.nativeAlertController(validErrorModel.title, message: validErrorModel.detail, cancelButton: LocalizationKey.Dialog.OK.localizedString(), confirmButton: nil, confirmHandler: nil)
////                    errorAlert.show()
////                }
////            }
////        }
////    }
//
////    func showError(_ error: ResponseError.ErrorModel?) {
////        guard let validErrorModel = error else  { return }
////        if let bottomPopup = BottomPopUpWireframe.makeNetworkErrorBottomPopUpView() as? NetworkErrorPopUpViewController {
////            bottomPopup.titleString = validErrorModel.title ?? "Error"
////            bottomPopup.descriptionString = validErrorModel.detail
////            self.present(bottomPopup, animated: true, completion: nil)
////        } else {
////            let errorAlert = AlertHelper.nativeAlertController(validErrorModel.title, message: validErrorModel.detail, cancelButton: LocalizationKey.Dialog.OK.localizedString(), confirmButton: nil, confirmHandler: nil)
////            errorAlert.show()
////        }
////    }
//
////    func showToastError(_ errorModel: ResponseErrorModel) {
////        if errorModel.status?.intValue == NSURLErrorNotConnectedToInternet {
////            showToastMessage("Internet connection not available")
////        } else {
////            guard let descriptionMessage = errorModel.detail else { return }
////            showToast(message: descriptionMessage, isShowInAppWindow: true, backgroundColor: .sehatqRedBackgroundError, textColor: .sehatqTextBlack)
////        }
////    }
//
//    func showAlertWithTitleAndMessage(title: String? = "Alert", message: String, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
//        DispatchQueue.main.async {
//            let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: handler))
//            self.present(alert, animated: true, completion: {
//            })
//        }
//    }
//
////    func showPopUpBottom(message: String, buttonTitle: String = NSLocalizedString("Ok", comment: "")) {
////        let generalPopup = GeneralPopupView()
////        generalPopup.setGeneralTitle.accept(message)
////        generalPopup.closeButtonTitle.accept(buttonTitle)
////        generalPopup.shouldDismissInteractivelty = true
////        present(generalPopup, animated: true, completion: nil)
////    }
//
//    @objc func customBackButtonTapped() {
//        navigationController?.popViewController(animated: true)
//    }
//
//    @objc func toggleSideMenu() {
//
//    }
//
//    @objc func searchButtonTapped() {
//        //navigationController?.pushViewController(vc_here, animated: true)
//    }
//
//    @objc func contextMenuBarButtonTapped() {
//
//    }
//
//    func setRootHomeViewController() {
////        UIApplication.shared.keyWindow?.rootViewController = HomeWireframe.makeHomeView3RootController()
//    }
//
////    func handleAfterLoginRegister(afterLoginScreenType: RedirectSuccessLoginRegisterPage) {
////
////    }
//
////    func presentLogin(_ isSkipEnable: Bool = false, redirectSuccessPage: RedirectSuccessLoginRegisterPage = .none) {
////        if let vc = LoginWireframe.makeLoginViewRootController() as? LoginViewController {
////            vc.isSkipEnable = isSkipEnable
////            vc.delegate = self
////            vc.redirectPage = redirectSuccessPage
////            let nav = UINavigationController(rootViewController: vc)
////            nav.modalPresentationStyle = .fullScreen
////            present(nav, animated: true, completion: nil)
////        }
////    }
//
////    func userSuccessLoginRegister(afterLoginScreenType: RedirectSuccessLoginRegisterPage) {
////
////    }
//}
//
//extension BaseViewController {
//
//    func showFloatingPanelForController(_ contentVC: UIViewController, isRemovalInteractionEnabled: Bool = true) {
//        let fpc = FloatingPanelController()
//        fpc.set(contentViewController: contentVC)
//        fpc.view.frame = contentVC.view.bounds
//        fpc.isRemovalInteractionEnabled = isRemovalInteractionEnabled
//        present(fpc, animated: true, completion: nil)
//    }
//}
//
//extension BaseViewController {
////    func applyNavigationBarStyle() {
////        navigationController?.navigationBar.titleTextAttributes = [
////            NSAttributedString.Key.foregroundColor: UIColor.white,
////            NSAttributedString.Key.font: Constants.Fonts.Bold.font(14)
////        ]
////
////        let backButtonImage = Constants.Images.NavigationBarBackIcon.image()?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
////        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
////        navigationController?.navigationBar.backIndicatorImage = backButtonImage
////        navigationItem.backBarButtonItem = UIBarButtonItem(image: nil, style: .plain, target: nil, action: nil)
////    }
//
//    func updateTitle(_ rawTitle: String) {
//        title = rawTitle.uppercased()
//    }
//
////    func setupMenuBarButton(_ style: MenuIconStyle = .hamburger) {
////        let menuBarButton = UIBarButtonItem(image: style.icon()?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(BaseViewController.toggleSideMenu))
////        navigationItem.leftBarButtonItem = menuBarButton
////    }
//
////    func setupSearchBarButton() {
////        let searchBarButtonImage = UIImage(named: Constants.Images.SearchIconWhite.rawValue)
////        let searchBarButton = UIBarButtonItem(image: searchBarButtonImage?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(BaseViewController.searchButtonTapped))
////        navigationItem.rightBarButtonItem = searchBarButton
////    }
////
////    func setupCustomBackButton() {
////        let backButtonMenuBarButton = UIBarButtonItem(image: Constants.Images.NavigationBarBackIcon.image()?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0)), style: .plain, target: self, action: #selector(BaseViewController.customBackButtonTapped))
////        navigationItem.leftBarButtonItem = backButtonMenuBarButton
////    }
//
//    func hideNavigationBackButton() {
//        navigationItem.hidesBackButton = true
//    }
//
//    func popToVC(vc: AnyClass) {
//        if let arrVC = self.navigationController?.viewControllers {
//            if arrVC.count > 0 {
//                for v in arrVC.reversed() {
//                    if v.isKind(of: vc) {
//                        self.navigationController?.popToViewController(v, animated: true)
//                        break
//                    }
//                }
//                self.navigationController?.popViewController(animated: true)
//            } else {
//                self.navigationController?.popViewController(animated: true)
//            }
//        } else {
//            self.navigationController?.popViewController(animated: true)
//        }
//    }
//}
//
//extension UIViewController {
//    func loginStatus() -> Bool {
////        if UserManager.sharedInstance.currentUser == nil {
////            UserManager.sharedInstance.clearUserCredential()
////            SQAnalytics.sharedInstance.event(.loginButtonNavBar, properties: AnalyticsProperty.userAttributes())
////            return false
////        }
//        return true
//    }
//}
//
//class ModalPanelLayout: FloatingPanelIntrinsicLayout {
//    var topInteractionBuffer: CGFloat {
//        return 100.0
//    }
//    func backdropAlphaFor(position: FloatingPanelPosition) -> CGFloat {
//        return 0.3
//    }
//}
