//
//  EXAppDelegate.m
//  Examples
//
//  Created by Paul Taykalo on 7/21/13.
//  Copyright (c) 2013 Stanfy. All rights reserved.
//

#import "EXAppDelegate.h"

#import "EXViewController.h"

@implementation EXAppDelegate {
    UINavigationController * _navigationController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[EXViewController alloc] initWithNibName:@"EXViewController" bundle:nil];
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_viewController];
    self.window.rootViewController = _navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
