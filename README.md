InnerShadowTextFieldCell
========================

A subclass of NSTextFieldCell that draws an inner shadow. Implemented using the advice from, http://stackoverflow.com/questions/20928743/cocoa-how-to-draw-inset-text-as-in-mail-app

![alt tag](http://i.imgur.com/3VKnRQo.png)

Usage
-----

1. Drag a label on to you NSView.
2. Set the font, text colour and background colour to appropriate values.
3. Change the class of the NSTextField's cell from NSTextFieldCell to InnerShadowTextFieldCell. You can do this in the 'custom class' inspector in IB.

Note that the drawing method of the class comes with some default values so you don't need to provide a NSShadow type. The default is to draw a light grey shadow as in the image above. If you want more customisation then you can supply a NSShadow by using the -innerShadow property.
