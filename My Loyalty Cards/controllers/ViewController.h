//
//  ViewController.h
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 17/08/2021.
//

#import <UIKit/UIKit.h>
#import "CardList.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *cardTableView;
@property (strong, nonatomic) CardList *cards;

@end

