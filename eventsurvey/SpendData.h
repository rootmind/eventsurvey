//
//  SpendData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 25/09/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface SpendData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;


@property (readonly) NSString *cifNumber;
@property (readonly) NSString *creditCardNumber;
@property (readonly) NSString *category;
@property (readonly) NSString *trnAmount;
@property (readonly) NSString *recordFound;

@end
