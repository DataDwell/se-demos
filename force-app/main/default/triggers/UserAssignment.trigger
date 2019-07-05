// Dirty user trigger for scratch orgs, max 1 user created
trigger UserAssignment on User (after insert) {
    for(User u : Trigger.new) {
        PermissionSet permSet = [SELECT Id FROM PermissionSet WHERE Name = 'Sales_Athlete_Admin'];
        
        PermissionSetAssignment permAssign = new PermissionSetAssignment();
        permAssign.AssigneeId = u.Id;
        permAssign.PermissionSetId = permSet.Id;
        insert permAssign;
        
        ContentWorkspacePermission cwp = [SELECT Id FROM ContentWorkspacePermission WHERE Type = 'Admin'];
        ContentWorkspace cp = [SELECT Id FROM ContentWorkspace WHERE Name = 'Asset Library'];
        
        ContentWorkspaceMember cwm = new ContentWorkspaceMember();
        cwm.ContentWorkspaceId = cp.Id;
        cwm.ContentWorkspacePermissionId = cwp.Id;
        cwm.MemberId = u.Id;
        insert cwm;
    }
}