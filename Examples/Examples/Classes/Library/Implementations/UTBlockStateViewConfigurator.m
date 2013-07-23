//
//  UTBlockStateViewConfigurator
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "UTBlockStateViewConfigurator.h"

@interface UTBlockStateViewConfigurator ()

@property (nonatomic, strong) NSMutableDictionary * viewSetupPerProtocol;
@property (nonatomic, strong) NSMutableDictionary * viewSetupPerClass;

@end

@implementation UTBlockStateViewConfigurator {

}

- (id)init {
    self = [super init];
    if (self) {

        self.viewSetupPerClass = [NSMutableDictionary dictionary];
        self.viewSetupPerProtocol = [NSMutableDictionary dictionary];

    }

    return self;
}


#pragma mark - Views setup

- (void)addSetupActionForViewOfProtocol:(Protocol *)protocol withSetupBlock:(void (^)(id))with {
    if (protocol && with) {
        [[self viewSetupPerProtocol] setObject:with forKey:NSStringFromProtocol(protocol)];
    }
}

- (void)addSetupActionForViewOfClass:(Class)class withSetupBlock:(void (^)(id))with {
    if (class && with) {
        [[self viewSetupPerClass] setObject:with forKey:NSStringFromClass(class)];
    }
}


- (void)setupView:(UIView *)view {
    // Apply view setup
    for (NSString * protocolName in [self.viewSetupPerProtocol allKeys]) {
        Protocol * protocol = NSProtocolFromString(protocolName);
        if ([view conformsToProtocol:protocol]) {
            void (^block)(id) = [[self viewSetupPerProtocol] valueForKey:protocolName];
            block(view);
        }
    }

    for (NSString * className in [self.viewSetupPerClass allKeys]) {
        Class clz = NSClassFromString(className);
        if ([view isKindOfClass:clz]) {
            void (^block)(id) = [[self viewSetupPerClass] valueForKey:className];
            block(view);
        }
    }
}
@end