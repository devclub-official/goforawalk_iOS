import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.FeedService.rawValue,
    targets: [
        .interface(module: .domain(.FeedService)),
        .implements(module: .domain(.FeedService), dependencies: [
            .domain(target: .FeedService, type: .interface)
        ]),
        .testing(module: .domain(.FeedService), dependencies: [
            .domain(target: .FeedService, type: .interface)
        ]),
        .tests(module: .domain(.FeedService), dependencies: [
            .domain(target: .FeedService)
        ])
    ]
)
