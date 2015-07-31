//
//  ContactController.h
//  Contacts
//
//  Created by TRM on 7/31/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactController : NSObject

+ (ContactController *)sharedInstance;

- (Contact *)createContact;

@property (strong, nonatomic, readonly) NSDictionary *indexedContacts;

- (void)deleteContact:(Contact *)contact;

@end
