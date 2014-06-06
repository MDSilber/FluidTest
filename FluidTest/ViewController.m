//
//  ViewController.m
//  FluidTest
//
//  Created by Mason Silber on 6/5/14.
//  Copyright (c) 2014 Mason Silber. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view
    View *view = [[View alloc] initWithFrame:self.view.bounds];
    self.view = view;
}

@end
