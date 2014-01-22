//
//  UTViewSwitcher
//  State View Manager
//
//  Created by Paul Taykalo on 7/18/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "UTFadeInOutViewSwitcher.h"
#import "UTViewStateContainer.h"



@implementation UTFadeInOutViewSwitcher {

}

- (id)init {
    self = [super init];
    if (self) {
        self.animationDuration = 0.5;
    }
    return self;
}


- (void)switchFromState:(UTViewState)previousState view:(UIView *)previousView
                toState:(UTViewState)nextState view:(UIView *)nextView
        inContainerView:(UIView *)containerView viewStateContainer:(id<UTViewStateContainer>)viewStateContainer
               animated:(BOOL)animated {

    __weak id<UTViewStateContainer> stateContainer = viewStateContainer;
    if (previousView) {

        if (animated) {
            [UIView animateWithDuration:self.animationDuration delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{

                previousView.alpha = 0;

            } completion:^(BOOL completed) {

                if (stateContainer.viewState != previousState) {
                    [previousView removeFromSuperview];
                }

            }];
        } else {

            // Simply remove old view
            if (stateContainer.viewState != previousState) {
                [previousView removeFromSuperview];
            }
        }
    }


    if (nextView) {
        nextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        nextView.translatesAutoresizingMaskIntoConstraints = YES;
        CGRect rect = CGRectZero;
        rect.size = containerView.bounds.size;
        nextView.frame = rect;
        [containerView addSubview:nextView];

        if (animated) {
            nextView.alpha = 0;

            [UIView animateWithDuration:1 animations:^{
                nextView.alpha = 1;
            }];

        } else {

            nextView.alpha = 1;

        }
    }
}

@end