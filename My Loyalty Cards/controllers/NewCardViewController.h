//
//  NewCardViewController.h
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import <UIKit/UIKit.h>
#import "CardList.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewCardViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) CardList *cards;

@property (strong, nonatomic) IBOutlet UITextField *companyNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *clientIdTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *cardTypeSegmentOutput;
@property (weak, nonatomic) IBOutlet UISegmentedControl *cardColorSegmentedOutput;
@property (retain, nonatomic) UIImagePickerController *imageController;

- (IBAction)cardColorAction:(id)sender;
- (IBAction)cancelButtonAction:(id)sender;
- (IBAction)doneButtonAction:(id)sender;
- (IBAction)selectLogoButtonAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
