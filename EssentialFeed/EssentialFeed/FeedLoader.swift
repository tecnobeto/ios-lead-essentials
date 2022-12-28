//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Humberto Castro on 27/12/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
