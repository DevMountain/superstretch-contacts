//
//  ContactController.m
//  Contacts
//
//  Created by TRM on 7/31/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ContactController.h"
@import CoreData;

@interface ContactController()

@property (strong, nonatomic) NSDictionary *indexedContacts;
@property (strong, nonatomic) NSArray *contacts;

@end

@implementation ContactController

+ (ContactController *)sharedInstance {
    static ContactController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ContactController new];
        sharedInstance.contacts = @[];
        
        Contact *contact1 = [sharedInstance createContact];
        contact1.firstName = @"Leslie";
        contact1.lastName = @"Phelps";
        
        Contact *contact2 = [sharedInstance createContact];
        contact2.firstName = @"Elbert";
        contact2.lastName = @"Wood";
        
        Contact *contact3 = [sharedInstance createContact];
        contact3.firstName = @"Freda";
        contact3.lastName = @"Shaw";
        
        Contact *contact4 = [sharedInstance createContact];
        contact4.firstName = @"Brad";
        contact4.lastName = @"Massey";
        
        Contact *contact5 = [sharedInstance createContact];
        contact5.firstName = @"Roland";
        contact5.lastName = @"Montgomery";
        
        Contact *contact6 = [sharedInstance createContact];
        contact6.firstName = @"Abraham";
        contact6.lastName = @"Gilbert";
        
        Contact *contact7 = [sharedInstance createContact];
        contact7.firstName = @"Lynda";
        contact7.lastName = @"Sparks";
        
        Contact *contact8 = [sharedInstance createContact];
        contact8.firstName = @"Chelsea";
        contact8.lastName = @"Berry";
        
        Contact *contact9 = [sharedInstance createContact];
        contact9.firstName = @"Arlene";
        contact9.lastName = @"Watkins";
        
        Contact *contact10 = [sharedInstance createContact];
        contact10.firstName = @"Nathaniel";
        contact10.lastName = @"Adams";
    });
    
    return sharedInstance;
}


- (Contact *)createContact {
    Contact *contact = [Contact new];
    
    self.contacts = [self.contacts arrayByAddingObject:contact];
    
    return contact;
}

- (NSDictionary *)indexedContacts {
    NSMutableDictionary *contactsDictionary = [NSMutableDictionary new];
    
    for (Contact *contact in self.contacts) {
        NSString *sortLetter = [contact.firstName substringToIndex:1];
        
        BOOL foundKey = NO;
        
        for (NSString *key in [contactsDictionary allKeys]) {
            if ([sortLetter isEqualToString:key]) {
                foundKey = YES;
            }
        }
        
        NSMutableArray *valueArray;
        if (foundKey) {
            valueArray = [((NSArray *)contactsDictionary[sortLetter]) mutableCopy];
        } else {
            valueArray = [NSMutableArray new];
        }
        
        [valueArray addObject:contact];
        
        [contactsDictionary setObject:valueArray forKey:sortLetter];
    }
    
    
    //sort each array
    
    //sort each key, have array of sorted key as property on ContactController
    
    return contactsDictionary;
}

- (void)deleteContact:(Contact *)contact {
    NSMutableArray *contactsCopy = [self.contacts mutableCopy];
    
    [contactsCopy removeObject:contact];
    
    self.contacts = contactsCopy;
}















@end
