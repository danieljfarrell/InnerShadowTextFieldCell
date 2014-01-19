//
//  AppDelegate.m
//  InnerShadowThings
//
//  Created by Daniel Farrell on 19/01/2014.
//  Copyright (c) 2014 d. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSView *view = _window.contentView;
    view.wantsLayer = YES; // Yes, I know this is the wrong way, but it doesn't matter for this example.
    view.layer.backgroundColor = [[NSColor whiteColor] CGColor];
}

@end
