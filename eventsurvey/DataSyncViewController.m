//
//  DataSyncViewController.m
//  eventsurvey
//
//  Created by Sai Kiran Gandham on 10/14/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import "DataSyncViewController.h"

@interface DataSyncViewController ()

@end

@implementation DataSyncViewController

//@synthesize eventDataArray;
//@synthesize eventData;

@synthesize managedObjectContext;
@synthesize managedObjectModel;
@synthesize persistentStoreCoordinator;

//@synthesize surveyDataDictionary;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *btnDownload = [[UIButton alloc ] init];//WithFrame:CGRectMake(120, 200, 60, 30) ];
    [btnDownload setTitle:@"Download" forState:UIControlStateNormal];
    //btnDownload.titleLabel.text=@"Login";
    //[btnDownload setTitleColor:[UIColor grayColor] forState: UIControlStateNormal];
    //btnDownload.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btnDownload.layer.borderColor=[UIColor grayColor].CGColor;
    btnDownload.layer.borderWidth=0.5f;
    [btnDownload setBackgroundColor:[UIColor strongAzureColor]];
    [btnDownload setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //btnDownload.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    btnDownload.titleLabel.font = [UIFont systemFontOfSize:18];
    btnDownload.layer.cornerRadius=5.0f;
    //btnDownload.layer.masksToBounds=YES;
    //btnDownload.clipsToBounds=YES;
    [btnDownload addTarget:self action:@selector(doDownload) forControlEvents:UIControlEventTouchUpInside];
    btnDownload.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnDownload];
    
        //-----login button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDownload attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDownload attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDownload attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    
    CoreDataController *coreDataController=[CoreDataController sharedCoreDataController];

    managedObjectContext = coreDataController.managedObjectContext;
    managedObjectModel=coreDataController.managedObjectModel;
    persistentStoreCoordinator = coreDataController.persistentStoreCoordinator;
    
}

- (void) doDownload {
    
    
    //------validation starts---------
 
    NSLog(@"download clicked");
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    

    //Download MST_Event data
    
    [self buildJSONEvent];
    [self buildJSONEventTemplate];
    [self buildJSONListMaster];
    [self buildJSONSaveSurveyData];

    //[self buildJSONEventUser];
   // [self buildJSONInstitute];
   // [self buildJSONEventInstitute];
    
    [self buildJSONUsers];
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    

    
    
    
    
}
- (void) buildJSONEvent {
    

    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                              @"userid":@"MST_Event"
                              
                              };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchEventsDownload" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{

                NSLog(@"buildJSONEvent");
                [self parseResponseEvent:dictionary:@"fetchEventsDownload":@"eventWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End

        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONEvent  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONEvent Code");
    }
    
    
}


- (void) parseResponseEvent:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
               // Create a new array to hold the locations
                NSMutableArray *eventDataArray = [[NSMutableArray alloc] init];
                EventData *eventData=nil;
                
                
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    
                    eventData = [[EventData alloc] initWithJSONDictionary:dict];
                    
                    //NSLog(@" eventData Code %@",eventData.code);
                    
                    [eventDataArray addObject:eventData];
                }

                NSLog(@"data count %lu",(unsigned long)eventDataArray.count);

                NSLog(@"Before Delete");
        
                //---To Delete----
                NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_Event"];
                NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];

                NSError *deleteError = nil;
                [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];

                 NSLog(@"Before Insert");

                //---To Insert----

                for (int i=0; i<=eventDataArray.count-1; i++) {

                    MST_EventMO *eventMO = (MST_EventMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_Event" inManagedObjectContext:managedObjectContext];
        
                    eventData = [eventDataArray objectAtIndex:i];
                    
                    eventMO.code=eventData.code;
                    eventMO.desc=eventData.desc;
                    //eventMO.makerDateTime=eventData.makerDateTime;
                    eventMO.makerID=eventData.makerID;
                    //eventMO.modifierDateTime=eventData.modifierDateTime;
                    eventMO.modifierID=eventData.modifierID;
                    eventMO.status=eventData.status;
                    eventMO.tableName=eventData.tableName;
                    eventMO.userid=eventData.userid;
                    eventMO.instituteID=eventData.instituteID;
                    eventMO.instituteName=eventData.instituteName;
                    eventMO.startDate=eventData.startDate;
                    eventMO.expiryDate=[NSString stringWithFormat:@"%@", eventData.expiryDate];
                    
                    
                    
                    
                     NSLog(@"Results in EventMO Save %@",eventMO.desc);
                    
                }

                NSError *error = nil;
                if ([managedObjectContext save:&error] == NO) {
                    NSAssert(NO, @"Error saving context parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
                }
        
        
                NSLog(@"Before Fetch Event");
                //---To Fetch----
                NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MST_Event"];
                NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
                if (!results) {
                    NSLog(@"Error fetching Event objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
                }
        
                //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
                NSLog(@"Return values from Event MO  results %@",results);
                //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
                
                //NSLog(@"Return values from MO desc value %@",eventDataMO.desc);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseEvent code %@ reason %@ " , [exception name], [exception reason]);
        
         [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseEvent Code");
    }
    
}

- (void) buildJSONEventTemplate {
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"userid":@"EventTemplate"
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchEventTemplateDownload" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONEventTemplate");
                [self parseResponseEventTemplate:dictionary:@"fetchEventTemplateDownload":@"eventTemplateWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONEventTemplate  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONEventTemplate Code");
    }
    
    
}


