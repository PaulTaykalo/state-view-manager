//
//  UTViewSwitcher
//  State View Manager
//
//  Created by Paul Taykalo on 7/18/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UTFadeInOutViewSwitcher.h"
#import "UTViewSwitcher.h"


/*
 Simply switches view with fade animations
 */
@interface UTFadeInOutViewSwitcher : NSObject <UTViewSwitcher>

@property (nonatomic, assign) CGFloat animationDuration;

@end