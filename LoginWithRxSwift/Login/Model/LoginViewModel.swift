//
//  LoginViewModel.swift
//  LoginWithRxSwift
//
//  Created by Alan Silva on 02/11/20.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    
    let usernameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
     
        return Observable.combineLatest(usernameTextPublishSubject.asObservable().startWith(""), passwordTextPublishSubject.asObservable().startWith("")).map { username, password in
            
            return username.count > 3 && password.count > 3
            
        }.startWith(false)
        
    }
    
}
