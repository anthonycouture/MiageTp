Class msg.commandeDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property marque As %String;

Property modele As %String;

Property couleur As %String;

Storage Default
{
<Data name="commandeDmdeDefaultData">
<Subscript>"commandeDmde"</Subscript>
<Value name="1">
<Value>marque</Value>
</Value>
<Value name="2">
<Value>modele</Value>
</Value>
<Value name="3">
<Value>couleur</Value>
</Value>
</Data>
<Type>%Storage.Persistent</Type>
}

}
