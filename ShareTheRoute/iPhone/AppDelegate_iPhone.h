//
//  AppDelegate_iPhone.h
//  ShareTheRoute
//
//  Created by Sergio Botero on 11/15/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate_iPhone : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MainViewController *mainView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

