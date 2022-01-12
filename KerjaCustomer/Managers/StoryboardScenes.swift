//
//  StoryboardScenes.swift
//  SehatQ
//  Copyright © 2019 PT SehatQ Harsana Emedika. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardScenes: String {
    case kSplashScreen              = "Splash"
    case kOnBoardingScreen          = "OnBoarding"
    case kLaunchScreen              = "Launch"
    case kLoginScreen               = "Login"
    case kResetPasswordScreen       = "ResetPassword"
    case kSignupScreen              = "Signup"
    case KHomeScreen                = "Home"
    case kBottomPopUpScreen         = "BottomPopUp"
    case kSearchScreen              = "Search"
    case kProfileCompletionScreen   = "ProfileCompletion"
    case kBookingLandingPageScreen  = "BookingLandingPage"
    case kBookingHcfListing         = "BookingHcfListing"
    case kBookingHcpListing         = "BookingHcpListing"
    case kBookingHcfDetails         = "BookingHcfDetails"
    case kBookingHcpDetails         = "BookingHcpDetails"
    case kBookingDoctor             = "BookingDoctor"
    case kBookingSummary            = "BookingSummary"
    case kTelmedEmptyState          = "TelmedEmptyState"
    case kInboxScreen               = "Inbox"
    case kTelmedRegistration        = "TelmedRegistration"
    case kTelmedChat                = "TelmedChat"
    case kTelmedWaitingDoctor       = "TelmedWaitingDoctor"
    case kTelmedFeedback            = "TelmedFeedback"
    case kTelmedThankyou            = "TelmedThankyou"
    case kTelmedServiceNotAvailable = "TelmedServiceNotAvailable"
    case kTelmedHome                = "TelmedHome"
    case kTelmedHistory             = "TelmedHistory"
    case kTelmedSpecialistZoom      = "TelmedSpecialistZoom"
    case kTelmedDoctorProfile       = "TelmedDoctorProfile"
    case kTelmedBusyDoctor          = "TelmedBusyDoctor"
    case kTelmedVideoCall           = "TelmedVideoCall"
    case kUserProfile               = "UserProfile"
    case kEditProfile               = "EditProfile"
    case kBookingHistoryEmpty       = "BookingHistoryEmpty"
    case kBookingHistory            = "BookingHistory"
    case kAppSettings               = "AppSettings"
    case kChangePassword            = "ChangePassword"
    case kDoctorProfilePopup        = "DoctorProfilePopup"
    case kUserFamily                = "UserFamily"
    case kUserFamilyDetail          = "ProfileDetail"
    case kUserMoreMenu              = "MoreMenu"
    case kUserCalendarLanding       = "CalendarLanding"
    case kTelemedLanding            = "TelemedLanding"
    case kPenyakitList              = "PenyakitList"
    case kCategory                  = "Category"
    case kInfoKesehatan             = "InfoKesehatan"
    case kArticleList               = "ArticleList"
    case kArticleDetail             = "ArticleDetail"
    case kEcommerceLanding          = "EcommerceLanding"
	case kProductDetail				= "ProductDetail"
    case kProductList               = "ProductList"
	case kSearchProduct 			= "SearchProduct"
    case kObatList                  = "ObatList"
    case kObatDetail                = "ObatDetail"
    case kPenyakitDetail            = "PenyakitDetail"
    case kForumDetail               = "ForumDetail"
    case kForumList                 = "ForumList"
    case kPromoList                 = "PromoList"
    case kAuthorDetail              = "AuthorDetail"
    case kPromoDetail               = "PromoDetail"
    case kAcaraList                 = "AcaraList"
    case kAcaraDetail               = "AcaraDetail"
    case kProcedureDetail           = "ProcedureDetail"
    case kProcedureList             = "ProcedureList"
    case kRecommendationDoctorOption = "RecommendationDoctorOption"
    case kTelmedAgentList           = "TelmedAgentList"
}

extension StoryboardScenes {
    func makeInstantiateViewController() -> UIViewController? {
        return storyboardWithName(self.rawValue).instantiateInitialViewController()
    }
    
    func makeViewControllerWithIdentifier(_ identifier: String) -> UIViewController? {
        return storyboardWithName(self.rawValue).instantiateViewController(withIdentifier: identifier)
    }
    
    func storyboardWithName(_ name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}
