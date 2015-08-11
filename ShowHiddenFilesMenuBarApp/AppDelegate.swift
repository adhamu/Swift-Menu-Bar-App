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

    @IBAction func toggleHiddenFiles(sender: NSMenuItem) {
        let task = NSTask()
        task.launchPath = systemDefaultLaunchPath
        
        if(sender.state == NSOnState) {
            sender.state = NSOffState
            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "NO"]
        }
        else {
            sender.state = NSOnState
            task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "YES"]
        }
        
        task.launch()
        task.waitUntilExit()
        
        let killtask = NSTask()
        killtask.launchPath = systemKillPath
        killtask.arguments = ["Finder"]
        killtask.launch()
    }
    
    @IBAction func toggleStatusBar(sender: NSMenuItem) {
        let task = NSTask()
        task.launchPath = systemDefaultLaunchPath
        
        if(sender.state == NSOnState) {
            sender.state = NSOffState
            task.arguments = ["write", "com.apple.finder", "ShowStatusBar", "NO"]
        }
        else {
            sender.state = NSOnState
            task.arguments = ["write", "com.apple.finder", "ShowStatusBar", "YES"]
        }
        
        task.launch()
        
        let killtask = NSTask()
        killtask.launchPath = systemKillPath
        killtask.arguments = ["Finder"]
        killtask.launch()
    }
    
    @IBAction func togglePathBar(sender: NSMenuItem) {
        let task = NSTask()
        task.launchPath = systemDefaultLaunchPath
        
        if(sender.state == NSOnState) {
            sender.state = NSOffState
            task.arguments = ["write", "com.apple.finder", "ShowPathbar", "NO"]
        }
        else {
            sender.state = NSOnState
            task.arguments = ["write", "com.apple.finder", "ShowPathbar", "YES"]
        }
        
        task.launch()
        task.waitUntilExit()
        
        let killtask = NSTask()
        killtask.launchPath = systemKillPath
        killtask.arguments = ["Finder"]
        killtask.launch()
    }
    @IBAction func toggleDesktopIcons(sender: NSMenuItem) {
        let task = NSTask()
        task.launchPath = systemDefaultLaunchPath
        
        if(sender.state == NSOnState) {
            sender.state = NSOffState
            task.arguments = ["write", "com.apple.finder", "CreateDesktop", "NO"]
        }
        else {
            sender.state = NSOnState
            task.arguments = ["write", "com.apple.finder", "CreateDesktop", "YES"]
        }
        
        task.launch()
        task.waitUntilExit()
        
        let killtask = NSTask()
        killtask.launchPath = systemKillPath
        killtask.arguments = ["Finder"]
        killtask.launch()
    }
    
    @IBAction func quitApp(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
}

