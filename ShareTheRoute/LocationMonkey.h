//
//  LocationMonkey.h
//  GetTheRoute
//
//  Created by Sergio Botero on 10/28/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UpdateLocation.h"


@interface LocationMonkey : NSObject <CLLocationManagerDelegate> {
	CLLocationManager * mrLocation;
	NSOperationQueue * requestsQ; // the Q
	NSTimer *monkeyWristWatch;
	BOOL monkeyWorking;
	NSMutableString *uniqueMapID;
}

- (void) wakeTheLocationMonkey:(NSTimeInterval) updateInterval;
- (void) sleepTheLocationMonkey;
- (void) queueNewLocation;

- (void) switchMonkey:(id) sender;

@property (nonatomic, copy, readonly) NSMutableString *uniqueMapID;

@end
