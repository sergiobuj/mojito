//
//  UpdateLocation.m
//  GetTheRoute
//
//  Created by Sergio Botero on 10/28/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "UpdateLocation.h"

static NSString * serviceURL = @"strong-frost-70.heroku.com";

@implementation UpdateLocation

@synthesize request;

- (id) initWithMapID:(NSString *) sessionMapID withLocation:(CLLocation *) newLocation{

	if(self = [super init]){
		
		NSString *completeURL = [NSString stringWithFormat:@"http://%@/locations", serviceURL];
		
		//NSString * completeURL = [NSString stringWithFormat:@"http://%@/%@/%f&%f", serviceURL , sessionMapID, newLocation.coordinate.latitude, newLocation.coordinate.longitude];

		request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:completeURL]];

		[request setHTTPMethod:@"POST"];
		
		NSString * requestBody = [NSString stringWithFormat:@"map_id=%@&latitude=%lf&longitude=%lf", sessionMapID, newLocation.coordinate.latitude, newLocation.coordinate.longitude ];
		
		[request setHTTPBody:[ requestBody dataUsingEncoding:NSUTF8StringEncoding]];
	}	
	return self;
}

- (void) main{

	[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	
}


- (void) dealloc{
	[request release];
	[super dealloc];
}
 

@end
