//
//  AppDelegate.swift
//  ShowHiddenFilesMenuBarApp
//
//  Created by Amit on 06/08/2015.
//  Copyright (c) 2015 Amit. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var statusMenu: NSMenu!

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    let systemDefaultLaunchPath = "/usr/bin/defaults"
    let systemKillPath = "/usr/bin/killall"

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "statusIcon")
        icon?.setTemplate(true)
        
        statusItem.image = icon
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        
    }
    
    func kill(task: NSString) {
        let killtask = NSTask()
        killtask.launchPath = systemKillPath
        killtask.arguments = [task]
        killtask.launch()
    }
    
    func executeCommand(s: NSMenuItem, package: NSString, method: NSString) {
        let task = NSTask()
        task.launchPath = systemDefaultLaunchPath
        
        if(s.state == NSOnState) {
            s.state = NSOffState
            task.arguments = ["write", package, method, "NO"]
        }
        else {
            s.state = NSOnState
            task.arguments = ["write", package, method, "YES"]
        }
        
        task.launch()
        task.waitUntilExit()
    }
    
    /* Event Listeners */
    @IBAction func toggleHiddenFiles(sender: NSMenuItem) {
        executeCommand(sender, package: "com.apple.finder", method: "AppleShowAllFiles")
        kill("Finder")
    }
    
    @IBAction func toggleStatusBar(sender: NSMenuItem) {
        executeCommand(sender, package: "com.apple.finder", method: "ShowStatusBar")
        kill("Finder")
    }
    
    @IBAction func togglePathBar(sender: NSMenuItem) {
        executeCommand(sender, package: "com.apple.finder", method: "ShowPathbar")
        kill("Finder")
    }
    @IBAction func toggleDesktopIcons(sender: NSMenuItem) {
        executeCommand(sender, package: "com.apple.finder", method: "CreateDesktop")
        kill("Finder")
    }
    
    @IBAction func quitApp(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
}

