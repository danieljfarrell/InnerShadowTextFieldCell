//
//  InnerShadowTextFieldCell.m
//  InnerShadowThings
//
//  Created by Daniel Farrell on 19/01/2014.
//  Copyright (c) 2014 d. All rights reserved.
//

#import "InnerShadowTextFieldCell.h"
#import "BezierConversions.h"

@implementation InnerShadowTextFieldCell


- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    /* For some reason our method doesn't draw exactly the same path as the 
     superview so let's not use the superview to draw the background etc, 
     we will do that here. This will probably cause problems for more 
     complicated use of this cell, but probably fine for just labels.*/
    //[super drawInteriorWithFrame:cellFrame inView:controlView];
    
    //// Shadow Declarations
    if (_innerShadow == nil) {
        // Inner shadow has not been set, override here with default shadow.
        _innerShadow = [[NSShadow alloc] init];
        [_innerShadow setShadowColor: [NSColor darkGrayColor]];
        [_innerShadow setShadowOffset: NSMakeSize(0.1, 0.1)];
        // Trying to find a default shadow radius which will look good for
        // a label of any size, let's get a rough estimate based on the
        // hypotenuse of the cell frame.
        [_innerShadow setShadowBlurRadius: 0.0075 * hypot(NSWidth(cellFrame), NSHeight(cellFrame)) ];
    }
    
    //// Do the job of the superview here
    [self.backgroundColor setFill];
    NSRectFill(cellFrame);

    ///// And again
    NSBezierPath *bezierPath = [self.title bezierWithFont:self.font];
    [self.textColor setFill];
    [bezierPath fill];
    
    
    ////// Bezier Inner Shadow method from Paint Code
    NSShadow *shadow = _innerShadow;
    NSRect bezierBorderRect = NSInsetRect([bezierPath bounds], -shadow.shadowBlurRadius, -shadow.shadowBlurRadius);
    bezierBorderRect = NSOffsetRect(bezierBorderRect, -shadow.shadowOffset.width, shadow.shadowOffset.height);
    bezierBorderRect = NSInsetRect(NSUnionRect(bezierBorderRect, [bezierPath bounds]), -1, -1);
    
    NSBezierPath* bezierNegativePath = [NSBezierPath bezierPathWithRect: bezierBorderRect];
    [bezierNegativePath appendBezierPath: bezierPath];
    [bezierNegativePath setWindingRule: NSEvenOddWindingRule];
    
    [NSGraphicsContext saveGraphicsState];
    {
        NSShadow* shadowWithOffset = [shadow copy];
        CGFloat xOffset = shadowWithOffset.shadowOffset.width + round(bezierBorderRect.size.width);
        CGFloat yOffset = shadowWithOffset.shadowOffset.height;
        shadowWithOffset.shadowOffset = NSMakeSize(xOffset + copysign(0.0, xOffset), yOffset + copysign(0.1, yOffset));
        [shadowWithOffset set];
        [[NSColor grayColor] setFill];
        [bezierPath addClip];
        NSAffineTransform* transform = [NSAffineTransform transform];
        [transform translateXBy: -round(bezierBorderRect.size.width) yBy: 0];
        [[transform transformBezierPath: bezierNegativePath] fill];
    }
    [NSGraphicsContext restoreGraphicsState];
    
    
}


@end
