//
//  BaseViewModel.swift
//  SehatQ
//  Copyright © 2019 PT SehatQ Harsana Emedika. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel: NSObject {
    var disposeBag = DisposeBag()
    var state = BehaviorRelay<LoadingState>(value: .notLoad)
    var errorModelObservable = BehaviorRelay<ResponseErrorModel?>(value: nil)
    
    var errorModel: ResponseErrorModel? {
        get { return errorModelObservable.value }
        set { errorModelObservable.accept(newValue) }
    }
    
    func handleNetworkError(_ error: Error) {
        if let errorResponseModel = error as? ResponseErrorModel {
            self.errorModel = errorResponseModel
        } else {
//            self.errorModel = ResponseErrorModel(systemError: error)
        }
    }
    
    deinit {
//        SQLogger.log("Deinit \(type(of: self))")
    }
}

enum LoadingState : Int {
    case notLoad
    case loading
    case finished
    case failed
}

struct ResponseErrorModel: Codable, Error {
    var title: String?
    var detail: String?
    var errorImageUrl: String?
    var status: NSNumber?
    var code: String?
    var field: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case detail
        case code
        case field
    }
}
