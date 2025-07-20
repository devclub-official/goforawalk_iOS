import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.RecordFeature.rawValue,
    targets: [
        .interface(
            module: .feature(.RecordFeature)
        ),
        .implements(
            module: .feature(.RecordFeature),
            dependencies: [
                .feature(target: .RecordFeature, type: .interface)
            ]
        ),
        .testing(
            module: .feature(.RecordFeature),
            dependencies: [
                .feature(target: .RecordFeature, type: .interface)
            ]
        ),
        .tests(
            module: .feature(.RecordFeature),
            dependencies: [
                .feature(target: .RecordFeature)
            ]
        ),
        .demo(
            module: .feature(.RecordFeature),
            dependencies: [
                .feature(target: .RecordFeature)
            ]
        )
    ]
)