- (void) parseResponseEventTemplate:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *eventTemplateDataArray = [[NSMutableArray alloc] init];
        EventTemplateData *eventTemplateData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            eventTemplateData = [[EventTemplateData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventData Code %@",eventData.code);
            
            [eventTemplateDataArray addObject:eventTemplateData];
        }
        
        NSLog(@"data count %lu",(unsigned long)eventTemplateDataArray.count);
        
        NSLog(@"Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_EventTemplate"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert");
        
        //---To Insert----
        
        for (int i=0; i<=eventTemplateDataArray.count-1; i++) {
            
            EventTemplateMO *eventTemplateMO = (EventTemplateMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_EventTemplate" inManagedObjectContext:managedObjectContext];
            
            eventTemplateData = [eventTemplateDataArray objectAtIndex:i];
            
           eventTemplateMO.seqNo=eventTemplateData.seqNo;
           eventTemplateMO.eventRefNo=eventTemplateData.eventRefNo;
           eventTemplateMO.eventID=eventTemplateData.eventID;
           eventTemplateMO.labelName=eventTemplateData.labelName;
           eventTemplateMO.component=eventTemplateData.component;
           eventTemplateMO.viewOrder=eventTemplateData.viewOrder;
           eventTemplateMO.mandatory=eventTemplateData.mandatory;
           eventTemplateMO.fieldName=eventTemplateData.fieldName;
           eventTemplateMO.status= eventTemplateData.status;
           eventTemplateMO.listTableName=eventTemplateData.listTableName;
           eventTemplateMO.makerID=eventTemplateData.makerID;
           //eventTemplateMO.makerDateTime=eventTemplateData.makerDateTime;
           eventTemplateMO.modifierID=eventTemplateData.modifierID;
           //eventTemplateMO.modifierDateTime=eventTemplateData.modifierDateTime;
            
            
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseEventTemplate: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        
        NSLog(@"Before Fetch EventTemplate");
        //---To Fetch----
        NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"MST_EventTemplate"];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching EventTemplate objects parseResponseEventTemplate: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        NSLog(@"Return values from EventTemplate MO  results %@",results);
        //EventTemplateMO *eventTemplateDataMO=(EventTemplateMO *)results[0];
        
        //NSLog(@"Return values from MO desc value %@",eventTemplateDataMO.component);
        //NSLog(@"Return values from MO SeqNo value %@",eventTemplateDataMO.seqNo);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseEventTemplate code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseEventTemplate Code");
    }
    
}


- (void) buildJSONEventUser {
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"userid":@"EventUser"
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchEventUserDownload" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONEventUser");
                [self parseResponseEventUser:dictionary:@"fetchEventUserDownload":@"eventUserWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONEventUser  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONEventUser Code");
    }
    
    
}


