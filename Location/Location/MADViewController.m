//
//  MADViewController.m
//  Location
//
//  Created by Aileen Pierce on 11/28/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "MADViewController.h"
#import "MyAnnotation.h"

@interface MADViewController (){
    CLLocationManager *locationManager;
    MyAnnotation *annotation;
}

@end

@implementation MADViewController
@synthesize latitudeTextField;
@synthesize longitudeTextField;
@synthesize altitudeTextField;
@synthesize accuracyTextField;
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager=[[CLLocationManager alloc] init];
	locationManager.delegate=self;
	locationManager.desiredAccuracy=kCLLocationAccuracyBest; //specify the desired accuracy
	locationManager.distanceFilter=kCLDistanceFilterNone; //specify the distance a device must move laterally(in meters) to generate an update. We specify to be notified of all movements.
	[locationManager startUpdatingLocation]; //starts the location manager
	mapView.delegate=self;
	mapView.mapType=MKMapTypeHybrid; //hybrid with map and satellite
	[self.view addSubview:mapView]; //add the mapView as a subview

}

#pragma mark CLLocationManager Delegate methods

//called when a new location value is available
-(void)locationManager:(CLLocationManager *) manager
   didUpdateToLocation:(CLLocation *) newLocation
          fromLocation:(CLLocation *) oldLocation {
	latitudeTextField.text=[[NSString alloc] initWithFormat:@"%f", newLocation.coordinate.latitude]; //assign the latitude as a string to the text field
	longitudeTextField.text=[[NSString alloc] initWithFormat:@"%f", newLocation.coordinate.longitude]; //assign the longitude as a string to the text field
	altitudeTextField.text=[[NSString alloc] initWithFormat:@"%f", newLocation.altitude]; //assign the accuracy as a string to the text field
	accuracyTextField.text=[[NSString alloc] initWithFormat:@"%f", newLocation.horizontalAccuracy]; //assign the accuracy as a string to the text field
    //update the map
	MKCoordinateSpan span; //defines the area spanned by a map region
	span.latitudeDelta=.001; //the amount of north-to-south distance (measured in degrees) to display on the map
	span.longitudeDelta=.001; //the amount of east-to-west distance (measured in degrees) to display for the map region
	MKCoordinateRegion region; //region of the map to be displayed
	region.center=newLocation.coordinate; //sets the center of the region to be the newLocation
	region.span=span; //sets the horizontal and vertical span of the map to display
	[mapView setRegion:region animated:YES]; //animates changing the currently visible region
    //display annotation
	if(annotation){
		[annotation moveAnnotation:newLocation.coordinate]; //moves the annotation if it already exists
	}
	else { //creates an annotation if one does not exist
		annotation=[[MyAnnotation alloc] initWithCoordinate:newLocation.coordinate]; //creates new annotation
		[mapView addAnnotation:annotation]; //adds the annotation to the mapview
	}
}

//called when a location cannot be determined
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error"
                                                  message:@"Error obtaining location"
                                                 delegate:nil
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
	[alert show];
}

- (void)viewDidUnload
{
    [self setLatitudeTextField:nil];
    [self setLongitudeTextField:nil];
    [self setAltitudeTextField:nil];
    [self setAccuracyTextField:nil];
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
