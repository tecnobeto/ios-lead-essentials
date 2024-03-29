//
//  FeedItemMapper.swift
//  EssentialFeed
//
//  Created by Humberto Castro on 19/01/23.
//

import Foundation

internal final class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [Item]
        var feed: [FeedItem] { items.map { $0.item } }
    }
    
    private static var OK_200: Int { return 200 }
    
    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        var item: FeedItem {
            return FeedItem(
                id: id,
                description: description,
                location: location,
                imageURL: image
            )
        }
    }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data)
        else {
            return .failure(.invalidData)
        }
        
        let items = root.items.map { $0.item }
        return .success(items)
    }
}
