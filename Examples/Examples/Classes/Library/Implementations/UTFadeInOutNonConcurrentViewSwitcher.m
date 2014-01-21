//
//  UTFadeInOutNonConcurrentViewSwitcher
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "UTFadeInOutNonConcurrentViewSwitcher.h"
#import "UTViewStateContainer.h"

typedef void (^NextAnimationBlock)();

@interface UTFadeInOutNonConcurrentViewSwitcher ()

@property (nonatomic, copy) NextAnimationBlock nextAnimationBlock;
@property (nonatomic, assign) BOOL animating;
@property (nonatomic, weak) UIView * lastVisibleView;


@end

@implementation UTFadeInOutNonConcurrentViewSwitcher {

}

- (id)init {
    self = [super init];
    if (self) {
        self.animationDuration = 1;
    }
    return self;
}


- (void)switchFromState:(UTViewState)previousState view:(UIView *)previousView
                toState:(UTViewState)nextState view:(UIView *)nextView
        inContainerView:(UIView *)containerView viewStateContainer:(id<UTViewStateContainer>)viewStateContainer
               animated:(BOOL)animated {

    __weak UTFadeInOutNonConcurrentViewSwitcher * weakSelf = self;
    if (self.animating) {
        [self setNextAnimationBlock:^{
            [weakSelf switchFromState:previousState
                                 view:previousView
                              toState:nextState
                                 view:nextView
                      inContainerView:containerView
                   viewStateContainer:viewStateContainer
                             animated:animated];
        }];
        return;
    }

    //
    self.animating = YES;

    if (!self.lastVisibleView && !nextView) {
        [self playNextBlockAnimationIfNeeded];
        return;
    }


    if (!animated) {
        [self.lastVisibleView removeFromSuperview];

        if (nextView) {
            nextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            nextView.translatesAutoresizingMaskIntoConstraints = YES;
            CGRect rect = CGRectZero;
            rect.size = containerView.bounds.size;
            nextView.frame = rect;
            [containerView addSubview:nextView];
        }
        self.lastVisibleView = nextView;

        [self playNextBlockAnimationIfNeeded];
        return;
    }


    __weak id<UTViewStateContainer> stateContainer = viewStateContainer;
    if (nextView) {
        nextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        nextView.translatesAutoresizingMaskIntoConstraints = YES;
        CGRect rect = CGRectZero;
        rect.size = containerView.bounds.size;
        nextView.frame = rect;
        [containerView addSubview:nextView];

        UIView * viewToRemove = self.lastVisibleView;
        self.lastVisibleView = nextView;

        nextView.alpha = 0;

        [UIView animateWithDuration:self.animationDuration animations:^{

            nextView.alpha = 1;

        } completion:^(BOOL completed) {
            [viewToRemove removeFromSuperview];
            [weakSelf playNextBlockAnimationIfNeeded];
        }];
        return;
    }


    if (self.lastVisibleView) {
        UIView * viewToRemove = self.lastVisibleView;
        self.lastVisibleView = nil;
        [UIView animateWithDuration:self.animationDuration animations:^{

            viewToRemove.alpha = 0;

        } completion:^(BOOL completed) {
            [viewToRemove removeFromSuperview];
            [weakSelf playNextBlockAnimationIfNeeded];
        }];
    }

}


- (void)playNextBlockAnimationIfNeeded {
    NextAnimationBlock block = [self.nextAnimationBlock copy];
    self.nextAnimationBlock = nil;
    self.animating = NO;
    if (block) {
        block();
    }
}


@end