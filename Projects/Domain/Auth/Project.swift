import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.Auth.rawValue,
    targets: [
        .interface(
            module: .domain(.Auth),
            dependencies: [
                .core(target: .Network, type: .interface),
                .shared(target: .GlobalThirdPartyLibrary, type: .sources)
            ]
        ),
        .implements(
            module: .domain(.Auth),
            dependencies: [
                .domain(target: .Auth, type: .interface)
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