- (void) parseResponseEventUser:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *eventUserDataArray = [[NSMutableArray alloc] init];
        EventUserData *eventUserData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            eventUserData = [[EventUserData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventUserData Code %@",eventUserData.code);
            
            [eventUserDataArray addObject:eventUserData];
        }
        
        NSLog(@"data count %lu",(unsigned long)eventUserDataArray.count);
        
        NSLog(@"Before Delete EventUser");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_EventUser"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert EventUser");
        
        //---To Insert----
        
        for (int i=0; i<=eventUserDataArray.count-1; i++) {
            
            MST_EventUserMO *eventUserMO = (MST_EventUserMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_EventUser" inManagedObjectContext:managedObjectContext];
            
            eventUserData = [eventUserDataArray objectAtIndex:i];
            
            eventUserMO.userid=eventUserData.userid;
            eventUserMO.modifierID=eventUserData.modifierID;
            //eventUserMO.modifierDateTime=eventUserData.modifierDateTime;
            eventUserMO.makerID=eventUserData.makerID;
            //eventUserMO.makerDateTime=eventUserData.makerDateTime;
            eventUserMO.eventID=eventUserData.eventID;
            eventUserMO.assigned=eventUserData.assignFlag;
            
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseEventUser: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        NSLog(@"Before Fetch EventUser");
        //---To Fetch----
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MST_EventUser"];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching Event objects parseResponseEventUser: %@\n%@", [error localizedDescription], [error userInfo]);
        }

        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];

        NSLog(@"Return values from EventUser MO  results %@",results);
        //MST_EventUserMO *eventUserDataMO=(MST_EventUserMO *)results[0];
        
        //NSLog(@"Return values from MO EventUser desc value %@",eventUserDataMO.eventID);
        //NSLog(@"Return values from MO EventUser SeqNo value %@",eventUserDataMO.description);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseEventUser code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseEventUser Code");
    }
    
}


- (void) buildJSONInstitute {
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"tableName":@"MST_Institute"
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchMasterData" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONInstitute");
                [self parseResponseInstitute:dictionary:@"fetchMasterData":@"popoverWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONInstitute  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONInstitute   Code");
    }
    
    
}


- (void) parseResponseInstitute :(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *instituteDataArray = [[NSMutableArray alloc] init];
        InstituteData *instituteData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            instituteData = [[InstituteData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventData Code %@",eventData.code);
            
            [instituteDataArray addObject:instituteData];
        }
        
        NSLog(@"data count %lu",(unsigned long)instituteDataArray.count);
        
        NSLog(@"Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_Institute"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert");
        
        //---To Insert----
        
        for (int i=0; i<=instituteDataArray.count-1; i++) {
            
            MST_InstituteMO *instituteMO = (MST_InstituteMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_Institute" inManagedObjectContext:managedObjectContext];
            
            instituteData = [instituteDataArray objectAtIndex:i];
            
            instituteMO.code=instituteData.code;
            instituteMO.desc=instituteData.desc;
           
           
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseInstitute: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        NSLog(@"Before Fetch Institute");
        //---To Fetch----
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MST_Institute"];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching Event objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
        }

        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];

        NSLog(@"Return values from Institute MO  results %@",results);
        //MST_InstituteMO *instituteDataMO=(MST_InstituteMO *)results[0];
        
        //NSLog(@"Return values from MO Institute desc value %@",instituteDataMO.code);
        //NSLog(@"Return values from MO Institute SeqNo value %@",instituteDataMO.description);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseInstitute code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseInstitute Code");
    }
    
}


- (void) buildJSONListMaster {
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"userid":@"ListMasterValues"
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchListMasterValuesDownload" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONListMaster");
                [self parseResponseListMaster:dictionary:@"fetchListMasterValuesDownload":@"listMasterValuesWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONListMaster  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONListMaster Code");
    }
    
    
}


