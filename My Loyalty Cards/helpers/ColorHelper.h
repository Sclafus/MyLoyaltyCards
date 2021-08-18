//
//  ColorHelper.h
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorHelper : NSObject

+ (UIColor*) colorFromString:(NSString*)colorHex;
+ (NSString*) stringFromColor:(UIColor*)uiColor;

@end

NS_ASSUME_NONNULL_END
