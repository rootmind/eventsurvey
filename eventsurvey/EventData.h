//
//  EventData.h
//  eventsurvey
//
//  Created by Sai Kiran Gandham on 10/14/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *code;
@property (readonly) NSString *desc;
@property (readonly) NSString *tableName;
@property (readonly) NSString *startDate;
@property (readonly) NSString *expiryDate;
@property (readonly) NSString *status;
@property (readonly) NSString *makerID;
@property (readonly) NSString *makerDateTime;
@property (readonly) NSString *modifierID;
@property (readonly) NSString *modifierDateTime;

@property (readonly) NSString *userid;
@property (readonly) NSString *instituteID;
@property (readonly) NSString *instituteName;
@property (readonly) NSString *image;
@property (readonly) NSString *imageFound;
@property (readonly) NSString *avatarImageFound;
@property (readonly) NSString *recordFound;

@end




