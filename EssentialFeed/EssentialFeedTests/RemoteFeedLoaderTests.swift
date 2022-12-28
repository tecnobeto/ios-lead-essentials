//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Humberto Castro on 27/12/22.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() throws {
        let client = HTTPClient()
        let sut = RemoteFeedLoader()
        
        
        
        XCTAssertNil(client.requestedURL)
    }
}
