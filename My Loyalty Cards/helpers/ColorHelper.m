//
//  ColorHelper.m
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import "ColorHelper.h"

@implementation ColorHelper
+ (UIColor *) colorFromString: (NSString *) colorHex{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:colorHex];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];

    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];

}

+ (NSString*) stringFromColor:(UIColor*)uiColor {
    const CGFloat *components = CGColorGetComponents(uiColor.CGColor);
    CGFloat red = components[0];
    CGFloat green = components[1];
    CGFloat blue = components[2];
    NSString *result = [NSString stringWithFormat:@"#%02lX%02lX%02lX",lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255)];
    return result;
}

@end
