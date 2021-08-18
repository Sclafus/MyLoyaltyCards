//
//  CardDetailViewController.m
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 18/08/2021.
//

#import "CardDetailViewController.h"
#import "QRCodeHelper.h"
#import "BarcodeHelper.h"
#import "ColorHelper.h"

@interface CardDetailViewController ()
@property (weak, nonatomic) NSString *colorHex;

@end

@implementation CardDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.specifiedCard.companyName;
    self.view.backgroundColor = [ColorHelper colorFromString:self.specifiedCard.colorHex];
    
    self.cardImage.image = self.specifiedCard.isBarcode ? [BarcodeHelper generateBarcodeFromString:self.specifiedCard.stringID] : [QRCodeHelper generateQRCodeFromString:self.specifiedCard.stringID];
    
    //sharpening
    self.cardImage.layer.magnificationFilter = kCAFilterNearest;
}


- (IBAction)deleteButtonAction:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Are you sure?"
                                                                   message:@"Do you really want to delete this card?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *affermative = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {}];
    UIAlertAction *negative = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
    
    [alert addAction:negative];
    [alert addAction:affermative];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
