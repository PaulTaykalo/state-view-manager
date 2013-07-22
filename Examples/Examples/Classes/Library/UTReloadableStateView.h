//
//  UTReloadableStateView
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef void (^EXReloadBlock)();

@protocol UTReloadableStateView<NSObject>

@property (nonatomic, copy) EXReloadBlock reloadBlock;

@end