- (void) parseResponseListMaster:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *listMasterDataArray = [[NSMutableArray alloc] init];
        ListMasterData *listMasterData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            listMasterData = [[ListMasterData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventData Code %@",eventData.code);
            
            [listMasterDataArray addObject:listMasterData];
        }
        
        NSLog(@"ListMaster data count %lu",(unsigned long)listMasterDataArray.count);
        
        NSLog(@"ListMaster Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_ListMaster"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert List Master");
        
        //---To Insert----
        
        for (int i=0; i<=listMasterDataArray.count-1; i++) {
            
            MST_ListMasterMO *listMasterMO = (MST_ListMasterMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_ListMaster" inManagedObjectContext:managedObjectContext];
            
            listMasterData = [listMasterDataArray objectAtIndex:i];
            
            listMasterMO.code=listMasterData.code;
            listMasterMO.desc=listMasterData.desc;
            listMasterMO.tableName=listMasterData.tableName;
            listMasterMO.sync=listMasterData.sync;
            
            
            
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseEventTemplate: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        
        NSLog(@"Before Fetch ListMaster");
        //---To Fetch----
        NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"MST_ListMaster"];
        [request setReturnsObjectsAsFaults:NO];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching ListMaster objects parseResponseListMaster: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        NSLog(@"Return values from ListMaster MO  results %@",results);
        //MST_ListMasterMO *listMasterDataMO=(MST_ListMasterMO *)results[0];
        
        //NSLog(@"Return values from MO ListMaster desc value %@",listMasterDataMO.tableName);
        //NSLog(@"Return values from MO ListMaster SeqNo value %@",listMasterDataMO.desc);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseListMaster code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseListMaster Code");
    }
    
}


- (void) buildJSONEventInstitute {
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"userid":@"EventInstitute"
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchEventInstituteDownload" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONEventInstitute");
                [self parseResponseEventInstitute:dictionary:@"fetchEventInstituteDownload":@"eventInstituteWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONEventInstitute  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONEventInstitute Code");
    }
    
    
}


- (void) parseResponseEventInstitute:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *eventInstituteDataArray = [[NSMutableArray alloc] init];
        EventInstituteData *eventInstituteData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            eventInstituteData = [[EventInstituteData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventData Code %@",eventData.code);
            
            [eventInstituteDataArray addObject:eventInstituteData];
        }
        
        NSLog(@"EventInstitute data count %lu",(unsigned long)eventInstituteDataArray.count);
        
        NSLog(@"EventInstitute Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_EventInstitute"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert eventInstitute");
        
        //---To Insert----
        
        for (int i=0; i<=eventInstituteDataArray.count-1; i++) {
            
           MST_EventInstituteMO *eventInstituteMO = (MST_EventInstituteMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_EventInstitute" inManagedObjectContext:managedObjectContext];
            
            eventInstituteData = [eventInstituteDataArray objectAtIndex:i];
            
            eventInstituteMO.eventID=eventInstituteData.eventID;
            eventInstituteMO.instituteID=eventInstituteData.instituteID;
            eventInstituteMO.assigned=eventInstituteData.assignFlag;
            eventInstituteMO.makerID=eventInstituteData.makerID;
            //eventInstituteMO.makerDateTime=eventInstituteData.makerDateTime;
            eventInstituteMO.modifierID=eventInstituteData.modifierID;
            //eventInstituteMO.modifierDateTime=eventInstituteData.modifierDateTime;
            
            
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseEventInstitute: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        
        NSLog(@"Before Fetch EventInstitute");
        //---To Fetch----
        NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"MST_EventInstitute"];
        [request setReturnsObjectsAsFaults:NO];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching EventInstitute objects parseResponseEventInstitute: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        NSLog(@"Return values from EventInstitute MO  results %@",results);
        //MST_EventInstituteMO *eventInstituteMO=(MST_EventInstituteMO *)results[0];
        
        //NSLog(@"Return values from MO EventInstituteMO desc value %@",eventInstituteMO.eventID);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseEventInstituteMO code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseEventInstituteMO Code");
    }
    
}

- (void) buildJSONUsers{
    
    
    NSLog(@"DataSync buildJSONUsers");
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"userid":@"Users"
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchUsersDownload" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONUsers");
                [self parseResponseUsers:dictionary:@"fetchUsersDownload":@"usersWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONUsers  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONUsers Code");
    }
    
    
}


