//
//  AppDelegate.h
//  clackers
//
//  Created by 加藤 寛人 on 11/12/02.
//  Copyright KatokichiSoft/Avasys 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
