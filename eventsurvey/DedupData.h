//
//  DedupData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 06/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface DedupData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;


@property (readonly) NSString *cifNumber;
@property (readonly) NSString *accountNumber;
@property (readonly) NSString *creditCardNumber;
@property (readonly) NSString *customerName;
//@property (readonly) NSString *firstName;
@property (readonly) NSString *dob;
@property (readonly) NSString *passportNumber;
@property (readonly) NSString *emiratesId;
@property (readonly) NSString *recordFound;

@end
