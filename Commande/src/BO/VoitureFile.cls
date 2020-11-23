Class BO.VoitureFile Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method pushFileVoiture(pRequest As msg.pushVoitureFileDmde, Output pResponse As msg.pushVoitureFileRpse) As %Status
{
  Set pResponse = ##class(msg.pushVoitureFileRpse).%New()
  $$$TRACE(pRequest)

  Set file = ##class(%Library.FileBinaryStream).%New()

  do file.Write(pRequest.voiture.marque_";"_pRequest.voiture.modele_";"
    _pRequest.voiture.categorie_";"_pRequest.voiture.plaque_";"
    _pRequest.voiture.couleur_";"_pRequest.voiture.nbPlaces)

  Set tsc = ..Adapter.PutStream("titi.csv", file)

  
  if tsc{
    set pResponse.codeRetour = "OK"
  }
  else{
    set pResponse.codeRetour = "KO"
  }

  Quit $$$OK
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="msg.pushVoitureFileDmde">
        <Method>pushFileVoiture</Method>
    </MapItem>>
</MapItems>
}

}
