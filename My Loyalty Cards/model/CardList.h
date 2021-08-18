//
//  CardList.h
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import <Foundation/Foundation.h>
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface CardList : NSObject

- (long) size;
- (NSArray *)getAll;
- (void)add:(Card *)card;
- (Card *)getAtIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
