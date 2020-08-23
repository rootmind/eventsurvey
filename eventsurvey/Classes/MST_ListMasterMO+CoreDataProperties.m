//
//  MST_ListMasterMO+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "MST_ListMasterMO+CoreDataProperties.h"

@implementation MST_ListMasterMO (CoreDataProperties)

+ (NSFetchRequest<MST_ListMasterMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MST_ListMaster"];
}

@dynamic code;
@dynamic desc;
@dynamic sync;
@dynamic tableName;

@end
