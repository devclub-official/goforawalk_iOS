//
//  FeedEndpoint.swift
//  FeedService
//
//  Created by Kyeongmo Yang on 6/9/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import Auth
import Foundation
import NetworkInterface

public struct FeedEndpoint {
    public static func fetchFootsteps() -> EndPoint<FetchFootstepsResponseDTO> {
        return EndPoint(
            path: "footsteps",
            httpMethod: .get,
            headers: ["Authorization": "Bearer \(LocalAuthStoreImpl().loadToken().accessToken)"]
        )
    }
}
