//
//  AppDelegate.h
//  My Loyalty Cards
//
//  Created by Alessandro Sclafani on 17/08/2021.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

