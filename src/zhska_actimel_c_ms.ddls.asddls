@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View'
@Metadata.allowExtensions: true
define view entity ZHSKA_ACTIMEL_C_MS
  as projection on ZHSKA_ACTIMEL_I_MS
{
  key MovieGUID,
      CustomerGUID,
      Title,
      Description,
      ReleaseDate,
      AdultMovie,
      LastChangedAt,
      LocalLastChangedAt,
      LocalLastChangedBy,
      LocalCreatedAt,
      LocalCreatedBy,

      _Customer : redirected to parent ZHSKA_ACTIMEL_C_CR
}
