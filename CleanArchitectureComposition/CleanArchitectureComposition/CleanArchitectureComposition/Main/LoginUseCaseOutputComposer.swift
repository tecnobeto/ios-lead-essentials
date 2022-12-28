//
//  LoginUseCaseOutputComposer.swift
//  CleanArchitectureComposition
//
//  Created by Humberto Castro on 11/12/2022.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    let outputs: [LoginUseCaseOutput]
    
    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }
    
    func loginSuceeded() {
        outputs.forEach { $0.loginSuceeded() }
    }
    
    func loginFailed() {
        outputs.forEach { $0.loginFailed() }
    }
}
