//
//  UserMenuData.h
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 31/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserMenuData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *userid;
@property (readonly) NSString *desc;
@property (readonly) NSString *menuID;
@property (readonly) NSString *assignFlag;
@property (readonly) NSString *menuIDValue;



@end
