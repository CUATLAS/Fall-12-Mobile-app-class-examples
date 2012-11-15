//
//  MADViewController.h
//  Animation
//
//  Created by Aileen Pierce on 11/12/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
- (IBAction)sliderMoved:(UISlider *)sender;

@end
