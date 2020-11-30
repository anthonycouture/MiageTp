/// 
Class BP.reservationVoiture Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.reservationDmde' response='msg.reservationRpse' height='2000' width='2000' >
<context>
<property name='plaque' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='350' >
<call name='recupVoitureCategorie' target='Reservation' async='0' xpos='200' ypos='250' >
<request type='msg.getVoitureByCategorieDmde' >
<assign property="callrequest.categorie" value="request.categorie" action="set" />
<assign property="callrequest.dateDebut" value="request.dateDebut" action="set" />
<assign property="callrequest.dateFin" value="request.dateFin" action="set" />
</request>
<response type='msg.getVoitureByCategorieRpse' >
<assign property="context.plaque" value="callresponse.plaque" action="set" />
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
