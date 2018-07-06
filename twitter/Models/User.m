//
//  User.m
//  twitter
//
//  Created by Somtochukwu Nweke on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        // Initialize any other properties
    }
    return self;
}

@end
