import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.Root.rawValue,
    targets: [
        .implements(
            module: .feature(.Root),
            dependencies: [
                .feature(target: .BaseFeature),
                .feature(target: .SignIn)
            ]
        ),
    ]
)
