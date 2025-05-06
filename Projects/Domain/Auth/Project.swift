import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.Auth.rawValue,
    targets: [
        .interface(
            module: .domain(.Auth),
            dependencies: [
                .domain(target: .BaseDomain, type: .interface),
            ]
        ),
        .implements(
            module: .domain(.Auth),
            dependencies: [
                .domain(target: .Auth, type: .interface),
                .domain(target: .BaseDomain),
                .SPM.kakaoSDK
            ]
        ),
        .testing(
            module: .domain(.Auth),
            dependencies: [
                .domain(target: .Auth, type: .interface)
            ]
        ),
        .tests(
            module: .domain(.Auth),
            dependencies: [
                .domain(target: .Auth)
            ]
        )
    ]
)
