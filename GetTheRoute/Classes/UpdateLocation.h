//
//  UpdateLocation.h
//  GetTheRoute
//
//  Created by Sergio Botero on 10/28/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface UpdateLocation : NSOperation {
	NSMutableURLRequest *request;
}

@property (nonatomic, copy) NSMutableURLRequest *request;

- (id) initWithMapID:(NSString *) sessionMapID withLocation:(CLLocation *) newLocation;

@end
