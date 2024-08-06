import Foundation
import UIKit

struct TrendingResult: Decodable {
    let page: Int
    let results: [TrendingItem]
    let total_pages: Int
    let total_results: Int
}

struct TrendingItem: Decodable, Identifiable {
    let id: Int
    let poster_path: String
    //let title: String
}
