//
//  EventInstituteData.h
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 28/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventInstituteData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;


@property (readonly) NSString *eventID;
@property (readonly) NSString *instituteID;
@property (readonly) NSString *assignFlag;
@property (readonly) NSString *makerID;
@property (readonly) NSString *makerDateTime;
@property (readonly) NSString *modifierID;
@property (readonly) NSString *modifierDateTime;
@property (readonly) NSString *recordFound;


@end
