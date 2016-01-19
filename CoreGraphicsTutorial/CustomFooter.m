#import "CustomFooter.h"

@implementation CustomFooter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    UIColor * darkGrayColor = [UIColor colorWithRed:187.0/255.0 green:187.0/255.0 blue:187.0/255.0 alpha:1.0];
    UIColor * shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
    
    //CGFloat paperMargin = 9.0;
    // Size to match with header
    // Global paperRect so it can be use for arc and gradient
    CGRect paperRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width,  self.bounds.size.height);
    
    CGRect arcRect = paperRect;
    arcRect.size.height = 12;
    
    CGContextSaveGState(context);
    CGMutablePathRef arcPath = createArcPathFromBottomOfRect(arcRect, 6.0);
    CGContextAddPath(context, arcPath);
    CGContextClip(context);
    drawLinearGradient(context, paperRect, lightGrayColor.CGColor, darkGrayColor.CGColor);
    CGContextRestoreGState(context);
    
    // Prevent anti-aliasing
    CGContextSaveGState(context);
    CGPoint pointA = CGPointMake(arcRect.origin.x, arcRect.origin.y + arcRect.size.height - 1);
    CGPoint pointB = CGPointMake(arcRect.origin.x, arcRect.origin.y);
    CGPoint pointC = CGPointMake(arcRect.origin.x + arcRect.size.width - 1, arcRect.origin.y);
    CGPoint pointD = CGPointMake(arcRect.origin.x + arcRect.size.width - 1, arcRect.origin.y + arcRect.size.height - 1);
    draw1PxStroke(context, pointA, pointB, whiteColor.CGColor);
    draw1PxStroke(context, pointC, pointD, whiteColor.CGColor);
    CGContextRestoreGState(context);
    
    CGContextAddRect(context, paperRect);
    CGContextAddPath(context, arcPath);
    CGContextEOClip(context);
    CGContextAddPath(context, arcPath);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor.CGColor);
    CGContextFillPath(context);
    
    CFRelease(arcPath);
}


@end
