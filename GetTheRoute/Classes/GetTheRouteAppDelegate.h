//
//  GetTheRouteAppDelegate.h
//  GetTheRoute
//
//  Created by Sergio Botero on 10/28/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppLooks.h"

@interface GetTheRouteAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIBackgroundTaskIdentifier bgTask;
	UIApplication * GetTheRouteApp;
	AppLooks *mainView;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

