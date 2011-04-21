//
//  LocationMonkey.m
//  GetTheRoute
//
//  Created by Sergio Botero on 10/28/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//
//Commit on private repo
#import "LocationMonkey.h"

static LocationMonkey *sharedInstance = nil;

@implementation LocationMonkey

@synthesize uniqueMapID;

- (id) init{
	if( self = [super init]){
		requestsQ = [[NSOperationQueue alloc] init];
		[requestsQ setMaxConcurrentOperationCount:1];
		
		mrLocation = [[CLLocationManager alloc] init];
		[mrLocation setDesiredAccuracy:kCLLocationAccuracyBest];
		[mrLocation setDistanceFilter:kCLDistanceFilterNone];
		[mrLocation setDelegate:self];
		[mrLocation stopUpdatingHeading];
		//[mrLocation startMonitoringSignificantLocationChanges];
		[mrLocation stopUpdatingLocation];
		[mrLocation stopMonitoringSignificantLocationChanges];
		monkeyWorking = NO;

		uniqueMapID = [[NSMutableString alloc] init];
	}
	return self;
}

#pragma mark -
#pragma mark Location methods

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	
}


- (void) wakeTheLocationMonkey:(NSTimeInterval) updateInterval{
	[mrLocation startUpdatingLocation];
	// Get the map ID
	[uniqueMapID setString:@"myM4p1D"];
	
	monkeyWristWatch = [NSTimer scheduledTimerWithTimeInterval:updateInterval target:self selector:@selector(queueNewLocation) userInfo:nil repeats:YES];
}


- (void) queueNewLocation {
	
	UpdateLocation *newLocation = [[UpdateLocation alloc] initWithMapID:uniqueMapID withLocation:mrLocation.location];
	[requestsQ addOperation:newLocation];
	[newLocation release];
	
}


- (void) sleepTheLocationMonkey {
	[monkeyWristWatch invalidate];
	[mrLocation stopUpdatingLocation];
	monkeyWristWatch = nil;
}

- (void) switchMonkey:(id) sender{
	
	if (monkeyWorking) {
		[self sleepTheLocationMonkey];
	}else {
		[self wakeTheLocationMonkey:2.0];
	}
	monkeyWorking = !monkeyWorking;
}

#pragma mark -
#pragma mark Singleton methods

+ (LocationMonkey*)sharedInstance
{
    @synchronized(self)
    {
        if (sharedInstance == nil)
			sharedInstance = [[LocationMonkey alloc] init];
    }
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;
}

- (void)release {
}

- (id)autorelease {
    return self;
}

@end
