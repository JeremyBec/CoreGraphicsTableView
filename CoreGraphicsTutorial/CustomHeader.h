#import <UIKit/UIKit.h>

@interface CustomHeader : UIView

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIColor * lightColor;
@property (nonatomic, strong) UIColor * darkColor;

@property (nonatomic, assign) CGRect coloredBoxRect;
@property (nonatomic, assign) CGRect paperRect;

@end
