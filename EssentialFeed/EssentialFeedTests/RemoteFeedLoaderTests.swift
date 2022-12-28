//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Humberto Castro on 27/12/22.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "htttps://a-url.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init () {}
    
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() throws {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
