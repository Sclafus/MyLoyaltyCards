//
//  QRCodeHelper.m
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import "QRCodeHelper.h"
#import <CoreImage/CIFilterBuiltins.h>

@implementation QRCodeHelper

+ (UIImage*) generateQRCodeFromString: (NSString *) str {

    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];

    [filter setValue:[str dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];

    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *finalImage = [[UIImage alloc] initWithCGImage:cgImage];
    return finalImage;
}

@end