- (void) parseResponseUsers:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *usersDataArray = [[NSMutableArray alloc] init];
        UsersData *usersData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            usersData = [[UsersData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventData Code %@",eventData.code);
            
            [usersDataArray addObject:usersData];
        }
        
        NSLog(@"Users data count %lu",(unsigned long)usersDataArray.count);
        
        NSLog(@"Users Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Users"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert Users");
        
        //---To Insert----
        
        for (int i=0; i<=usersDataArray.count-1; i++) {
            
            UsersMO *usersMO = (UsersMO *)[NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:managedObjectContext];
            
            usersData = [usersDataArray objectAtIndex:i];
            
            usersMO.userid=usersData.userid;
            usersMO.password=usersData.password;
            usersMO.name=usersData.name;
            usersMO.status=usersData.status;
            usersMO.lastLoginDate=usersData.lastLoginDate;
            usersMO.userGroup=usersData.userGroup;
        
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseUsers: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        
        NSLog(@"Before Fetch Users");
        //---To Fetch----
        NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"Users"];
        [request setReturnsObjectsAsFaults:NO];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching Users objects parseResponseUsers: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        NSLog(@"Return values from Users MO  results %@",results);
        UsersMO *usersMO=(UsersMO *)results[0];
        
        NSLog(@"Return values from MO UsersMO desc value %@\n%@",usersMO.userid, usersMO.userGroup);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseUsersMO code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseUsersMO Code");
    }
    
}



- (void) buildJSONSaveSurveyData {
    
    
    NSDictionary *jsonDictionary;
    

    
    
    @try{
        
        
        NSLog(@"Before Fetch buildJSONSaveSurveyData");
        
        //---To Fetch----
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Survey"];
        [request setReturnsObjectsAsFaults:NO];
        NSError *error=nil;
        [request setPredicate:[NSPredicate predicateWithFormat:@"sync == %@", @"N"]];
    
        NSArray *resultsSurveyData = [managedObjectContext executeFetchRequest:request error:&error];
        if (!resultsSurveyData) {
            NSLog(@"Error fetching buildJSONSaveSurveyData objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        NSLog(@"Return values from buildJSONSaveSurveyData MO  results %@",resultsSurveyData);
        
        SurveyMO *surveyMO;
        
        for (int i=0; i<=[resultsSurveyData count]-1; i++)
        {

              surveyMO=(SurveyMO *)resultsSurveyData[i];
              NSLog(@" SaveSurveyData surveyMO   %@\n%@\n%@",surveyMO.eventID,surveyMO.surveyData,surveyMO.sync);
            
       
        
        //NSLog(@"Return values from buildJSONSaveSurveyData desc value %@",surveyMOResults.surveyData);
        
       // NSMutableDictionary *surveyDataDictionary=[[NSMutableDictionary alloc] init];
//        surveyDataDictionary=[[NSMutableDictionary alloc] init];

//        
//         NSLog(@"Return values from SaveSurveyData surveyDataDictionary  results %@",surveyDataDictionary);
                //-------
                jsonDictionary= @{
                                  @"eventID":surveyMO.eventID,
                                  @"surveyData": surveyMO.surveyData, //@"Lee|West Godavari|29/06/2016|MultiText|Ram|Male",
                                  @"sync":surveyMO.sync //@"N"
                                 
                                  
                                  };
                
               
                
                
                //jsonDictionary=[NSDictionary dictionaryWithObject:resultsSurveyData forKey:resultsSurveyData];
                
                //NSString *jsonString = [container JSONRepresentation];
                
                NSMutableArray *jsonMutableArray=nil;
                
                
                
                //Connect Host Start
                [CommonUtils connectHost :@"insertSurveyData" :jsonDictionary:self:@"N":jsonMutableArray:nil: ^(NSDictionary *dictionary){
                    
                    
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //[self parseResponse:dictionary:@"insertSurveyData":@"surveyWrapper"];
                        
                        //NSLog(@"valid user :%@",users.validUser);
                        
                       
                       

                        
                    });//dispatch end
                    
                    
                }]; //ConnectHost End
        
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in validate user  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in validate user Code");
    }
    
    
}



-(void)startActivityIndicator
{

    
    [CommonUtils startActivityIndicator:self];
    
    
}

-(void)stopActivityIndicator
{

    
    [CommonUtils stopActivityIndicator:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
