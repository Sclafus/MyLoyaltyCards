//
//  ViewController.m
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 17/08/2021.
//

#import "ViewController.h"
#import "CardList.h"
#import "CardDetailViewController.h"
#import "NewCardViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"My cards";
    
    self.cardTableView.dataSource = self;
    self.cardTableView.delegate = self;
    self.cards = [[CardList alloc] init];
    
    // observer to update the tableview
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleData) name:@"reload_data" object:nil];
    
    // example data
    [self.cards add:[[Card alloc]initWithCompanyName:@"Crai" stringId:@"ciao" colorHex:@"#007aff" isBarcode:true]];
    [self.cards add:[[Card alloc]initWithCompanyName:@"Esselunga" stringId:@"ciao2" colorHex:@"#32c759" isBarcode:false]];
}

- (void) handleData {
    [self.cardTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cards.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.cards getAtIndex:indexPath.row].companyName;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    // card detail segue
    if([segue.identifier isEqualToString:@"showCardDetail"]){
        if ([segue.destinationViewController isKindOfClass:[CardDetailViewController class]]){
            CardDetailViewController *vc = (CardDetailViewController *)segue.destinationViewController;
            NSIndexPath *indexPath = [self.cardTableView indexPathForCell:sender];
            Card *c = [self.cards getAtIndex:indexPath.row];
            vc.specifiedCard = c;
        }
    }
    // new card segue
    if([segue.identifier isEqualToString:@"newCard"]){
        if([segue.destinationViewController isKindOfClass:[NewCardViewController class]]){
            NewCardViewController *vc = (NewCardViewController *)segue.destinationViewController;
            vc.cards = self.cards;
        }
    }
}

@end
