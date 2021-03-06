//
//  UTStateViewManager
//  State View Manager
//
//  Created by Paul Taykalo on 7/17/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UTStateViewFactoryProtocol.h"
@protocol UTStateViewFactoryProtocol;
@protocol UTViewSwitcher;
@protocol EXReloadableStateView;
@protocol UTStateViewConfigurator;


@interface UTStateViewManager : NSObject

@property (nonatomic, weak) UIView * containerView;
@property (nonatomic, strong) id<UTStateViewFactoryProtocol> viewFactory;
@property (nonatomic, strong) id<UTViewSwitcher> viewSwitcher;
@property (nonatomic, strong) id<UTStateViewConfigurator> stateViewConfigurator;

- (void)switchToState:(UTViewState)state;
- (void)switchToState:(UTViewState)state animated:(BOOL)animated;
- (void)switchToState:(UTViewState)state withError:(NSError *)error;
- (void)switchToState:(UTViewState)state withError:(NSError *)error animated:(BOOL)animated;

- (id)initWithContainerView:(UIView *)containerView
                viewFactory:(id<UTStateViewFactoryProtocol>)viewFactory
               viewSwitcher:(id<UTViewSwitcher>)viewSwitcher
      stateViewConfigurator:(id<UTStateViewConfigurator>)stateViewConfigurator;


@end