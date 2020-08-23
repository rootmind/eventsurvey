//
//  ListMasterData.h
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 22/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListMasterData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *code;
@property (readonly) NSString *desc;
@property (readonly) NSString *tableName;
@property (readonly) NSString *sync;

@end
