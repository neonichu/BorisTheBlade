/*
 *     Generated by class-dump 3.3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2011 by Steve Nygard.
 */

#import "IDESourceCodeEditor.h"

@class DVTMapTable, DVTObservingToken, IDEPlaygroundDocument, NSArray, NSCountedSet, NSMutableArray, NSMutableSet, NSSet;

@interface IDEPlaygroundEditor : IDESourceCodeEditor

@property(readonly, copy) NSArray *playgroundSectionViewControllers;
@property(readonly) IDEPlaygroundDocument *document;
@property(retain) NSMutableSet *mutableToysSelectedInRegisteredToyboxes;
@property(readonly, copy) NSSet *toysSelectedInRegisteredToyboxes;

- (void)presentError:(id)arg1 delegate:(id)arg2 didPresentSelector:(SEL)arg3 contextInfo:(void *)arg4;
- (void)executePlaygroundFromSerializedData;
- (void)execute:(id)arg1;
- (void)executePlayground;
- (void)schedulePlaygroundExecution;
- (void)schedulePlaygroundExecutionWithDelay:(double)arg1;
- (void)textViewDidChangeSelection:(id)arg1;
- (void)textDidChange:(id)arg1;
- (BOOL)textView:(id)arg1 shouldChangeTextInRange:(struct _NSRange)arg2 replacementString:(id)arg3;
- (struct _NSRange)textView:(id)arg1 willChangeSelectionFromCharacterRange:(struct _NSRange)arg2 toCharacterRange:(struct _NSRange)arg3;
- (id)annotationContextForTextView:(id)arg1;
- (id)completingTextView:(id)arg1 documentLocationForWordStartLocation:(unsigned long long)arg2;
- (void)completingTextView:(id)arg1 willPassContextToStrategies:(id)arg2 atWordStartLocation:(unsigned long long)arg3;
- (id)sdk;
- (id)languageService;
- (void)navigateToAnnotationWithRepresentedObject:(id)arg1 wantsIndicatorAnimation:(BOOL)arg2 exploreAnnotationRepresentedObject:(id)arg3;
- (id)currentSelectedDocumentLocations;
- (void)unregisterToyboxEditor:(id)arg1;
- (void)registerToyboxEditor:(id)arg1;
- (void)primitiveInvalidate;
- (void)didSetupEditor;
- (void)loadView;
- (id)initWithNibName:(id)arg1 bundle:(id)arg2 document:(id)arg3;

@end

