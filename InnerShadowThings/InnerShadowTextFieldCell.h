//
//  InnerShadowTextFieldCell.h
//  InnerShadowThings
//
//  Created by Daniel Farrell on 19/01/2014.
//  Copyright (c) 2014 d. All rights reserved.
//

/* Implementation of the suggestion posted here,
 http://stackoverflow.com/questions/20928743/cocoa-how-to-draw-inset-text-as-in-mail-app
 
The method follows @indragie suggestion of using the NSString cateogory -bezierWithFont:, then
 I perform the innershadow using the same method as PaintCode. Then we implement the actual
 drawing using the suggestion of Wil Shipley (also in the same page linked to above).
 
 */

#import <Cocoa/Cocoa.h>

@interface InnerShadowTextFieldCell : NSTextFieldCell
@property (strong) NSShadow *innerShadow;
@end
