Class BO.Reservation Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method getVoitureByCategorie(pRequest As msg.getVoitureByCategorieDmde, Output pResponse As msg.getVoitureByCategorieRpse) As %Status
{
    set pResponse = ##class(msg.getVoitureByCategorieRpse).%New()

    set sql = "select plaque from data.Voiture where categorie = '"_pRequest.categorie_"' and plaque not in ("
    set sql = sql_" SELECT voiture->plaque FROM data.Reservation where voiture->categorie = '"_pRequest.categorie_"'"
    set sql = sql_" and ((dateDebut >= '"_pRequest.dateDebut_"' and dateDebut <= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateFin >= '"_pRequest.dateDebut_"' and dateFin <= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateDebut <= '"_pRequest.dateDebut_"' and dateFin >= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateDebut >= '"_pRequest.dateDebut_"' and dateFin <= '"_pRequest.dateFin_"' ))) "

    set statement=##class(%SQL.Statement).%New()
    do statement.%Prepare(sql)
    set SQLrequest = statement.%Execute()
    do SQLrequest.%Next()
    set plaque = SQLrequest.%Get("plaque")
    set pResponse.plaque = plaque
    
    if $LENGTH(plaque) > 0 {
        set pResponse.codeRetour = "OK"
        Quit $$$OK
    }
    set pResponse.codeRetour = "KO"
    set pResponse.libErreur = "Pas de voiture disponible"
    Quit $$$OK
}

Method creerReservation(pRequest As msg.creerReservationDmde, Output pResponse As msg.creerReservationRpse) As %Status
{
    set pResponse = ##class(msg.creerReservationRpse).%New() 

    set reservation = ##class(data.Reservation).%New()
    do ##class(data.Voiture).consulterParPlaqueExists(pRequest.plaque, .id)
    set reservation.voiture = ##class(data.Voiture).%OpenId(id)
    set reservation.dateDebut = pRequest.dateDebut
    set reservation.dateFin = pRequest.dateFin

    set tsc = reservation.%Save()

    if 'tsc {
            set pResponse.codeRetour = "KO"
            set pResponse.libErreur = "Erreur lors de la réservation"
            Quit $$$OK
    }

    set pResponse.codeRetour = "OK"
    Quit $$$OK
}

Method nbReservationFuture(pRequest As msg.nbReservationFutureDmde, Output pResponse As msg.nbReservationFutureRpse) As %Status
{
    set pResponse = ##class(msg.nbReservationFutureRpse).%New()
    set sql = "select count(*) as nbReservation from data.Reservation"
    set sql = sql_" WHERE dateFin >= NOW() AND voiture->plaque = '"_pRequest.plaque_"'"

    set statement = ##class(%SQL.Statement).%New()
    do statement.%Prepare(sql)
    set sqlRequest = statement.%Execute()
    do sqlRequest.%Next()
    set pResponse.nbReservation = sqlRequest.%Get("nbReservation")
    set pResponse.codeRetour = "OK"
    Quit $$$OK
}

Method suppressionReservation(pRequest As msg.suppressionReservationDmde, Output pResponse As msg.suppressionReservationRpse) As %Status
{
    set pResponse = ##class(msg.suppressionReservationRpse).%New()
    set sql = "delete from data.Reservation where voiture->plaque = '"_pRequest.plaque_"'"
    set statement = ##class(%SQL.Statement).%New()
    do statement.%Prepare(sql)
    set sqlRequest = statement.%Execute()

    set pResponse.codeRetour = "OK"
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.getVoitureByCategorieDmde">
        <Method>getVoitureByCategorie</Method>
    </MapItem>
    <MapItem MessageType="msg.creerReservationDmde">
        <Method>creerReservation</Method>
    </MapItem>
    <MapItem MessageType="msg.nbReservationFutureDmde">
        <Method>nbReservationFuture</Method>
    </MapItem>
    <MapItem MessageType="msg.suppressionReservationDmde">
        <Method>suppressionReservation</Method>
    </MapItem>
</MapItems>
}

}
