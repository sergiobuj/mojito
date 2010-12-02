//
//  MainView.h
//  ShareTheRoute
//
//  Created by Sergio Botero on 11/15/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationMonkey.h"
#import <MessageUI/MessageUI.h>

@interface MainViewController : UIViewController <MFMailComposeViewControllerDelegate>{
	LocationMonkey *theMonkey;

}

- (void) mailIt:(id)sender;
@end
