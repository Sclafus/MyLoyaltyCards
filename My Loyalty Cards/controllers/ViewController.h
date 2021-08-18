//
//  ViewController.h
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 17/08/2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *cardTableView;


@end

