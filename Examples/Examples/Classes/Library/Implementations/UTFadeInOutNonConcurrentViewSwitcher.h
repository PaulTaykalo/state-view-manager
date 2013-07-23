//
//  UTFadeInOutNonConcurrentViewSwitcher
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UTFadeInOutViewSwitcher.h"

/*
This switcher will first show next view only, and only after that will perform transition to next view state

If state is changed more than once during state view transition, then only the last one transition will be applied

 */
@interface UTFadeInOutNonConcurrentViewSwitcher : UTFadeInOutViewSwitcher

@end