//
//  ContactData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 11/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface ContactData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;
@property (readonly) NSString *mailOption;
@property (readonly) NSString *debitCardDeliveryChnl;
@property (readonly) NSString *eStatement;
@property (readonly) NSString *email;
@property (readonly) NSString *email2;
@property (readonly) NSString *mobile;
@property (readonly) NSString *mobileSP;
@property (readonly) NSString *mobile2;
@property (readonly) NSString *courierAdd;

@property (readonly) NSString *recordStatus;
@property (readonly) NSString *recordFound;

@property (readonly) NSString *mailOptionValue;
@property (readonly) NSString *debitCardDeliveryChnlValue;
@property (readonly) NSString *eStatementValue;
@property (readonly) NSString *mobileSPValue;

@end