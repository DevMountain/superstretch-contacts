//
//  Contact.m
//  Contacts
//
//  Created by TRM on 7/31/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (NSString *)description {
    return [self fullName];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
