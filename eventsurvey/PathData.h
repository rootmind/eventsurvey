//
//  PathData.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 10/30/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PathData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;
@property (readonly) NSString *screen;
@property (readonly) NSString *status;
@property (readonly) NSString *recordFound;

@end

