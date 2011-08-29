//
//  CustomView.m
//  NSStatusItemTest
//
//  Created by Matt Gemmell on 04/03/2008.
//  Copyright 2008 Magic Aubergine. All rights reserved.
//

#import "CustomView.h"
#import "AppController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "ASINetworkQueue.h"
#import "ASIDownloadCache.h"
#import "ASIWebPageRequest.h"

@implementation CustomView


- (id)initWithFrame:(NSRect)frame controller:(AppController *)ctrlr
{
    if (self = [super initWithFrame:frame]) {
      controller = ctrlr; // deliberately weak reference.
      [self registerForDraggedTypes:[NSArray arrayWithObject:NSFilenamesPboardType]];
    }
    
    return self;
}


- (void)dealloc
{
    controller = nil;
    [super dealloc];
}


- (void)drawRect:(NSRect)rect {
    // Draw background if appropriate.
    if (clicked) {
        [[NSColor selectedMenuItemColor] set];
        NSRectFill(rect);
    }
    
    // Draw some text, just to show how it's done.
    NSString *text = @"3"; // whatever you want
    
    NSColor *textColor = [NSColor controlTextColor];
    if (clicked) {
        textColor = [NSColor selectedMenuItemTextColor];
    }
    
    NSFont *msgFont = [NSFont menuBarFontOfSize:15.0];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    [paraStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
    [paraStyle setAlignment:NSCenterTextAlignment];
    [paraStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    NSMutableDictionary *msgAttrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     msgFont, NSFontAttributeName,
                                     textColor, NSForegroundColorAttributeName,
                                     paraStyle, NSParagraphStyleAttributeName,
                                     nil];
    [paraStyle release];
    
    NSSize msgSize = [text sizeWithAttributes:msgAttrs];
    NSRect msgRect = NSMakeRect(0, 0, msgSize.width, msgSize.height);
    msgRect.origin.x = ([self frame].size.width - msgSize.width) / 2.0;
    msgRect.origin.y = ([self frame].size.height - msgSize.height) / 2.0;
    
    [text drawInRect:msgRect withAttributes:msgAttrs];
}


- (void)mouseDown:(NSEvent *)event
{
    NSRect frame = [[self window] frame];
    NSPoint pt = NSMakePoint(NSMidX(frame), NSMinY(frame));
    [controller toggleAttachedWindowAtPoint:pt];
    clicked = !clicked;
    [self setNeedsDisplay:YES];
}

-(NSDragOperation) draggingEntered: (id <NSDraggingInfo>) sender
{
  NSLog(@"Drag Enter");
  return NSDragOperationCopy;
}

-(NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender{
  return NSDragOperationCopy;
}

-(void)draggingExited:(id <NSDraggingInfo>)sender{
  NSLog(@"Drag Exit");
}

-(BOOL)prepareForDragOperation: (id <NSDraggingInfo> ) sender
{
  NSPasteboard *pboard = [sender draggingPasteboard];
  
  ASIHTTPRequest *request = [[[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:@"http://google.com"]] autorelease];
  [request setDelegate:self];
	[request startSynchronous];
	if ([request error]) {
		htmlSource = [[request error] localizedDescription];
	} else if ([request responseString]) {
		htmlSource = [request responseString];
	}
  
  NSLog(@"%@", htmlSource);
  
  if ([[pboard types] containsObject:NSFilenamesPboardType] ) 
  {
    
    NSArray *files = [pboard propertyListForType:NSFilenamesPboardType];
    
    NSAutoreleasePool *lpool = [[NSAutoreleasePool alloc] init];

    for (id file in files) 
    {
    }
    
    [lpool release]; 
  }
  
  
  return YES;
}


@end
