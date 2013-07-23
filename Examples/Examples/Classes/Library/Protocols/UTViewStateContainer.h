//
//  UTViewStateContainer
//  State View Manager
//
//  Created by Paul Taykalo on 7/18/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UTStateViewFactoryProtocol.h"


@protocol UTViewStateContainer<NSObject>

@property (nonatomic, readonly) UTViewState viewState;

@end