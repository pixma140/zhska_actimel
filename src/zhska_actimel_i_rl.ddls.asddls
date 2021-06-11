@AbapCatalog.sqlViewName: 'ZHSKA_ACTIMEL_I'
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View'
@Metadata.allowExtensions: true
@AbapCatalog.preserveKey: true
define root view ZHSKA_ACTIMEL_I_RL
  as select from zhska_actimel_rl
  //composition [1..1] of ZHSKA_ACTIMEL_I_CR as _Customer
  //composition [1..1] of ZHSKA_ACTIMEL_I_MS as _Movies
{
  key rental_guid           as RentalGuid,

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt

    //  _Customer,
    //  _Movies

}
