//
//  PersonalData.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 6/5/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import "PersonalData.h"

@implementation PersonalData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _existingRefNo=[jsonDictionary objectForKey:@"existingRefNo"];
        _accountType =[jsonDictionary objectForKey:@"accountType"];
        _extCustomerFlag =[jsonDictionary objectForKey:@"extCustomerFlag"];
        _cifNumber = [jsonDictionary objectForKey:@"cifNumber"];
        _extAccountNo = [jsonDictionary objectForKey:@"extAccountNo"];
        _extCreditCardNo = [jsonDictionary objectForKey:@"extCreditCardNo"];
        _extRelationship = [jsonDictionary objectForKey:@"extRelationship"];
        _relationshipNo = [jsonDictionary objectForKey:@"relationshipNo"];
        _customerName = [jsonDictionary objectForKey:@"customerName"];
        _firstName = [jsonDictionary objectForKey:@"firstName"];
        _middleName = [jsonDictionary objectForKey:@"middleName"];
        _lastName = [jsonDictionary objectForKey:@"lastName"];

        
        _title =[jsonDictionary objectForKey:@"title"];
        _categoryType =[jsonDictionary objectForKey:@"categoryType"];
        _branch = [jsonDictionary objectForKey:@"branch"];
        _jointOwn = [jsonDictionary objectForKey:@"jointOwn"];
        _natureOfRelation = [jsonDictionary objectForKey:@"natureOfRelation"];
        _residenceStatus = [jsonDictionary objectForKey:@"residenceStatus"];
        _nationality = [jsonDictionary objectForKey:@"nationality"];
        _dob = [jsonDictionary objectForKey:@"dob"];
        _educated = [jsonDictionary objectForKey:@"educated"];
        _maritalStatus = [jsonDictionary objectForKey:@"maritalStatus"];
        _gender = [jsonDictionary objectForKey:@"gender"];
        
//        _motherMaidenName = [jsonDictionary objectForKey:@"motherMaidenName"];
//        _segment = [jsonDictionary objectForKey:@"segment"];
//        _preferredLanguage = [jsonDictionary objectForKey:@"preferredLanguage"];
//        _familyInUAE = [jsonDictionary objectForKey:@"familyInUAE"];
//        _familySizeUAE = [jsonDictionary objectForKey:@"familySizeUAE"];
//        _carOwnership = [jsonDictionary objectForKey:@"carOwnership"];
//        _carYear = [jsonDictionary objectForKey:@"carYear"];
//        _media =[jsonDictionary objectForKey:@"media"];
//        _favouriteCity =[jsonDictionary objectForKey:@"favouriteCity"];
//        _domicile =[jsonDictionary objectForKey:@"domicile"];
        
//        _preferredLanguageValue = [jsonDictionary objectForKey:@"preferredLanguageValue"];
//        _familyInUAEValue=[jsonDictionary objectForKey:@"familyInUAEValue"];
//        _familySizeUAEValue = [jsonDictionary objectForKey:@"familySizeUAEValue"];
//        _carOwnershipValue=[jsonDictionary objectForKey:@"carOwnershipValue"];
//        
//        _mediaValue =[jsonDictionary objectForKey:@"mediaValue"];
//        _favouriteCityValue=[jsonDictionary objectForKey:@"favouriteCityValue"];
        
        
        
        _passportNo = [jsonDictionary objectForKey:@"passportNo"];
        _passportIssueDate = [jsonDictionary objectForKey:@"passportIssueDate"];
        _passportExpDate = [jsonDictionary objectForKey:@"passportExpDate"];
        _passportIssuePlace = [jsonDictionary objectForKey:@"passportIssuePlace"];
        _passportIssueCountry= [jsonDictionary objectForKey:@"passportIssueCountry"];
        _emiratesID = [jsonDictionary objectForKey:@"emiratesID"];
        _emiratesIDExpDate = [jsonDictionary objectForKey:@"emiratesIDExpDate"];
        _makerId = [jsonDictionary objectForKey:@"makerId"];
        _makerDateTime = [jsonDictionary objectForKey:@"makerDateTime"];
        
        
        _passportIssueCountryValue= [jsonDictionary objectForKey:@"passportIssueCountryValue"];
        
        _extRelationshipValue = [jsonDictionary objectForKey:@"extRelationshipValue"];
        _titleValue =[jsonDictionary objectForKey:@"titleValue"];
        _categoryTypeValue =[jsonDictionary objectForKey:@"categoryTypeValue"];
        _branchValue = [jsonDictionary objectForKey:@"branchValue"];
        _jointOwnValue=[jsonDictionary objectForKey:@"jointOwnValue"];
        _natureOfRelationValue = [jsonDictionary objectForKey:@"natureOfRelationValue"];
        _residenceStatusValue=[jsonDictionary objectForKey:@"residenceStatusValue"];
        _nationalityValue=[jsonDictionary objectForKey:@"nationalityValue"];
        _educatedValue=[jsonDictionary objectForKey:@"educatedValue"];
        _maritalStatusValue=[jsonDictionary objectForKey:@"maritalStatusValue"];
        _genderValue=[jsonDictionary objectForKey:@"genderValue"];
        
      
        

        
        _recordStatus = [jsonDictionary objectForKey:@"recordStatus"];
        
        
        // Assign all properties with keyed values from the dictionary

