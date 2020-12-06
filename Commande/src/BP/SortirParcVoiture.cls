/// 
Class BP.SortirParcVoiture Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.sortirParcVoitureDmde' response='msg.sortirParcVoitureRpse' height='2000' width='2000' >
<sequence xend='200' yend='700' >
<call name='Sortir parc Réservation' target='SortirParcReservation' async='0' xpos='200' ypos='250' >
<request type='msg.sortirParcReservationDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.sortirParcReservationRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<if name='Sortie parc Réservation ?' condition='response.codeRetour="OK"' xpos='200' ypos='350' xend='200' yend='600' >
<true>
<call name='Sortir voiture parc' target='Voiture' async='0' xpos='335' ypos='500' >
<request type='msg.deleteVoitureDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.deleteVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
