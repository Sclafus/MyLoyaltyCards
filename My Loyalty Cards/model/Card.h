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
@property NSData *logoData;

// constructors
- (id)initWithCompanyName:(NSString*)companyName
                 stringId:(NSString*)stringID
                 colorHex:(NSString*)colorHex
                isBarcode:(BOOL)isBarcode;

- (id)initWithCompanyName:(NSString*)companyName
                 stringId:(NSString*)stringID
                 colorHex:(NSString*)colorHex
                isBarcode:(BOOL)isBarcode
                     logo:(NSData*) logo;

@end

NS_ASSUME_NONNULL_END
