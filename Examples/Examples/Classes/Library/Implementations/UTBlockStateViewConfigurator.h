//
//  UTBlockStateViewConfigurator
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UTStateViewConfigurator.h"


@interface UTBlockStateViewConfigurator : NSObject <UTStateViewConfigurator>

/*
 Adds block that will be called each time, when view of specified class will be passed to
   - (void)setupView: method
 */
- (void)addSetupActionForViewOfClass:(Class)class withSetupBlock:(void (^)(id))setupBlock;

/*
 Adds block that will be called each time, when view that implements specified protocol will be passed to
   - (void)setupView: method
 */
- (void)addSetupActionForViewOfProtocol:(Protocol *)protocol withSetupBlock:(void (^)(id))setupBlock;


@end