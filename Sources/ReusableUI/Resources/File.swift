import AppKit

@available(macOS 10.13, *)
extension NSColor {
    static var someBeautifulColor: NSColor {
        NSColor(named: "defaultColor", bundle: .module)!
    }
}
