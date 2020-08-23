//
//  StatusViewController.h
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 01/11/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "CommonUtils.h"
//#import "PersonalData.h"
#import "CoreDataController.h"
#import "MST_EventMO+CoreDataClass.h"
#import "MST_EventUserMO.h"
#import "MST_InstituteMO+CoreDataClass.h"
#import "MST_EventInstituteMO+CoreDataClass.h"
#import "EventTemplateMO+CoreDataClass.h"
#import "ListMasterData.h"
//#import "EventTemplateMO.h"
#import "EventData.h"
#import "EventTemplateData.h"
#import "UsersData.h"
#import "Classes/UsersMO+CoreDataProperties.h"

#import "UserMenuData.h"
#import "Classes/MST_UserMenuMO+CoreDataProperties.h"

@interface StatusViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,NSFetchedResultsControllerDelegate>


//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
//@property (strong, nonatomic) NSString *menuName;

//@property (strong, nonatomic) NSString *actionMode;

//@property (strong, nonatomic) NSString *recordStatus;


//@property (strong, nonatomic) NSDictionary *dataDictionary;

//@property (strong, nonatomic) NSMutableArray *personalArray;
//@property (strong, nonatomic) PersonalData *personalData;


//@property (strong, nonatomic) NSMutableArray *dataArray;


//@property (strong, nonatomic) NSString *refNo;

//@property (strong, nonatomic) NSTimer *timer;
//@property (strong, nonatomic) UILabel *timerView;

//@property (strong, nonatomic) UIToolbar *dateToolBar;
//@property (strong, nonatomic) UIDatePicker *datePicker;

//@property (strong, nonatomic) UIWebView *webView;


//@property (strong,nonatomic) NSString *menuId;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSMutableArray *eventDataArray;

@property (strong, nonatomic) NSArray *resultsEvent;


@end

