//
//  EXViewController.m
//  Examples
//
//  Created by Paul Taykalo on 7/21/13.
//  Copyright (c) 2013 Stanfy. All rights reserved.
//

#import "EXViewController.h"
#import "UTStateViewManager.h"
#import "UTDefaultStateViewFactory.h"
#import "UTDefaultViewSwitcher.h"


@interface EXViewController ()

@property (nonatomic, strong) UTStateViewManager * stateViewManager;

@end

@implementation EXViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }

    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _stateViewManager = [[UTStateViewManager alloc] initWithContainerView:self.view
                                                              viewFactory:[UTDefaultStateViewFactory new]
                                                             viewSwitcher:[UTDefaultViewSwitcher new]];

    UIBarButtonItem * baseBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Base"
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(switchToBaseState)];
    UIBarButtonItem * loadingBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Loading"
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(switchToLoadingState)];

    UIBarButtonItem * errorBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Error"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(switchToErrorState)];

    UIBarButtonItem * noDataBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"NoData"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(switchToNoDataState)];

    self.navigationItem.leftBarButtonItems = @[ baseBarButtonItem, loadingBarButtonItem];
    self.navigationItem.rightBarButtonItems = @[errorBarButtonItem, noDataBarButtonItem];

}


- (void)switchToNoDataState {
    [_stateViewManager switchToState:UTStateViewStateNoData];
}


- (void)switchToErrorState {
    [_stateViewManager switchToState:UTStateViewStateError withError:
     [NSError errorWithDomain:@"com.example" code:-1 userInfo:@{
      NSLocalizedDescriptionKey : @"Error example"
     }]];
}


- (void)switchToLoadingState {
    [_stateViewManager switchToState:UTStateViewStateLoading];
}


- (void)switchToBaseState {
    [_stateViewManager switchToState:UTStateViewStateBase];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
