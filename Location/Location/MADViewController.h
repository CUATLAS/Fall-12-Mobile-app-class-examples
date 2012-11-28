//
//  MADViewController.h
//  Location
//
//  Created by Aileen Pierce on 11/28/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocation/CoreLocation.h"
#import "MapKit/MapKit.h"

@interface MADViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;

@property (weak, nonatomic) IBOutlet UITextField *altitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *accuracyTextField;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end
