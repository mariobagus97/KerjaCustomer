# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

use_frameworks!
use_modular_headers!
inhibit_all_warnings!

$realm_swift_version = '~> 5.5.1'

def user_interface
  pod 'BottomPopup', '~> 0.5.5'
  pod 'NVActivityIndicatorView', '~> 4.8.0'
  pod 'Toast-Swift', '~> 5.0.0'
  pod 'FSCalendar', '~> 2.8.2'
  pod 'AnyCodable-FlightSchool', '~> 0.2.2'
  pod 'URLEmbeddedView'
  pod 'SkeletonView', :git => 'https://github.com/Juanpe/SkeletonView', :tag => '1.8.2'
  pod 'FloatingPanel', '~> 1.7.6'
  pod 'Cosmos', '~> 20.0' #star rating library
  pod 'DropDown', '2.3.13'
  pod 'FSPagerView', '0.8.3'
  pod 'ImageSlideshow', '~> 1.9.2'
  pod 'Instructions', '~> 2.0.0'
  pod 'TOInsetGroupedTableView'
  pod 'FlexibleSteppedProgressBar'
  pod 'Parchment', '~> 2.4.0'
  pod 'MaterialComponents/TextControls+OutlinedTextAreas', '~> 124.2.0'
  pod 'MaterialComponents/TextControls+OutlinedTextFields', '~> 124.2.0'
  pod 'PanModal', '~> 1.2.7'
  pod 'MultiSlider', '~> 1.11.2'
end

def utilities
  pod 'RxSwift', '~> 5.1.3'
  pod 'RxCocoa', '~> 5.1.3'
  pod 'RxBlocking', '~> 5.1.3'
  pod 'Alamofire', '~> 4.9.1'
  pod 'Kingfisher', '~> 5.10.0'
  pod 'RealmSwift', $realm_swift_version
  pod 'KeychainAccess'
  pod 'IQKeyboardManagerSwift', '~> 6.5.6'
  pod 'netfox' #Network Debuging
  pod 'Starscream', '3.1.1'
  pod 'SwiftLint', '0.43.1'
  pod 'Swinject', '2.8.0'
end

target 'KerjaCustomer' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for KerjaCustomer
	user_interface
 	utilities

end
