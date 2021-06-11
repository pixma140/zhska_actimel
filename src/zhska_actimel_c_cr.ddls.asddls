@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View'
@Metadata.allowExtensions: true
@UI: {
    headerInfo: {
        typeName: 'Customer',
        typeNamePlural: 'Customers',
        title: { type: #STANDARD, value: 'Lastname', label: 'Customer Name' }
    }
}
@ObjectModel.semanticKey: ['CustomerId']
define root view entity ZHSKA_ACTIMEL_C_CR
  as projection on ZHSKA_ACTIMEL_I_CR
{
  key CustomerGUID,
      CustomerId,
      Lastname,
      Firstname,
      Birthdate,
      RegistrationDate,
      IsActive,
      LastChangedAt,
      LocalLastChangedAt,
      LocalLastChangedBy,
      LocalCreatedAt,
      LocalCreatedBy,

      _Movies : redirected to composition child ZHSKA_ACTIMEL_C_MS

}
