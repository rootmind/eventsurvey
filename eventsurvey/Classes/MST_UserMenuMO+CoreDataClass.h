//
//  MST_UserMenuMO+CoreDataClass.h
//  
//
//  Created by Rootmind TechSoft Private Limited on 31/10/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface MST_UserMenuMO : NSManagedObject

+ (NSFetchRequest<MST_UserMenuMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *assignFlag;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *menuID;
@property (nullable, nonatomic, copy) NSString *menuIDValue;
@property (nullable, nonatomic, copy) NSString *userid;


@end

NS_ASSUME_NONNULL_END

#import "MST_UserMenuMO+CoreDataProperties.h"
