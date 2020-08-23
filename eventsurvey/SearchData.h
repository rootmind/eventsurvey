//
//  SearchData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 18/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface SearchData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;


@property (readonly) NSString *cifNumber;
@property (readonly) NSString *accountNo;
@property (readonly) NSString *creditCardNumber;
@property (readonly) NSString *customerName;
@property (readonly) NSString *recordFound;


@end
