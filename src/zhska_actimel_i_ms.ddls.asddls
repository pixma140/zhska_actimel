@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View'
@Metadata.allowExtensions: true
define view entity ZHSKA_ACTIMEL_I_MS
  as select from zhska_actimel_ms
  association to parent ZHSKA_ACTIMEL_I_CR as _Customer on $projection.CustomerGUID = _Customer.CustomerGUID
  // association to parent ZHSKA_ACTIMEL_I_RL as _Rental on $projection.RentalGUID = _Rental.rentalGUID
{
  key movie_guid            as MovieGUID,
      customer_guid         as CustomerGUID,
      title                 as Title,
      description           as Description,
      rel_date              as ReleaseDate,
      adult_movie           as AdultMovie,
      
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      _Customer
      //_Rental
}
