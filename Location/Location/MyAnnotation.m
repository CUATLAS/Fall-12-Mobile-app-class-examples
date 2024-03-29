//
//  MyAnnotation.m
//  Location
//
//  Created by Aileen Pierce on 11/28/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
@synthesize coordinate, title, subtitle;

//initializes an annotation instance
-(id)initWithCoordinate:(CLLocationCoordinate2D) coor{
	coordinate=coor;
	title=@"Your are here";
    subtitle=[NSString stringWithFormat:@"Latitude: %f. Longitude: %f", coordinate.latitude, coordinate.longitude];
	return self;
}

//changes location of the annotation
-(void) moveAnnotation:(CLLocationCoordinate2D)newCoordinate{
	[self willChangeValueForKey:@"coordinate"]; //informs the receiver that the coordinate is about to change
    [self willChangeValueForKey:@"subtitle"]; //informs the receiver that the subtitle is about to change
	coordinate = newCoordinate;
	subtitle = [[NSString alloc] initWithFormat:@"Latitude: %f. Longitude: %f", coordinate.latitude, coordinate.longitude];
    [self didChangeValueForKey:@"coordinate"];  //informs the receiver that the coordinate has changed
    [self didChangeValueForKey:@"subtitle"]; //informs the receiver that the subtitle has changed
}


@end
