//
//  DataSyncViewController.h
//  eventsurvey
//
//  Created by Sai Kiran Gandham on 10/14/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Constants.h"
#import "CommonUtils.h"
#import "EventData.h"
#import "EventTemplateData.h"
#import "EventUserData.h"
#import "CoreDataController.h"
#import "InstituteData.h"
#import "EventInstituteData.h"
#import "UsersData.h"
#import "Classes/MST_EventMO+CoreDataProperties.h"
//#import "Classes/MST_EventUserMO+CoreDataProperties.h"
//#import "Classes/MST_InstituteMO+CoreDataProperties.h"
//#import "Classes/MST_EventInstituteMO+CoreDataProperties.h"
#import "Classes/EventTemplateMO+CoreDataProperties.h"
#import "ListMasterData.h"
#import "Classes/MST_ListMasterMO+CoreDataProperties.h"
#import "Classes/UsersMO+CoreDataProperties.h"
#import "SurveyMO+CoreDataClass.h"


@interface DataSyncViewController : UIViewController


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//@property (strong, nonatomic) NSMutableArray *eventDataArray;
//@property (strong, nonatomic) EventData *eventData;

//@property (strong, nonatomic) NSMutableDictionary *surveyDataDictionary;

@end
    
