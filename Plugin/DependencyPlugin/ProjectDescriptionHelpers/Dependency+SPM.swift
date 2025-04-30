import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let kakaoSDK = TargetDependency.external(name: "KakaoSDK")
    static let tca = TargetDependency.external(name: "ComposableArchitecture")
}

public extension Package {
}
