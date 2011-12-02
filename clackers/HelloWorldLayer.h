//
//  HelloWorldLayer.h
//  clackers
//
//  Created by 加藤 寛人 on 11/12/02.
//  Copyright KatokichiSoft/Avasys 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
	CCSprite *ball_left;
	CCSprite *ball_right;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
