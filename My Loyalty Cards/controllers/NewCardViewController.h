//
//  NewCardViewController.h
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import <UIKit/UIKit.h>
#import "CardList.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewCardViewController : UIViewController

@property (strong, nonatomic) CardList *cards;

@property (strong, nonatomic) IBOutlet UITextField *companyNameTextField;

@property (strong, nonatomic) IBOutlet UITextField *clientIdTextField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *cardTypeSegmentOutput;

@property (weak, nonatomic) IBOutlet UISegmentedControl *cardColorSegmentedOutput;

- (IBAction)cardColorAction:(id)sender;

- (IBAction)cancelButtonAction:(id)sender;

- (IBAction)doneButtonAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
