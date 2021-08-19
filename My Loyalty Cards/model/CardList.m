//
//  CardList.m
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import "CardList.h"
@interface CardList()

@property (nonatomic, strong) NSMutableArray *cards;

@end


@implementation CardList
- (instancetype)init{
    if (self = [super init]){
        _cards = [[NSMutableArray alloc]init];
    }
    return self;
}

- (long)size{
    return self.cards.count;
}

- (NSArray *)getAll{
    return self.cards;
}

- (void)add:(Card *)card{
    [self.cards addObject:card];
}

- (void) remove:(Card *)card{
    NSInteger index = [self.cards indexOfObject:card];
    [self.cards removeObjectAtIndex:index];
}

- (Card *)getAtIndex:(NSInteger)index{
    return [self.cards objectAtIndex:index];
}

@end
