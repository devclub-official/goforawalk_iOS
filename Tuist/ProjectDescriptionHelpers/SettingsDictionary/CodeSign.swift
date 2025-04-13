import ProjectDescription

public extension SettingsDictionary {
    static let codeSign = SettingsDictionary()
        .codeSignIdentityAppleDevelopment()
        .automaticCodeSigning(devTeam: "fover32@gmail.com")
}
