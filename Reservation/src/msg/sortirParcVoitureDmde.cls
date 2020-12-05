Class msg.sortirParcVoitureDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property plaque As %String;

Storage Default
{
<Data name="sortirParcVoitureDmdeDefaultData">
<Subscript>"sortirParcVoitureDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>sortirParcVoitureDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
