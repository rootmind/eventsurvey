//
//  CustomerData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 24/09/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface CustomerData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;


@property (readonly) NSString *availableBalance;
@property (readonly) NSString *accountCurrency;
@property (readonly) NSString *assets;
@property (readonly) NSString *liabilities;
@property (readonly) NSString *recordFound;


@end