//        _eNamePerformedBy = [jsonDictionary objectForKey:@"eNamePerformedBy"];
//        _eNamePerformedDate = [jsonDictionary objectForKey:@"eNamePerformedDate"];
//        _eNameMatchFlag = [jsonDictionary objectForKey:@"eNameMatchFlag"];
//        _eNamePerformedName = [jsonDictionary objectForKey:@"eNamePerformedName"];
//        _eNameResult = [jsonDictionary objectForKey:@"eNameResult"];
//        _eNameComment = [jsonDictionary objectForKey:@"eNameComment"];
//        _shortName = [jsonDictionary objectForKey:@"shortName"];
//        _branch = [jsonDictionary objectForKey:@"branch"];
//        _jointOwn = [jsonDictionary objectForKey:@"jointOwn"];
//        _natureOfRelation = [jsonDictionary objectForKey:@"natureOfRelation"];
//        _residenceStatus = [jsonDictionary objectForKey:@"residenceStatus"];
//        _nationality = [jsonDictionary objectForKey:@"nationality"];
//        _dob = [jsonDictionary objectForKey:@"dob"];
//        _educated = [jsonDictionary objectForKey:@"educated"];
//        _maritalStatus = [jsonDictionary objectForKey:@"maritalStatus"];
//        _gender = [jsonDictionary objectForKey:@"gender"];
//        _preferredLanguage = [jsonDictionary objectForKey:@"preferredLanguage"];
//        _familyInUAE = [jsonDictionary objectForKey:@"familyInUAE"];
//        _familySizeUAE = [jsonDictionary objectForKey:@"familySizeUAE"];
//        _carOwnership = [jsonDictionary objectForKey:@"carOwnership"];
//        _carYear = [jsonDictionary objectForKey:@"carYear"];
//        _media = [jsonDictionary objectForKey:@"media"];
//        _favouriteCity = [jsonDictionary objectForKey:@"favouriteCity"];
//        _domicile = [jsonDictionary objectForKey:@"domicile"];
//        _passportNo = [jsonDictionary objectForKey:@"passportNo"];
//        _passportIssueDate = [jsonDictionary objectForKey:@"passportIssueDate"];
//        _passportExpDate = [jsonDictionary objectForKey:@"passportExpDate"];
//        _passportIssuePlace = [jsonDictionary objectForKey:@"passportIssuePlace"];
//        _passportIssueCountry= [jsonDictionary objectForKey:@"passportIssueCountry"];
//        _immiFileNumber= [jsonDictionary objectForKey:@"immiFileNumber"];
//        _visaIssuePlace= [jsonDictionary objectForKey:@"visaIssuePlace"];
//        _visaIssueDate= [jsonDictionary objectForKey:@"visaIssueDate"];
//        _visaExpDate= [jsonDictionary objectForKey:@"visaExpDate"];
//        _drivingLicenseNo= [jsonDictionary objectForKey:@"drivingLicenseNo"];
//        _drivingLicenseExpDate= [jsonDictionary objectForKey:@"drivingLicenseExpDate"];
//        _laborCardNo = [jsonDictionary objectForKey:@"laborCardNo"];
//        _laborCardExpDate = [jsonDictionary objectForKey:@"laborCardExpDate"];
//        _emiratesID = [jsonDictionary objectForKey:@"emiratesID"];
//        _emiratesIDExpDate = [jsonDictionary objectForKey:@"emiratesIDExpDate"];
//        _guardianName = [jsonDictionary objectForKey:@"guardianName"];
//        _introName = [jsonDictionary objectForKey:@"introName"];
//        _introAccountNo = [jsonDictionary objectForKey:@"introAccountNo"];
//        _introCustType = [jsonDictionary objectForKey:@"introCustType"];
//        _introSegment = [jsonDictionary objectForKey:@"introSegment"];
//        _introIndustry = [jsonDictionary objectForKey:@"introIndustry"];
//        _introBusinessGroup = [jsonDictionary objectForKey:@"introBusinessGroup"];
//        _introBranch = [jsonDictionary objectForKey:@"introBranch"];
//        _introGeography = [jsonDictionary objectForKey:@"introGeography"];
//        _introRMID = [jsonDictionary objectForKey:@"introRMID"];
//        _introSSO = [jsonDictionary objectForKey:@"introSSO"];
 
    
        /*_duplicateCheck = [jsonDictionary objectForKey:@"duplicateCheck"];
        _occupationType = [jsonDictionary objectForKey:@"occupationType"];
        _occupation = [jsonDictionary objectForKey:@"occupation"];
        _designation = [jsonDictionary objectForKey:@"designation"];
        _orgName = [jsonDictionary objectForKey:@"orgName"];
        _otherOrgName = [jsonDictionary objectForKey:@"otherOrgName"];
        _joiningDate = [jsonDictionary objectForKey:@"joiningDate"];
        _monthlySalary = [jsonDictionary objectForKey:@"monthlySalary"];
        _employeeNo = [jsonDictionary objectForKey:@"employeeNo"];
        _mailOption = [jsonDictionary objectForKey:@"mailOption"];
        _debitCardDeliveryChnl = [jsonDictionary objectForKey:@"debitCardDeliveryChnl"];
        _eStatement = [jsonDictionary objectForKey:@"eStatement"];
        _email = [jsonDictionary objectForKey:@"email"];
        _email2 = [jsonDictionary objectForKey:@"email2"];
        _mobile = [jsonDictionary objectForKey:@"mobile"];
        _mobileSP = [jsonDictionary objectForKey:@"mobileSP"];
        _mobile2 = [jsonDictionary objectForKey:@"mobile2"];*/
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end

