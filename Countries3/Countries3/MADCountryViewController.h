//
//  MADCountryViewController.h
//  Countries3
//
//  Created by Aileen Pierce on 10/24/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADCountryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (strong, nonatomic)NSString *addCountry;
- (IBAction)addCountry:(UIBarButtonItem *)sender;


@end
