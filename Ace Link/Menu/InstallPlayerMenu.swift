import os
import Cocoa
import Foundation


class InstallPlayerMenu {
    let downloadURL = "https://dl-portal.iina.io/IINA.v1.1.2.dmg"

    let statusItem = NSMenuItem(
        title: "IINA is not installed",
        action: nil,
        keyEquivalent: ""
    )

    let installItem = NSMenuItem(
        title: "Download & install IINA manually…",
        action: #selector(install(_:)),
        keyEquivalent: ""
    )

    let separatorItem = NSMenuItem.separator()

    init() {
        statusItem.isEnabled = false
        installItem.target = self
    }

    @objc func install(_ sender: NSMenuItem?) {
        NSWorkspace.shared.open(
            URL(string: downloadURL)!
        )
    }

    func addItems(_ menu: NSMenu) {
        menu.addItem(statusItem)
        menu.addItem(installItem)
        menu.addItem(separatorItem)
    }

    func updateItems(dependenciesInstalled: Bool) {
        statusItem.isHidden = dependenciesInstalled
        installItem.isHidden = dependenciesInstalled
        separatorItem.isHidden = dependenciesInstalled
    }
}
