//
//  Card.m
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import "Card.h"

@implementation Card {
    NSString *_companyName;
    NSString *_stringID;
    NSString *_colorHex;
    BOOL _isBarcode;
}

- (id)initWithCompanyName:(NSString*)companyName
                 stringId:(NSString*)stringID
                 colorHex:(NSString*)colorHex
                isBarcode:(BOOL)isBarcode {
    
    self = [super init];
    _companyName = companyName;
    _stringID = stringID;
    _colorHex = colorHex;
    _isBarcode = isBarcode;
    return self;
}


- (NSString*) getStringID{
    return _stringID;
}

- (NSString*) getCompanyName{
    return _companyName;
}

- (NSString*) getColorHex{
    return _colorHex;
}

- (BOOL) isIsBarcode{
    return _isBarcode;
}

@end
