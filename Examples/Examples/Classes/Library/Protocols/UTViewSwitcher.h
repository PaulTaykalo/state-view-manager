//
//  UTViewSwitcher
//  State View Manager
//
//  Created by Paul Taykalo on 7/18/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UTStateViewManager.h"
#import "UTStateViewFactoryProtocol.h"
@protocol UTViewStateContainer;


/*
Main purpose for objects that resolve this protocol is to
 */
@protocol UTViewSwitcher<NSObject>

- (void)switchFromState:(UTViewState)state1 view:(UIView *)view1
                toState:(UTViewState)state2 view:(UIView *)view2
        inContainerView:(UIView *)view viewStateContainer:(id<UTViewStateContainer>)viewStateContainer
               animated:(BOOL)animated;
@end