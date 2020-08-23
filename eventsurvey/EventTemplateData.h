//
//  EventTemplateData.h
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 17/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface EventTemplateData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *seqNo;
@property (readonly) NSString *eventRefNo;
@property (readonly) NSString *eventID;
@property (readonly) NSString *labelName;
@property (readonly) NSString *component;
@property (readonly) NSString *viewOrder;
@property (readonly) NSString *mandatory;
@property (readonly) NSString *fieldName;
@property (readonly) NSString *status;
@property (readonly) NSString *listTableName;
@property (readonly) NSString *makerID;
@property (readonly) NSString *makerDateTime;
@property (readonly) NSString *modifierID;
@property (readonly) NSString *modifierDateTime;
@property (readonly) NSString *recordFound;

@end
