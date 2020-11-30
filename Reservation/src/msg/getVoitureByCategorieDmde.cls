Class msg.getVoitureByCategorieDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property categorie As %String;

Property dateDebut As %TimeStamp;

// mm/jj/aaaa

Property dateFin As %TimeStamp;

Storage Default
{
<Data name="getVoitureByCategorieDmdeDefaultData">
<Subscript>"getVoitureByCategorieDmde"</Subscript>
<Value name="1">
<Value>categorie</Value>
</Value>
<Value name="2">
<Value>dateDebut</Value>
</Value>
<Value name="3">
<Value>dateFin</Value>
</Value>
</Data>
<DefaultData>getVoitureByCategorieDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
