//
//  UserAudit+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "UserAudit+CoreDataProperties.h"

@implementation UserAudit (CoreDataProperties)

+ (NSFetchRequest<UserAudit *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserAudit"];
}

@dynamic loginDateTime;
@dynamic userid;

@end
