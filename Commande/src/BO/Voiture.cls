Class BO.Voiture Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoiture(pRequest As msg.creerVoitureDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    
    set pResponse = ##class(msg.creerVoitureRpse).%New()
    set voiture = ##class(data.Voiture).%New()
    do ##class(Transform.WsVoitureToVoiture).Transform(pRequest.voiture,.voiture)
    set tsc = voiture.%Save()

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method deleteVoiture(pRequest As msg.deleteVoitureDmde, Output pResponse As msg.deleteVoitureRpse) As %Status
{
    
    set pResponse = ##class(msg.deleteVoitureRpse).%New()
    set plaque = pRequest.plaque
    set voitureExist = ##class(data.Voiture).consulterParPlaqueExists(plaque, .id)
    if voitureExist = 1 {
        set tsc = ##class(data.Voiture).%DeleteId(id)
        set pResponse.codeRetour = "OK"
    }
    else {
        set pResponse.codeRetour = "KO"
    }
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.creerVoitureDmde">
        <Method>creerVoiture</Method>
    </MapItem>
    <MapItem MessageType="msg.deleteVoitureDmde">
        <Method>deleteVoiture</Method>
    </MapItem>
</MapItems>
}

}
