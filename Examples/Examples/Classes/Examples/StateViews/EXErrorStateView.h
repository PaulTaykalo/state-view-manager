//
//  EXErrorStateView
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UTReloadableStateView.h"


@interface EXErrorStateView : UIView <UTReloadableStateView>

@property (nonatomic, readonly) UILabel * messageLabel;
@property (nonatomic, strong) NSString * message;

@property (nonatomic, copy) EXReloadBlock reloadBlock;


@end