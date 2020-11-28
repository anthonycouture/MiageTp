Class BO.Commande Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method commande(pRequest As msg.commandeDmde, Output pResponse As msg.commandeRpse) As %Status
{
    set pResponse = ##class(msg.commandeRpse).%New()

    $$$TRACE("ici")

    set marque = pRequest.marque

    set modele = pRequest.modele

    do ##class(data.Catalogue).consulterParMarqueModele(marque, modele, .contenu)


    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.commandeDmde">
        <Method>commande</Method>
    </MapItem>
</MapItems>
}

}
