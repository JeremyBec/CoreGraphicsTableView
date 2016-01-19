#import "CustomCellBackground.h"
#import "Common.h"

@implementation CustomCellBackground


- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    UIColor * separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.0];
    
    drawLinearGradient(context, self.bounds, whiteColor.CGColor, lightGrayColor.CGColor);
    
    // Set a darkerColor if the user selects a cell
    if (self.selected) {
        drawLinearGradient(context, self.bounds, lightGrayColor.CGColor, separatorColor.CGColor);
    } else {
        drawLinearGradient(context, self.bounds, whiteColor.CGColor, lightGrayColor.CGColor);
    }
    
    // Create a rect with the size of the view
    CGRect strokeRect = self.bounds;
    
    // Reduce the height by 1 so it has a margin with other cells
    strokeRect.size.height -= 1;
    
    // Return a rect with custom values to prevent anti aliasing
    // x starts at +0,5 and y at 0,5;
    strokeRect = rectFor1PxStroke(strokeRect);
    
    // Paint and render our rect
    CGContextSetStrokeColorWithColor(context, whiteColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, strokeRect);
    
    CGPoint startPoint = CGPointMake(self.bounds.origin.x, self.bounds.origin.y + self.bounds.size.height -1);
    CGPoint endPoint = CGPointMake(self.bounds.origin.x + self.bounds.size.width - 1, self.bounds.origin.y + self.bounds.size.height -1);
    CGRect paperRect = self.bounds;
    
    if (!self.lastCell) {
        draw1PxStroke(context, startPoint, endPoint, separatorColor.CGColor);
    } else {
        CGContextSetStrokeColorWithColor(context, whiteColor.CGColor);
        CGContextSetLineWidth(context, 1.0);
        
        CGPoint pointA = CGPointMake(paperRect.origin.x, paperRect.origin.y + paperRect.size.height - 1);
        CGPoint pointB = CGPointMake(paperRect.origin.x, paperRect.origin.y);
        CGPoint pointC = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y);
        CGPoint pointD = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y + paperRect.size.height - 1);
        
        draw1PxStroke(context, pointA, pointB, whiteColor.CGColor);
        draw1PxStroke(context, pointB, pointC, whiteColor.CGColor);
        draw1PxStroke(context, pointC, pointD, whiteColor.CGColor);
    }
    
}


@end
