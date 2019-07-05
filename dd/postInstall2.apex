Site theSite = [SELECT Id FROM Site LIMIT 1];
SiteDetail theSiteDetail = [SELECT SecureUrl FROM SiteDetail WHERE DurableId = :theSite.Id];
datadwell__DDMicrosites__c mSite = new datadwell__DDMicrosites__c();
mSite.datadwell__Microsite_URL__c = theSiteDetail.SecureUrl;
mSite.Name = 'Data Dwell';
insert mSite;


List<datadwell__Sales_Athlete_Criteria__c> criteriaSettings = new List<datadwell__Sales_Athlete_Criteria__c>();
criteriaSettings.add(new datadwell__Sales_Athlete_Criteria__c(datadwell__Object__c = 'Lead', Name = 'Lead'));
criteriaSettings.add(new datadwell__Sales_Athlete_Criteria__c(datadwell__Object__c = 'Account', Name = 'Account'));
criteriaSettings.add(new datadwell__Sales_Athlete_Criteria__c(datadwell__Object__c = 'Contact', Name = 'Contact'));
criteriaSettings.add(new datadwell__Sales_Athlete_Criteria__c(datadwell__Object__c = 'Case', Name = 'Case'));
upsert criteriaSettings;
