//
//  EventUserData.h
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 17/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventUserData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *userid;
@property (readonly) NSString *eventID;
@property (readonly) NSString *name;
@property (readonly) NSString *assignFlag;
@property (readonly) NSString *makerID;
@property (readonly) NSString *makerDateTime;
@property (readonly) NSString *modifierID;
@property (readonly) NSString *modifierDateTime;
@property (readonly) NSString *recordFound;


@end
