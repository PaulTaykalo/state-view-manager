//
//  UTStateViewActualizer
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>


@protocol UTStateViewActualizer<NSObject>

/*
 Setting up view, based on added actions
 */
- (void)setupView:(UIView *)view;

@end