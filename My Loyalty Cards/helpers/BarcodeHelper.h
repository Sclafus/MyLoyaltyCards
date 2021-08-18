//
//  BarcodeHelper.h
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface BarcodeHelper : NSObject
+ (UIImage*) generateBarcodeFromString:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
