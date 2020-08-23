//
//  MST_EventMO.h
//  
//
//  Created by Sai Kiran Gandham on 10/15/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface MST_EventMO : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSString *desc;
@property (nullable, nonatomic, retain) NSDate *expiryDate;
@property (nullable, nonatomic, retain) NSDate *makerDateTime;
@property (nullable, nonatomic, retain) NSString *makerID;
@property (nullable, nonatomic, retain) NSDate *modifierDateTime;
@property (nullable, nonatomic, retain) NSString *modifierID;
@property (nullable, nonatomic, retain) NSString *status;
@property (nullable, nonatomic, retain) NSString *tableName;


@end

NS_ASSUME_NONNULL_END

#import "MST_EventMO+CoreDataProperties.h"
