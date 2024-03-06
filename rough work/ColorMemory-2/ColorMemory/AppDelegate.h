//
//  AppDelegate.h
//  ColorMemory
//
//  Created by Gagan Joshi on 3/5/17.
//  Copyright © 2017 Gagan Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

+(AppDelegate *)appDelegate;

@end

