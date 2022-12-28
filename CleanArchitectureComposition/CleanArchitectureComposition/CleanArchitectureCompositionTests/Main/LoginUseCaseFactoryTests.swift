//
//  LoginUseCaseFactoryTests.swift
//  CleanArchitectureCompositionTests
//
//  Created by Humberto Castro on 11/12/2022.
//


import XCTest
@testable import CleanArchitectureComposition

final class LoginUseCaseFactoryTests: XCTestCase {
    func test_createdUseCase_hasComposedOutputs() {
        let sut = LoginUseCaseFactory()
        let useCase = sut.makeUseCase()
        let composer = useCase.output as? LoginUseCaseOutputComposer
        
        XCTAssertNotNil(composer)
        XCTAssertEqual(composer?.outputs.count, 3)
        XCTAssertEqual(composer?.count(ofType: LoginPresenter.self), 1)
        XCTAssertEqual(composer?.count(ofType: CrashlyticsLoginTracker.self), 1)
        XCTAssertEqual(composer?.count(ofType: FirebaseLoginTracker.self), 1)
    }
}

private extension LoginUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int {
        return outputs.filter {$0 is T}.count
    }
}
