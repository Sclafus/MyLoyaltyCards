//
//  Card.h
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property NSString *companyName;
@property NSString *stringID;
@property bool isBarcode;
@property NSString *colorHex;

+ (id)initWithCompanyName:(NSString*)companyName
                 stringId:(NSString*)stringID
                 colorHex:(NSString*)colorHex
                isBarcode:(BOOL)isBarcode;

- (NSString*) getStringID;
- (NSString*) getCompanyName;
- (NSString*) getColorHex;
- (BOOL) isIsBarcode;
@end

NS_ASSUME_NONNULL_END
