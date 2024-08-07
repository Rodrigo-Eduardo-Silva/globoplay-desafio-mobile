import Foundation
import UIKit

struct TrendingResultMovie: Decodable {
    let page: Int
    let results: [TrendingItemMovie]
    let total_pages: Int
    let total_results: Int
}

struct TrendingItemMovie: Decodable, Identifiable {
    let id: Int
    let poster_path: String
    let title: String
    let overview: String
}

struct TrendingResultTv: Decodable {
    let page: Int
    let results: [TrendingItemTv]
    let total_pages: Int
    let total_results: Int
}

struct TrendingItemTv: Decodable, Identifiable {
    let id: Int
    let poster_path: String
    let name: String
    let overview: String
}
