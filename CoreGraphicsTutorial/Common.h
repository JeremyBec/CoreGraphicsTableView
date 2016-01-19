// Helper class for drawing shapes in Core Graphics context

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);
void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color);
void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

CGRect rectFor1PxStroke(CGRect rect);
CGMutablePathRef createArcPathFromBottomOfRect(CGRect rect, CGFloat arcHeight);

static inline double radians (double degrees) {
    return degrees * M_PI/180;
}

