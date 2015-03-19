//
//  AppDelegate.h
//  PoC
//
//  Created by Alex Gutierrez on 7/16/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AVTBaseRepository.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;

@end
