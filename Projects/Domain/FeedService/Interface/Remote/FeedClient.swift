//
//  FeedClient.swift
//  FeedServiceInterface
//
//  Created by Kyeongmo Yang on 6/10/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import Foundation

public struct FeedClient {
    public var fetchFootsteps: @Sendable () async throws -> [Footstep]
    
    public init(
        fetchFootsteps: @escaping @Sendable () async throws -> [Footstep]
    ) {
        self.fetchFootsteps = fetchFootsteps
    }
}
