AndroidApplication AppWithFiveComponents

RootElement AndroidApplicationPolicyFile{
   Package com.htbridge.pivaa
}

Permission perm1 {
  name android.permission.GET_ACCOUNTS
  permissionKind Dangerous
}

Permission perm2 {
name android.permission.READ_PROFILE
permissionKind Signature
}

Activity activity1 {
  name MainActivity
}

Activity activity2 {
name EncryptionActivity
}

Service service1 {
name handlers.VulnerableService
exported true
}

Receiver receiver1 {
name handlers.VulnerableReceiver
exported true
}

Provider provider1 {
name com.android.billingclient.api.ProxyBillingActivity
exported true
GrantURIPermissions true
Authority com.htbridge.pivaa
}

Filter filter1 {
name filter1
}

Filter filter2 {
name filter2
}

AddAction INTO filter1 {
name android.intent.action.MAIN
}

AddAction INTO filter2 {
name service.vulnerable.vulnerableservice.LOG
}

AddCategory INTO filter1 {
name android.intent.category.LAUNCHER
}

AddFilterActivity INTO Acitvity MainActivity {
name filter1
}

AddFilterService INTO Service handlers.VulnerableService{
name filter2
}

