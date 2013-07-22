//
//  UTBlockStateViewFactory
//  State View Manager
//
//  Created by Paul Taykalo on 7/17/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "UTBlockStateViewFactory.h"

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


- (void)addForState:(UTViewState)state viewCreationBlock:(UIView * (^)(NSError * error))viewCreationBlock {
  if (viewCreationBlock) {
      [[self stateViewCreationBlockPerState] setObject:[viewCreationBlock copy] forKey:@(state)];
  }
}


@end