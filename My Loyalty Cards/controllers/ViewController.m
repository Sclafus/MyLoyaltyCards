//
//  ViewController.m
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 17/08/2021.
//

#import "ViewController.h"
#import "CardList.h"
#import "CardDetailViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CardList *cards;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cardTableView.dataSource = self;
    self.cardTableView.delegate = self;
    self.title = @"My cards";
    self.cards = [[CardList alloc] init];
    
    // example data
    [self.cards add:[[Card alloc]initWithCompanyName:@"Crai" stringId:@"pisellofono" colorHex:@"#00FF00" isBarcode:true]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cards.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardCell" forIndexPath:indexPath];
    Card *card = [self.cards getAtIndex:indexPath.row];
    
    cell.textLabel.text = card.companyName;	
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showCardDetail"]){
        if ([segue.destinationViewController isKindOfClass:[CardDetailViewController class]]){
            CardDetailViewController *vc = (CardDetailViewController *)segue.destinationViewController;
            NSIndexPath *indexPath = [self.cardTableView indexPathForCell:sender];
            Card *c = [self.cards getAtIndex:indexPath.row];
            vc.specifiedCard = c;
        }
    }
}

@end
