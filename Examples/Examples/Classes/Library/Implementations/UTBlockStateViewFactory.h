//
//  UTBlockStateViewFactory
//  UAToday
//
//  Created by Paul Taykalo on 7/17/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UTStateViewFactoryProtocol.h"


@interface UTBlockStateViewFactory : NSObject <UTStateViewFactoryProtocol>

/*
 Adds block that will be called each time, when view that implements specified protocol will be passed to
   - (void)setupView: method
 */
- (void)addStateViewCreationBlock:(UIView * (^)(NSError * error))viewCreationBlock forViewState:(UTViewState)state;

@end