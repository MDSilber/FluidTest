//
//  View.m
//  FluidTest
//
//  Created by Mason Silber on 6/5/14.
//  Copyright (c) 2014 Mason Silber. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "View.h"

@interface View ()


@end
@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (SKEmitterNode *)emitterNode
{
    NSString *emitterPath = [[NSBundle mainBundle] pathForResource:@"MyParticle" ofType:@"sks"];
    SKEmitterNode *node = [NSKeyedUnarchiver unarchiveObjectWithFile:emitterPath];
    return node;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    SKNode *barrierNode = [SKNode node];
    CGRect barrierRect = CGRectMake(self.center.x - 50.0f, self.center.y - 50.0f, 100.0f, 100.0f);
    barrierNode.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:barrierRect];

    SKView *particleView = [[SKView alloc] initWithFrame:barrierRect];
    particleView.showsFPS = YES;
    particleView.showsNodeCount = YES;
    particleView.backgroundColor = [UIColor clearColor];
    SKScene *particleScene = [SKScene sceneWithSize:barrierRect.size];

    SKPhysicsBody *boxBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:particleScene.frame];
    boxBody.friction = 0.0f;
    particleScene.physicsBody = boxBody;

    SKEmitterNode *node = [self emitterNode];
    node.position = CGPointMake(50,30);
    [particleScene addChild:node];

    node.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:floorf(node.frame.size.width/2.0f)];
    node.physicsBody.friction = 0.0f;
    node.physicsBody.restitution = 1.0f;
    node.physicsBody.linearDamping = 0.0f;
    node.physicsBody.allowsRotation = NO;

    [particleView presentScene:particleScene];
    [self addSubview:particleView];
}

@end
