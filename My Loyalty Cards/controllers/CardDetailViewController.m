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
    if (self.specifiedCard.isBarcode){
        self.cardImage.image = [BarcodeHelper generateBarcodeFromString:self.specifiedCard.stringID];
    } else {
        self.cardImage.image = [QRCodeHelper generateQRCodeFromString:self.specifiedCard.stringID];
    }
    //sharpening
    self.cardImage.layer.magnificationFilter = kCAFilterNearest;
    self.view.backgroundColor = [ColorHelper colorFromString:self.specifiedCard.colorHex];

    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
