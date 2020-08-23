//
//  PersonalViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 22/08/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "PersonalData.h"
#import "PathData.h"
#import "ErrorData.h"
#import "CoreDataController.h"
#import "MST_EventMO+CoreDataClass.h"
#import "EventTemplateMO+CoreDataClass.h"
#import "SurveyMO+CoreDataClass.h"
#import "EventTemplateData.h"



@interface SurveyViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UIPopoverPresentationControllerDelegate,NSFetchedResultsControllerDelegate>


//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;
@property (strong, nonatomic) NSString *menuName;
//@property (strong, nonatomic) NSString *viewMode;



@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *personalArray;
@property (strong, nonatomic) PersonalData *personalData;

@property (strong, nonatomic) NSMutableArray *errorArray;
@property (strong, nonatomic) ErrorData *errorData;


//@property (strong, nonatomic) NSMutableArray *labelArray;
//@property (strong, nonatomic) NSMutableArray *labelNameArray;
//@property (strong, nonatomic) NSMutableArray *label2Array;
//@property (strong, nonatomic) NSMutableArray *labelName2Array;
//
//@property (strong, nonatomic) NSMutableArray *componentsArray;
//@property (strong, nonatomic) NSMutableArray *componentsNameArray;
//@property (strong, nonatomic) NSMutableArray *components2Array;
//@property (strong, nonatomic) NSMutableArray *componentsName2Array;

@property (strong, nonatomic) NSMutableArray *dataArray;


@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;

@property (strong,nonatomic) NSString *accountType;
@property (strong,nonatomic) CommonTextField *txtRefNo;
@property (strong,nonatomic) UISwitch *swtExistingCustomer;
@property (strong,nonatomic) UIButton *btnExtRelationshipNo;


@property (strong,nonatomic) CommonTextField *txtExtRelation;
@property (strong,nonatomic) CommonTextField *txtExtRelationNo;

@property (strong,nonatomic) CommonTextField *txtCustomerName;
@property (strong,nonatomic) CommonTextField *txtFirstName;
@property (strong,nonatomic) CommonTextField *txtMiddleName;
@property (strong,nonatomic) CommonTextField *txtLastName;


@property (strong,nonatomic) CommonTextField *txtTitle;
@property (strong,nonatomic) CommonTextField *txtCategoryType;
@property (strong,nonatomic) CommonTextField *txtBranch;
@property (strong,nonatomic) CommonTextField *txtJointOwn;
@property (strong,nonatomic) CommonTextField *txtNatureOfRelation;
@property (strong,nonatomic) CommonTextField *txtResidenceStatus;
@property (strong,nonatomic) CommonTextField *txtNationality;
@property (strong,nonatomic) CommonTextField *txtDateOfBirth;
@property (strong,nonatomic) CommonTextField *txtEducation;
@property (strong,nonatomic) CommonTextField *txtMaritalStatus;
@property (strong,nonatomic) CommonTextField *txtGender;
//@property (strong,nonatomic) CommonTextField *txtPreferredLang;
//@property (strong,nonatomic) CommonTextField *txtFamilyUAE;
//@property (strong,nonatomic) CommonTextField *txtFamilySize;
//@property (strong,nonatomic) CommonTextField *txtCarOwnership;
//@property (strong,nonatomic) CommonTextField *txtCarYear;
//@property (strong,nonatomic) CommonTextField *txtMedia;
//@property (strong,nonatomic) CommonTextField *txtFavCity;
//@property (strong,nonatomic) CommonTextField *txtDomicile;
//@property (strong,nonatomic) CommonTextField *txtMotherMaidenName;
//@property (strong,nonatomic) CommonTextField *txtSegment;

@property (strong,nonatomic) CommonTextField *txtPassportNo;
@property (strong,nonatomic) CommonTextField *txtPassportExpDate;
@property (strong,nonatomic) CommonTextField *txtPassportIssueDate;
@property (strong,nonatomic) CommonTextField *txtPassportIssuePlace;
@property (strong,nonatomic) CommonTextField *txtPassportIssueCountry;
@property (strong,nonatomic) CommonTextField *txtEmiratesId;
@property (strong,nonatomic) CommonTextField *txtEmiratesIdExpDate;




@property (strong,nonatomic) NSString *recordStatus;




@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;
//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong,nonatomic) UILabel *lblLoading;
@property (strong, nonatomic) NSString *switchFlag;

@property (strong, nonatomic) NSMutableArray *pathArray;
@property (strong, nonatomic) PathData *pathData;


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSMutableArray *eventDataArray;
@property (strong, nonatomic) NSMutableArray *eventTemplateDataArray;
@property (strong, nonatomic) NSArray *resultsEventTemplate;

@property (strong, nonatomic) NSArray *results;

@property (strong,nonatomic) CommonTextField *txtComponent;
@property (strong,nonatomic) UISwitch *swtComponent;

@property (strong, nonatomic) NSMutableDictionary *listTableName;
@property (strong, nonatomic) NSMutableDictionary *multiListTableName;
@property (strong, nonatomic) NSMutableDictionary *dateFields;
@property (strong, nonatomic) NSMutableDictionary *numericFields;
@property (strong, nonatomic) NSMutableDictionary *fieldNames;

@property (strong, nonatomic) NSMutableDictionary *surveyDataDictionary;
@property (strong, nonatomic) UITableView *tableView;

@property (strong,nonatomic) NSString *eventID;
@property (strong,nonatomic) NSString *eventName;

@property (strong,nonatomic) NSString *instituteID;
@property (strong,nonatomic) NSString *instituteName;




@end

