//
//  AppDelegate.swift
//  Playground Sample
//
//  Created by Boris Bügling on 05/07/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

import BorisTheBlade
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var playgroundController : NSViewController!

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        let playgroundUrl = NSBundle.mainBundle().URLForResource("Hello", withExtension:"playground")
        
        self.playgroundController = BBUPlayground.playgroundEditorForDocumentAtURL(playgroundUrl!)
        println(self.playgroundController)

        var window = NSApplication.sharedApplication().windows[0] as NSWindow
        window.contentView = self.playgroundController.view
    }
}

