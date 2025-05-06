import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    targets: [
        .interface(
            module: .domain(.BaseDomain),
            dependencies: [
                .core(target: .Network, type: .interface),
                .shared(target: .GlobalThirdPartyLibrary)
            ]
        ),
        .implements(
            module: .domain(.BaseDomain),
            dependencies: [
                .domain(target: .BaseDomain, type: .interface),
                .core(target: .Network),
                .shared(target: .Util),
                .shared(target: .GlobalThirdPartyLibrary)
            ]
        ),
        .tests(
            module: .domain(.BaseDomain),
            dependencies: [
                .domain(target: .BaseDomain, type: .interface)
            ]
        )
    ]
)
