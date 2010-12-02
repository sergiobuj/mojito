//
//  AppLooks.h
//  GetTheRoute
//
//  Created by Sergio Botero on 11/1/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

#import "LocationMonkey.h"

@interface AppLooks : UIViewController <MFMailComposeViewControllerDelegate> {
	IBOutlet LocationMonkey *theMonkey;
}

-(IBAction)mailIt;

@end
