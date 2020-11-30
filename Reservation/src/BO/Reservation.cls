Class BO.Reservation Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method getVoitureByCategorie(pRequest As msg.getVoitureByCategorieDmde, Output pResponse As msg.getVoitureByCategorieRpse) As %Status
{
    $$$TRACE("0")
    set pResponse = ##class(msg.getVoitureByCategorieRpse).%New()

    set sql = "select plaque from data.Voiture where categorie = '"_pRequest.categorie_"' and plaque not in ("
    set sql = sql_" SELECT voiture->plaque FROM data.Reservation where voiture->categorie = '"_pRequest.categorie_"'"
    set sql = sql_" and ((dateDebut >= '"_pRequest.dateDebut_"' and dateDebut <= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateFin >= '"_pRequest.dateDebut_"' and dateFin <= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateDebut <= '"_pRequest.dateDebut_"' and dateFin >= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateDebut >= '"_pRequest.dateDebut_"' and dateFin <= '"_pRequest.dateFin_"' ))) "

    $$$TRACE(sql)
    set statement=##class(%SQL.Statement).%New()
    $$$TRACE("1")
    do statement.%Prepare(sql)
    $$$TRACE("2")
    set SQLrequest = statement.%Execute()
    $$$TRACE("3")
    do SQLrequest.%Next()
    $$$TRACE("7")
    set plaque = SQLrequest.%Get("plaque")
    $$$TRACE("8")
    set pResponse.plaque = plaque
    

    set pResponse.codeRetour = "OK"
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.getVoitureByCategorieDmde">
        <Method>getVoitureByCategorie</Method>
    </MapItem>
</MapItems>
}

}
