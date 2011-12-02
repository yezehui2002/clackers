//
//  HelloWorldLayer.m
//  clackers
//
//  Created by 加藤 寛人 on 11/12/02.
//  Copyright KatokichiSoft/Avasys 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

@interface HelloWorldLayer ()
- (CCActionInterval *)swingActionWithAngle:(float)angle;
- (void)doActionLeft;
- (void)doActionRight;
@end

#define X_START 140.0f
#define ANGLE	60.0f

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		ball_left = [CCSprite spriteWithFile:@"ball.png"];
		ball_left.scale = 0.5f * CC_CONTENT_SCALE_FACTOR();
		ball_left.anchorPoint = ccp(0.5f, 1.0f);
		ball_left.position = ccp(X_START, 270);
		[self addChild:ball_left];

		float r = ball_left.contentSize.width/2;
		int count;
		for (count=0; count<3; count++) {
			CCSprite *ball = [CCSprite spriteWithFile:@"ball.png"];
			ball.scale = 0.5f * CC_CONTENT_SCALE_FACTOR();
			ball.anchorPoint = ccp(0.5f, 1.0f);
			ball.position = ccp(X_START+(r*count)+r, 270);
			[self addChild:ball];
		}

		ball_right = [CCSprite spriteWithFile:@"ball.png"];
		ball_right.scale = 0.5f * CC_CONTENT_SCALE_FACTOR();
		ball_right.position = ccp(X_START+(r*count)+r, 270);
		ball_right.anchorPoint = ccp(0.5f, 1.0f);
		[self addChild:ball_right];

		[self doActionLeft];
	}
	return self;
}

- (void) dealloc
{
	[ball_left release];
	[ball_right release];
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

- (CCActionInterval *)swingActionWithAngle:(float)angle {
	// pendulum animation by rotation with sin curve easing
	CCActionInterval *rotate = [CCRotateBy actionWithDuration:0.6f angle:angle];
	CCActionInterval *swing_oneway = [CCEaseSineOut actionWithAction:rotate];
	CCActionInterval *swing = [CCSequence actions:swing_oneway, [swing_oneway reverse], nil];
	return swing;
}

- (void)doActionLeft {
	[ball_left runAction:[CCSequence actions:
						  [self swingActionWithAngle:ANGLE],
						  [CCCallFunc actionWithTarget:self selector:@selector(doActionRight)], nil]];
}

- (void)doActionRight {
	[ball_right runAction:[CCSequence actions:
						   [self swingActionWithAngle:-ANGLE],
						   [CCCallFunc actionWithTarget:self selector:@selector(doActionLeft)], nil]];
}
@end
