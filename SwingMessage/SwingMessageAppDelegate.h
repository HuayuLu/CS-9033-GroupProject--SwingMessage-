//
//  SwingMessageAppDelegate.h
//  SwingMessage
//
//  Created by Huayu Lyu on 14-3-5.
//  Copyright (c) 2014年 New York University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwingMessageAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
