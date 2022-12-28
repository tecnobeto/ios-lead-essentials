//
//  LoginUseCaseFactory.swift
//  CleanArchitectureComposition
//
//  Created by Humberto Castro on 11/12/2022.
//

import Foundation

final class LoginUseCaseFactory {
    func makeUseCase() -> LoginUseCase {
        return LoginUseCase(
            output: LoginUseCaseOutputComposer([
                LoginPresenter(),
                CrashlyticsLoginTracker(),
                FirebaseLoginTracker()
            ])
        )
    }
}
