// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localizable {
  /// OK
  internal static let alertAction = Localizable.tr("Localizable", "alert_action", fallback: "OK")
  /// The user is registered with this email
  internal static let alertText = Localizable.tr("Localizable", "alert_text", fallback: "The user is registered with this email")
  /// This account is not registered
  internal static let alertTextAuthotorization = Localizable.tr("Localizable", "alert_text_authotorization", fallback: "This account is not registered")
  /// Notification
  internal static let alertTitle = Localizable.tr("Localizable", "alert_title", fallback: "Notification")
  /// e-mail
  internal static let emailText = Localizable.tr("Localizable", "email_text", fallback: "e-mail")
  /// Enter
  internal static let enterTitle = Localizable.tr("Localizable", "enter_title", fallback: "Enter")
  /// example@example.ru
  internal static let mailExample = Localizable.tr("Localizable", "mail_example", fallback: "example@example.ru")
  /// Password
  internal static let password = Localizable.tr("Localizable", "password", fallback: "Password")
  /// ******
  internal static let passwordMask = Localizable.tr("Localizable", "password_mask", fallback: "******")
  /// Registration
  internal static let registrationTitle = Localizable.tr("Localizable", "registration_title", fallback: "Registration")
  /// Repeat password
  internal static let repeatPassword = Localizable.tr("Localizable", "repeat_password", fallback: "Repeat password")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localizable {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
