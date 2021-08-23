//
//  CardDetailViewController.h
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import <UIKit/UIKit.h>
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface CardDetailViewController : UIViewController

@property (nonatomic, strong) Card *specifiedCard;
@property (strong, nonatomic) IBOutlet UIImageView *cardImage;
@property (strong, nonatomic) IBOutlet UIImageView *cardLogo;

- (IBAction)deleteButtonAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
