//
//  InstituteData.h
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 17/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstituteData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *code;
@property (readonly) NSString *desc;//description



@end
