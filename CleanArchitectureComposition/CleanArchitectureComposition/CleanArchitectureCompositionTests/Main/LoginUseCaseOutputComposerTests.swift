//
//  LoginUseCaseOutputComposerTests.swift
//  CleanArchitectureCompositionTests
//
//  Created by Humberto Castro on 11/12/2022.
//

import XCTest
@testable import CleanArchitectureComposition

final class LoginUseCaseOutputComposerTests: XCTestCase {
    func test_composingZeroOutputs_doesNotCrash() throws {
       let sut = LoginUseCaseOutputComposer([])
        
        sut.loginSuceeded()
        sut.loginFailed()
    }
    
    func test_composingMultipleOutput_delegatesSuceededMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginSuceeded()
        
        XCTAssertEqual(output1.loginSuceededCallCount, 1)
        XCTAssertEqual(output1.loginFailedCallCount, 0)
        
        XCTAssertEqual(output2.loginSuceededCallCount, 1)
        XCTAssertEqual(output2.loginFailedCallCount, 0)
    }
    
    func test_composingMultipleOutput_delegatesFailedMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginFailed()
        
        XCTAssertEqual(output1.loginSuceededCallCount, 0)
        XCTAssertEqual(output1.loginFailedCallCount, 1)
        
        XCTAssertEqual(output2.loginSuceededCallCount, 0)
        XCTAssertEqual(output2.loginFailedCallCount, 1)
    }
    
    
    
    private class LoginUseCaseOutputSpy: LoginUseCaseOutput {
        var loginSuceededCallCount = 0
        var loginFailedCallCount = 0
        
        func loginSuceeded() {
            loginSuceededCallCount += 1
        }
        
        func loginFailed() {
            loginFailedCallCount += 1
        }
        
        
    }
}
