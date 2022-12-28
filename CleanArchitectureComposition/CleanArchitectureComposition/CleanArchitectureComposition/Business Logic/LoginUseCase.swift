//
//  LoginUseCase.swift
//  CleanArchitectureComposition
//
//  Created by Humberto Castro on 11/12/2022.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSuceeded()
    func loginFailed()
}

class LoginUseCase {
    let output: LoginUseCaseOutput
    
    init(output: LoginUseCaseOutput) {
        self.output = output
    }
    
    func login(name: String, password: String) {
        output.loginSuceeded()
    }
}
