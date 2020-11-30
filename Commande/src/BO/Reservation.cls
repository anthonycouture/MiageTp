Class BO.Reservation Extends EnsLib.REST.Operation
{

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoitureReservation(pRequest As msg.creerVoitureReservationDmde, Output pResponse As msg.creerVoitureReservationRpse) As %Status
{
    set pResponse = ##class(msg.creerVoitureReservationRpse).%New()
    set httpRequest = ##class(%Net.HttpRequest).%New()
    do ..ObjectToJSONStream(pRequest, .EntityBody)
    set httpRequest.EntityBody = EntityBody

    set tsc = ..Adapter.SendFormDataArray(.httpResponse, "POST", httpRequest)

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.creerVoitureReservationDmde">
        <Method>creerVoitureReservation</Method>
    </MapItem>
</MapItems>
}

}
