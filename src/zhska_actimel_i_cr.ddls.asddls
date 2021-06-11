@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['CustomerId']
define root view entity ZHSKA_ACTIMEL_I_CR
  as select from zhska_actimel_cr
  composition [0..*] of ZHSKA_ACTIMEL_I_MS as _Movies
// association to parent ZHSKA_ACTIMEL_I_RL as _Rental on $projection.RentalGUID = _Rental.rentalGUID
{
  key customer_guid         as CustomerGUID,
      customer_id           as CustomerId,
      lastname              as Lastname,
      firstname             as Firstname,
      birthdate             as Birthdate,
      reg_date              as RegistrationDate,
      is_active             as IsActive,
      
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

      _Movies
      //_Rental
}
