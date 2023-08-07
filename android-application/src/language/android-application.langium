grammar AndroidApplication

entry Model:
    'AndroidApplication' name=ID
    rootElement+=RootElement
    (sdk+=SDK)?
    (permissions+=Permission*)*
    activities+=Activity+
    (services+=Service*)*
    (receivers+=Receiver*)*
    (providers+=Provider*)*
    (filters+=Filter*)*
    (addActions+=AddAction*)*
    (addCategories+=AddCategory*)*
    (addFilterActivity+=AddFilterActivity*)*
    (addFilterService+=AddFilterService*)*
    (addFilterReceiver+=AddFilterReceiver*)*
    (addFilterProvider+=AddFilterProvider*)*
;


RootElement: 

    'RootElement' name=ID '{'
    ('Package' Package=IDDOTS)
    ('VersionCode'  VersionCode=NUMBER)?
    ('VersionName' VersionName=VERSIONName)?
    '}'
;    

SDK:
'SDK' name=ID '{'
'MinSdkVersion' MinSdkVersion=NUMBER
'TargetSdkVersion' TargetSdkVersion=NUMBER
'MaxSdkVersion' MaxSdkVersion=NUMBER
'}'
;

Permission:
   'Permission' name=ID '{'
   'name'  name=IDDOTS
   ('permissionKind' ^type=ProtectionLevel)?
'}'
;

ProtectionLevel:
    Normal| Dangerous | Signature | SignatureOrSystem
;

Normal:
   name='Normal'
;

Dangerous:

   name='Dangerous'
;

Signature:
    name='Signature'
;

SignatureOrSystem:
   name='SignatureOrSystem'
;


Activity:
'Activity' name=ID '{'
'name' name=IDDOTS
('exported' exported=BType)?
'}'
;

Service:
'Service' name=ID '{'
'name' name=IDDOTS
('exported' exported=BType)?
'}'
;

Receiver:
'Receiver' name=ID '{'
'name' name=IDDOTS
('exported' exported=BType)?
'}'
;

Provider:
'Provider' name=ID '{'
('name' name=IDDOTS)
('exported' exported=BType)?
('GrantURIPermissions' grantURIPermissions=BType)?
('Authority' authority=IDDOTS)
'}'
;

Filter:
'Filter' name=ID '{'
('name' name=IDDOTS)
'}'
;


BType:
  True|False
;

True:
 name='true'
;

False:
 name='false'
;

AddAction:
'AddAction' 'INTO' (Filter=[Filter:ID])? '{'
'name' name=IDDOTS
'}'
;

AddCategory:
'AddCategory' 'INTO' (Filter=[Filter:ID])? '{'
'name' name=IDDOTS
'}'
;

AddFilterActivity:
'AddFilterActivity' 'INTO' 'Acitvity'(Activity=[Activity:IDDOTS])?'{'
'name' (Filter=[Filter:ID])?
'}'
;

AddFilterService:
'AddFilterService' 'INTO' 'Service'((Service=[Service:IDDOTS]) | (Service=[Service:IDDOTS]))?'{'
'name' (Filter=[Filter:ID])?
'}'
;

AddFilterReceiver:
'AddFilterReceiver' 'INTO' 'Receiver'((Receiver=[Receiver:IDDOTS]) | (Service=[Service:IDDOTS]))?'{'
'name' (Filter=[Filter:ID])?
'}'
;

AddFilterProvider:
'AddFilterProvider' 'INTO' 'Provider'((Provider=[Provider:IDDOTS]) | (Service=[Service:IDDOTS]))?'{'
'name' (Filter=[Filter:ID])?
'}'
;

IDDOTS returns string:
   (ID)*('.')?(ID)*('.')?(ID)*('.')?(ID)*('.')?ID ;

VERSIONName returns string:
   NUMBER'.'NUMBER;

hidden terminal WS: /\s+/;
terminal ID: /[_a-zA-Z][\w_]*/;
terminal NUMBER: /[0-9]+/;


hidden terminal ML_COMMENT: /\/\*[\s\S]*?\*\//;
hidden terminal SL_COMMENT: /\/\/[^\n\r]*/;