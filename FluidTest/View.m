//
//  View.m
//  FluidTest
//
//  Created by Mason Silber on 6/5/14.
//  Copyright (c) 2014 Mason Silber. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *blackSquare = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
        blackSquare.center = self.center;
        blackSquare.layer.borderWidth = 2.0f;
        blackSquare.layer.borderColor = [UIColor blackColor].CGColor;
        blackSquare.backgroundColor = [UIColor whiteColor];
        [self addSubview:blackSquare];
    }
    return self;
}

@end
