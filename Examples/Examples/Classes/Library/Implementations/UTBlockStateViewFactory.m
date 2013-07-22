//
//  UTBlockStateViewFactory
//  UAToday
//
//  Created by Paul Taykalo on 7/17/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "UTBlockStateViewFactory.h"
#import "EXLoadingStateView.h"
#import "EXErrorStateView.h"

@interface UTBlockStateViewFactory ()

@property (nonatomic, strong) NSMutableDictionary * stateViewCreationBlockPerState;
@end


@implementation UTBlockStateViewFactory {

}


- (id)init {
    self = [super init];
    if (self) {
        self.stateViewCreationBlockPerState = [NSMutableDictionary dictionary];
    }

    return self;
}


- (UIView *)viewForState:(UTViewState)state {
    return [self viewForState:state error:nil];
}


- (UIView *)viewForState:(UTViewState)state error:(NSError *)error {

    UIView * (^block)(NSError *) = [[self stateViewCreationBlockPerState] objectForKey:@(state)];
    if (block) {
        id view = block(error);
        if (view) {
            return view;
        }
    } else {
        NSLog(@"Sorry, No block creation was specified for state : %@", @(state));
    }
    return nil;
}


- (void)addStateViewCreationBlock:(UIView * (^)(NSError * error))viewCreationBlock forViewState:(UTViewState)state {
  if (viewCreationBlock) {
      [[self stateViewCreationBlockPerState] setObject:[viewCreationBlock copy] forKey:@(state)];
  }
}


@end