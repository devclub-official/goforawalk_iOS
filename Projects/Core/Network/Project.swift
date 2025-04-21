import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Core.Network.rawValue,
    targets: [
        .interface(
            module: .core(.Network),
            dependencies: [
                .shared(target: .Util, type: .sources)
            ]
                  ),
        .implements(module: .core(.Network), dependencies: [
            .core(target: .Network, type: .interface)
        ]),
        .testing(module: .core(.Network), dependencies: [
            .core(target: .Network, type: .interface)
        ]),
        .tests(module: .core(.Network), dependencies: [
            .core(target: .Network)
        ])
    ]
)
