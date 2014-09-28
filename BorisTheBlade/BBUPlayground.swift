//
//  BBUPlayground.swift
//  BorisTheBlade
//
//  Created by Boris Bügling on 05/07/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

import Cocoa

let xcodePath = "/Applications/Xcode.app/"

public class BBUPlayground {
    public class func playgroundEditorForDocumentAtURL(url : NSURL) -> NSViewController {
        dlopen(xcodePath + "Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/DVTFoundation", RTLD_NOW)
        dlopen(xcodePath + "Contents/Frameworks/IDEKit.framework/Versions/A/IDEKit", RTLD_NOW)

        var errorPtr : NSErrorPointer = nil

        var languageSupportUIPlugin = NSBundle(path:xcodePath + "Contents/PlugIns/IDELanguageSupportUI.ideplugin")
        var result = languageSupportUIPlugin!.loadAndReturnError(errorPtr)

        if !result {
            println(errorPtr.memory)
        }

        var languageSupportPlugin = NSBundle(path:xcodePath + "Contents/PlugIns/IDELanguageSupportCore.ideplugin")
        result = languageSupportPlugin!.loadAndReturnError(errorPtr)

        if !result && errorPtr != nil {
            println(errorPtr.memory)
        }

        var sourceEditorPlugin = NSBundle(path:xcodePath + "Contents/PlugIns/IDESourceEditor.ideplugin")
        result = sourceEditorPlugin!.loadAndReturnError(errorPtr)

        if !result && errorPtr != nil {
            println(errorPtr.memory)
        }

        SwizzleSomeStuff();

        /*let className6 = "DVTFilePath" as CString
        let classObject6 = objc_lookUpClass(className6)! as NSObject.Type
        var filePath : AnyObject = classObject6.filePathForPathString(xcodePath)*/

        // /var/folders/by/znchwbl51gdfht48wv0m4t6r0000gn/C/com.apple.DeveloperTools/6.0-6A216f
        let className5 = "DVTDeveloperPaths".cStringUsingEncoding(NSUTF8StringEncoding)
        let classObject5 = objc_lookUpClass(className5!)! as NSObject.Type
        classObject5.initializeApplicationDirectoryName("../../../../../../../.." + xcodePath) // yes, really.

        let className7 = "DVTSourceSpecification".cStringUsingEncoding(NSUTF8StringEncoding)
        let classObject7 = objc_lookUpClass(className7!)! as NSObject.Type
        classObject7.searchForAndRegisterAllAvailableSpecifications()

        let className4 = "DVTPlugInManager".cStringUsingEncoding(NSUTF8StringEncoding)
        let classObject4 = objc_lookUpClass(className4!)! as NSObject.Type

        let manager = classObject4.defaultPlugInManager()
        /*let directories = [ xcodePath + "Contents/PlugIns" ]
        var scanResults : AnyObject = manager._scanForPlugInsInDirectories(directories, skippingDuplicatesOfPlugIns:[] as NSArray)
        println(scanResults)
        manager._registerPlugInsFromScanRecords(scanResults)*/
        result = manager.scanForPlugIns(errorPtr)

        if !result {
            println(errorPtr.memory)
        }

        let className3 = "IDEToyboxDomainItem".cStringUsingEncoding(NSUTF8StringEncoding)
        let classObject3 = objc_lookUpClass(className3!)! as NSObject.Type
        let type = classObject3.fileDataType() as NSObject

        let className = "IDEPlaygroundDocument".cStringUsingEncoding(NSUTF8StringEncoding)
        let classObject = objc_lookUpClass(className!)! as NSDocument.Type

        var document = classObject(contentsOfURL:url, ofType:"com.apple.dt.playground", error:errorPtr) as NSDocument!

        if document == nil {
            println(url)
            println(errorPtr.memory)
        }

        var handle = dlopen(xcodePath + "Contents/PlugIns/IDELanguageSupportUI.ideplugin/Contents/MacOS/IDELanguageSupportUI", RTLD_NOW)

        let className2 = "IDEPlaygroundEditor".cStringUsingEncoding(NSUTF8StringEncoding)
        println(objc_lookUpClass(className2!))
        let classObject2 = objc_lookUpClass(className2!)! as NSViewController.Type
        println(handle)

        return classObject2(nibName:nil, bundle:nil, document:document)
    }
}
