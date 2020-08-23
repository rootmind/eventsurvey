//
//  PopoverData.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 6/1/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopoverData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *code;
@property (readonly) NSString *desc;
@property (readonly) NSString *filter;
@property (readonly) NSString *recordFound;

@end
