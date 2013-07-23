//
//  UTStateViewConfigurator
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>


@protocol UTStateViewConfigurator<NSObject>

/*
 Setting up view
 */
- (void)setupView:(UIView *)view;

@end