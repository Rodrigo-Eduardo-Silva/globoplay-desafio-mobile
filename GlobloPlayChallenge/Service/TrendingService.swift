import Foundation
import UIKit

class TrendingService {
    let network: Network
    var trending:[TrendingItem] = []
    var trendingTv:[TrendingItem] = []
    var pageTrend: TrendingResult?
    init(network: Network) {
        self.network = network
    }

    func loadTrending () async throws {
        let request = RequestModel.Builder()
            .with(baseURL: Server.baseURLMovie)
            .with(method: .get)
            .with(addHeaderName: "Authorization", value: "Bearer " + Server.key)
            .with(addHeaderName: "Content-Type", value: "Content-Type")
            .build()
        
            let result = try await network.request(request: request, returning: TrendingResult.self)
            trending = result.results

    }

    func loadTrendingTv () async throws {
        let request = RequestModel.Builder()
            .with(baseURL: Server.baseURLTv)
            .with(method: .get)
            .with(addHeaderName: "Authorization", value: "Bearer " + Server.key)
            .with(addHeaderName: "Content-Type", value: "Content-Type")
            .build()

            let result = try await network.request(request: request, returning: TrendingResult.self)
            trendingTv = result.results
    }



}
