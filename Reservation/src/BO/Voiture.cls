Class BO.Voiture Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoiture(pRequest As msg.creerVoitureDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    
    set pResponse = ##class(msg.creerVoitureRpse).%New()
    set voiture = ##class(data.Voiture).%New()
    set voiture.nom = pRequest.nom
    set voiture.categorie = pRequest.categorie
    set voiture.plaque = pRequest.plaque
    set tsc = voiture.%Save()

    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method suppVoiture(pRequest As msg.suppressionVoitureDmde, Output pResponse As msg.suppressionVoitureRpse) As %Status
{
    set pResponse = ##class(msg.suppressionVoitureRpse).%New()
    set plaque = pRequest.plaque
    if ##class(data.Voiture).consulterParPlaqueExists(plaque, .id) {
        set tsc = ##class(data.Voiture).%DeleteId(id)
        if 'tsc {
            set pResponse.codeRetour = "KO"
            set pResponse.libErreur = "Erreur lors de la suppression de la voiture dans Réservation"
            Quit $$$OK
        }
    }


    set pResponse.codeRetour = "OK"
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.creerVoitureDmde">
        <Method>creerVoiture</Method>
    </MapItem>
    <MapItem MessageType="msg.suppressionVoitureDmde">
        <Method>suppVoiture</Method>
    </MapItem>
</MapItems>
}

}
