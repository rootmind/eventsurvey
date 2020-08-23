//
//  MST_EventMO+CoreDataClass.m
//  
//
//  Created by Rootmind TechSoft Private Limited on 29/10/16.
//
//

#import "MST_EventMO+CoreDataClass.h"

@implementation MST_EventMO
+ (NSFetchRequest<MST_EventMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MST_Event"];
}

@dynamic userid;
@dynamic tableName;
@dynamic status;
@dynamic modifierID;
@dynamic modifierDateTime;
@dynamic makerID;
@dynamic makerDateTime;
@dynamic instituteName;
@dynamic instituteID;
@dynamic startDate;
@dynamic expiryDate;
@dynamic desc;
@dynamic code;
@dynamic expiryDate1;

@end
