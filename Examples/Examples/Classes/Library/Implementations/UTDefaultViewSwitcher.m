//
//  UTViewSwitcher
//  UAToday
//
//  Created by Paul Taykalo on 7/18/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "UTDefaultViewSwitcher.h"
#import "UTViewStateContainer.h"


@implementation UTDefaultViewSwitcher {

}


- (void)switchFromState:(UTViewState)previousState view:(UIView *)previousView
                toState:(UTViewState)nextState view:(UIView *)nextView
        inContainerView:(UIView *)containerView viewStateContainer:(id<UTViewStateContainer>)viewStateContainer
               animated:(BOOL)animated {

    __weak id<UTViewStateContainer> stateContainer = viewStateContainer;
    if (previousView) {

        [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{

            previousView.alpha = 0;

        } completion:^(BOOL completed) {

            if (stateContainer.viewState != previousState) {
                [previousView removeFromSuperview];
            }

        }];
    }

    if (nextView) {
        nextView.alpha = 0;
        nextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        nextView.frame = containerView.bounds;
        [containerView addSubview:nextView];

        [UIView animateWithDuration:3 animations:^{
            nextView.alpha = 1;
        }];
    }
}

@end