//
//  User.h
//  Favorites
//
//  Created by Aileen Pierce on 10/9/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject{
    NSString *userword;
    NSString *userquote;
}

@property(copy, nonatomic)NSString *userword;
@property(copy, nonatomic)NSString *userquote;

@end
