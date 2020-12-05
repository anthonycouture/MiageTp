/// 
Class BP.sortirParcVoiture Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.sortirParcVoitureDmde' response='msg.sortirParcVoitureRpse' height='2000' width='2000' >
<context>
<property name='nbReservation' type='%Integer' instantiate='0' />
</context>
<sequence xend='200' yend='800' >
<call name='Nombre de réservation' target='Reservation' async='0' xpos='200' ypos='250' >
<request type='msg.nbReservationFutureDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.nbReservationFutureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
<assign property="context.nbReservation" value="callresponse.nbReservation" action="set" />
</response>
</call>
<if name='Voiture non réserver ?' condition='context.nbReservation=0' xpos='200' ypos='350' xend='200' yend='700' >
<true>
<call name='Supprimer les réservations' target='Reservation' async='0' xpos='199' ypos='485' >
<request type='msg.suppressionReservationDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.suppressionReservationRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<call name='Supprimer voiture' target='Voiture' async='0' xpos='203' ypos='589' >
<request type='msg.suppressionVoitureDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.suppressionVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
</true>
<false>
<assign name="code retour" property="response.codeRetour" value="&quot;KO&quot;" action="set" xpos='470' ypos='500' />
<assign name="lib erreur" property="response.libErreur" value="&quot;Voiture réservé&quot;" action="set" xpos='470' ypos='600' />
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
