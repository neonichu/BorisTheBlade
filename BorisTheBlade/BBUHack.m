//
//  BBUHack.m
//  BorisTheBlade
//
//  Created by Boris Bügling on 05/07/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <objc/runtime.h>

void SwizzleSomeStuff() {
    NSLog(@"Dropping close to the metal...");

    Class c = objc_getClass("IDESourceCodeDocument");

    IMP myIMP = imp_implementationWithBlock(^(id sself, id arg0) {
    });

    Method m = class_getInstanceMethod(c, NSSelectorFromString(@"setLanguage:"));
    assert(m);
    method_setImplementation(m, myIMP);

    c = objc_getClass("IDEDocumentController");

    myIMP = imp_implementationWithBlock(^(id sself) {
        return [NSDocumentController sharedDocumentController];
    });

    m = class_getClassMethod(c, @selector(sharedDocumentController));
    assert(m);
    method_setImplementation(m, myIMP);

    c = objc_getClass("IDESourceCodeEditor");

    myIMP = imp_implementationWithBlock(^(id sself) {
    });

    m = class_getInstanceMethod(c, NSSelectorFromString(@"_applyPerFileTextSettings"));
    assert(m);
    method_setImplementation(m, myIMP);

    c = objc_getClass("IDEPlaygroundEditor");

    myIMP = imp_implementationWithBlock(^(id self) {
        return nil;
    });

    m = class_getInstanceMethod(c, NSSelectorFromString(@"languageService"));
    assert(m);
    method_setImplementation(m, myIMP);
}
