//
//  ProfileClient.swift
//  UserService
//
//  Created by Kyeongmo Yang on 6/24/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import Foundation

public struct ProfileClient {
    public var fetchProfile: @Sendable () async throws -> Profile
    
    public init(fetchProfile: @escaping @Sendable () async throws -> Profile) {
        self.fetchProfile = fetchProfile
    }
}
