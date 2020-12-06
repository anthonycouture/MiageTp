Class BO.SortirParcReservation Extends EnsLib.REST.Operation
{

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method sortirParcReservation(pRequest As msg.sortirParcReservationDmde, Output pResponse As msg.sortirParcReservationRpse) As %Status
{
    set pResponse = ##class(msg.sortirParcReservationRpse).%New()

    set httpRequest = ##class(%Net.HttpRequest).%New()
    do ..ObjectToJSONStream(pRequest, .EntityBody)
    set httpRequest.EntityBody = EntityBody

    set tsc = ..Adapter.SendFormDataArray(.httpResponse, "POST", httpRequest)
    do ..JSONStreamToObject(httpResponse.Data,.pResponse,"msg.sortirParcReservationRpse",1)

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.sortirParcReservationDmde">
        <Method>sortirParcReservation</Method>
    </MapItem>
</MapItems>
}

}
