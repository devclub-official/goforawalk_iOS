import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let tca = TargetDependency.external(name: "swift-composable-architecture")
}

public extension Package {
}
