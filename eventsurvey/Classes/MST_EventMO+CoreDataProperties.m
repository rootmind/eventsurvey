//
//  MST_EventMO+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/14/16.
//
//

#import "MST_EventMO+CoreDataProperties.h"

@implementation MST_EventMO (CoreDataProperties)

+ (NSFetchRequest<MST_EventMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MST_Event"];
}

@dynamic code;
@dynamic desc;
@dynamic dtExpiryDate;
@dynamic dtStartDate;
@dynamic expiryDate;
@dynamic expiryDate1;
@dynamic instituteID;
@dynamic instituteName;
@dynamic makerDateTime;
@dynamic makerID;
@dynamic modifierDateTime;
@dynamic modifierID;
@dynamic startDate;
@dynamic status;
@dynamic tableName;
@dynamic userid;
@dynamic image;
@dynamic imageFound;
@dynamic avatarImageFound;

@end
