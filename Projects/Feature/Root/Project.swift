import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.Root.rawValue,
    targets: [
        .interface(module: .feature(.Root)),
        .implements(module: .feature(.Root), dependencies: [
            .feature(target: .Root, type: .interface)
        ])
    ]
)
