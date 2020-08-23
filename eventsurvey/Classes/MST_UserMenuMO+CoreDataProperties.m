//
//  MST_UserMenuMO+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "MST_UserMenuMO+CoreDataProperties.h"

@implementation MST_UserMenuMO (CoreDataProperties)

+ (NSFetchRequest<MST_UserMenuMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MST_UserMenu"];
}

@dynamic assignFlag;
@dynamic desc;
@dynamic menuID;
@dynamic menuIDValue;
@dynamic userid;

@end
