Class BS.ServiceSortirParcVoiture Extends Ens.BusinessService
{

/// Name of the WebService
Parameter SERVICENAME = "ServiceSortirParcVoiture";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
    set tsc = $CASE(pHint,
        "sortirParcVoiture":..sortirParcVoiture(pInput,.pOutput),
	 	: $$$ERROR($$$NotImplemented)
    )
    Quit tsc
}

Method sortirParcVoiture(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("SortirParcVoiture",pInput,.pOutput)
    Quit $$$OK
}

}
