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
@property NSData *imageDataTmp;
@end

@implementation NewCardViewController
@synthesize imageController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark logo
- (IBAction)selectLogoButtonAction:(id)sender {
    imageController = [[UIImagePickerController alloc] init];
    imageController.delegate = self;
    [self presentViewController:imageController animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    // saving the data
    _imageDataTmp = UIImageJPEGRepresentation([info objectForKey:UIImagePickerControllerOriginalImage], 1);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark done button
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
    
    // adding the card to the table view
    if (_imageDataTmp == nil){
        Card *newCard = [[Card alloc] initWithCompanyName:companyName stringId:clientId colorHex:colorHex isBarcode:barcode];
        [self.cards add:newCard];
        
    } else {
        Card *newCard = [[Card alloc] initWithCompanyName:companyName stringId:clientId colorHex:colorHex isBarcode:barcode logo:_imageDataTmp];
        [self.cards add:newCard];
    }

    
    // updating data
    ViewController *vc = (ViewController *)self.parentViewController;
    vc.cards = self.cards;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reload_data" object:self];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    return;
}


#pragma mark ux
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
