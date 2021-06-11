@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View'
@Metadata.allowExtensions: true
define root view entity ZHSKA_ACTIMEL_C_CR_ADMIN
  as projection on ZHSKA_ACTIMEL_I_CR
{
  key CustomerGUID,
      CustomerId,
      Lastname,
      Firstname,
      Birthdate,
      RegistrationDate,
      IsActive,
      
      _Movies: redirected to composition child ZHSKA_ACTIMEL_C_MS_ADMIN
}
