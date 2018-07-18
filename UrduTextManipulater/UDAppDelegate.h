//
//  UDAppDelegate.h
//  UrduTextManipulater
//
//  Created by Syed Rajeel Amjad on 1/11/13.
//  Copyright (c) 2013 BrainiacsTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UDViewController;

@interface UDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController * nav;

@property (strong, nonatomic) UDViewController *viewController;

@end
