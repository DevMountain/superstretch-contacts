//
//  Contact.h
//  Contacts
//
//  Created by TRM on 7/31/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *jobTitle;
@property (strong, nonatomic) NSString *company;

- (NSString *)fullName;

@end
