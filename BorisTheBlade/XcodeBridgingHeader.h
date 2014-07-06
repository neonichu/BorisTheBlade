//
//  XcodeBridgingHeader.h
//  BorisTheBlade
//
//  Created by Boris Bügling on 05/07/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import "DVTPlugInManager.h"
#import "IDEPlaygroundDocument.h"
#import "IDEPlaygroundEditor.h"

extern void SwizzleSomeStuff();

@interface NSDocument (Bullshit)

- (id)initWithContentsOfURL:(NSURL*)arg1 ofType:(NSObject*)arg2 error:(NSError**)arg3;

@end

@interface NSViewController (Bullshit)

- (id)initWithNibName:(id)arg1 bundle:(id)arg2 document:(id)arg3;

@end

@interface NSObject (Bullshit)

+ (id)fileDataType;
+ (id)filePathForPathString:(id)arg1;
+ (void)initializeApplicationDirectoryName:(id)arg1;

+ (NSObject*)defaultPlugInManager;
- (void)_registerPlugInsFromScanRecords:(id)arg1;
- (BOOL)scanForPlugIns:(NSError**)arg1;
- (id)_scanForPlugInsInDirectories:(id)arg1 skippingDuplicatesOfPlugIns:(id)arg2;
- (id)_scanRecordForBundle:(id)arg1 atPath:(id)arg2;

+ (void)searchForAndRegisterAllAvailableSpecifications;

@end
