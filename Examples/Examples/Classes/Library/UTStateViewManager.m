//
//  UTStateViewManager
//  State View Manager
//
//  Created by Paul Taykalo on 7/17/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "UTStateViewManager.h"
#import "UTViewSwitcher.h"
#import "UTViewStateContainer.h"
#import "UTStateViewConfigurator.h"


@interface UTStateViewManager ()<UTViewStateContainer>

@property (nonatomic, assign) UTViewState viewState;
@property (nonatomic, strong) UIView * currentStateView;


@end

@implementation UTStateViewManager


- (id)initWithContainerView:(UIView *)containerView viewFactory:(id<UTStateViewFactoryProtocol>)viewFactory viewSwitcher:(id<UTViewSwitcher>)viewSwitcher stateViewConfigurator:(id<UTStateViewConfigurator>)stateViewConfigurator {
    self = [super init];
    if (self) {
        _containerView = containerView;
        _viewFactory = viewFactory;
        _viewSwitcher = viewSwitcher;
        _stateViewConfigurator = stateViewConfigurator;
    }

    return self;
}



#pragma mark - Blocks calling

- (void)switchToState:(UTViewState)state {
    [self switchToState:state withError:nil animated:NO];
}


- (void)switchToState:(UTViewState)state animated:(BOOL)animated {
    [self switchToState:state withError:nil animated:animated];
}


- (void)switchToState:(UTViewState)state withError:(NSError *)error {
    [self switchToState:state withError:error animated:NO];
}


- (void)switchToState:(UTViewState)state withError:(NSError *)error animated:(BOOL)animated {
    if (self.viewState != state) {

        UIView * nextView = [[self viewFactory] viewForState:state error:error];

        [[self stateViewConfigurator] setupView:nextView];

        [self switchToView:nextView animated:animated state:state];
    }
}

#pragma mark - State views

- (void)switchToView:(UIView *)nextView animated:(BOOL)animated state:(UTViewState)state {

    UTViewState oldState = self.viewState;
    self.viewState = state;

    UIView * previousView = self.currentStateView;
    self.currentStateView = nextView;

    [[self viewSwitcher] switchFromState:oldState
                                    view:previousView
                                 toState:state
                                    view:nextView
                         inContainerView:self.containerView
                      viewStateContainer:self
                                animated:animated];
}




@end