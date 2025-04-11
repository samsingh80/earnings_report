namespace com.scb.earningupload;

using {
  cuid,
  managed,
  sap.common.CodeList
} from '@sap/cds/common';

entity Banks : CodeList {
  key code : String(40);
}

entity Quarters : CodeList {
  key code : String(2);
}

entity EarningFiles : cuid, managed {
  bank      : Association to Banks;
  year      : String(4) default '2025';
  quarter   : Association to Quarters;

  @Core.MediaType  : mediaType
  content   : LargeString;

  @Core.IsMediaType: true
  mediaType : String;
  fileName  : String;
  url       : String;
}

@odata.singleton  @cds.persistency.skip
entity VisibilityConfig {
  key ID      : String;
      isAdmin : Boolean;
}
