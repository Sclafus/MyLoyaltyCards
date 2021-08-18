//
//  NewCardViewController.m
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import "NewCardViewController.h"
#import "Card.h"
#import "ColorHelper.h"
#import "ViewController.h"
@interface NewCardViewController ()

@end

@implementation NewCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)doneButtonAction:(id)sender {
    NSString *companyName = self.companyNameTextField.text;
    NSString *clientId =  self.clientIdTextField.text;
    
    // checks if all the text fields have been filled
    if ([companyName  isEqual: @""] || [clientId  isEqual: @""]){
        
        // alert
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Fill all the fields"
                                                                       message:@"Please fill all the fields" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    bool barcode = self.cardTypeSegmentOutput.selectedSegmentIndex == 1 ? true : false;
    NSString *colorHex = [ColorHelper stringFromColor:self.cardColorSegmentedOutput.selectedSegmentTintColor];
    NSLog(@"%@ %@ %d %@", clientId, companyName, barcode, colorHex);
    
    Card *newCard = [[Card alloc] initWithCompanyName:companyName
                                     stringId:clientId
                                     colorHex:colorHex
                                    isBarcode:barcode];
    [self.cards add:newCard];
    [self dismissViewControllerAnimated:YES completion:nil];
    return;
}

- (IBAction)cancelButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)cardColorAction:(id)sender {
    
    switch (self.cardColorSegmentedOutput.selectedSegmentIndex) {
        case 0:
            self.cardColorSegmentedOutput.selectedSegmentTintColor = [UIColor systemBlueColor];
            break;
            
        case 1:
            self.cardColorSegmentedOutput.selectedSegmentTintColor = [UIColor systemRedColor];
            break;
        
        case 2:
            self.cardColorSegmentedOutput.selectedSegmentTintColor = [UIColor systemGreenColor];
            break;
            
        case 3:
            self.cardColorSegmentedOutput.selectedSegmentTintColor = [UIColor systemYellowColor];
            break;
            
        case 4:
            self.cardColorSegmentedOutput.selectedSegmentTintColor = [UIColor systemPurpleColor];
            break;
            
        default:
            break;
    }
}
@end
