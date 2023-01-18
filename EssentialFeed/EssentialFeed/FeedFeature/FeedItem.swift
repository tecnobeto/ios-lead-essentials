//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Humberto Castro on 27/12/22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
