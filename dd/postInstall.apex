List<Group> groups = [SELECT Id FROM Group WHERE DeveloperName = 'Data_Dwell_Sales_Enablement'];
Group DDSEGroup = null;
if(groups.size() > 0) {
    DDSEGroup = groups[0];
} else {
    DDSEGroup = new Group(Name = 'Data Dwell Sales Enablement', DeveloperName = 'Data_Dwell_Sales_Enablement', Type='Regular');
    insert DDSEGroup;   
}

User publicUser = [SELECT Id FROM User WHERE Alias = 'guest'];
PermissionSet permSet = [SELECT Id FROM PermissionSet WHERE Name = 'Sales_Enablement_Site'];

PermissionSetAssignment permAssign = new PermissionSetAssignment();
permAssign.AssigneeId = publicUser.Id;
permAssign.PermissionSetId = permSet.Id;
insert permAssign;

GroupMember groupMem = new GroupMember();
groupMem.GroupId = DDSEGroup.Id;
groupMem.UserOrGroupId = publicUser.Id;
insert groupMem;

User adminuser = [SELECT Id FROM User WHERE Name = 'User User'];

ContentWorkspacePermission cwp = [SELECT Id FROM ContentWorkspacePermission WHERE Type = 'Admin'];
ContentWorkspace cp = [SELECT Id FROM ContentWorkspace WHERE Name = 'Asset Library'];

ContentWorkspaceMember cwm = new ContentWorkspaceMember();
cwm.ContentWorkspaceId = cp.Id;
cwm.ContentWorkspacePermissionId = cwp.Id;
cwm.MemberId = publicUser.Id;
insert cwm;

ContentWorkspaceMember cwma = new ContentWorkspaceMember();
cwma.ContentWorkspaceId = cp.Id;
cwma.ContentWorkspacePermissionId = cwp.Id;
cwma.MemberId = adminuser.Id;
insert cwma;