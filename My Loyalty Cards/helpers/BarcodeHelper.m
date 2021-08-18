//
//  BarcodeHelper.m
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import "BarcodeHelper.h"

@implementation BarcodeHelper

+ (UIImage *)generateBarcodeFromString:(NSString *)str {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CIPDF417BarcodeGenerator"];

    [filter setValue:[str dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
    [filter setValue:@374.0f forKey:@"inputMinWidth"];
    [filter setValue:@8.0f forKey:@"inputCorrectionLevel"];
    [filter setValue:@1.5f forKey:@"inputPreferredAspectRatio"];

    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *finalImage = [[UIImage alloc] initWithCGImage:cgImage];
    return finalImage;
}

@end
