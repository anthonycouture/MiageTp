Class msg.deleteVoitureDmde Extends Ens.Request
{

Property plaque As %String;

Storage Default
{
<Data name="deleteVoitureDmdeDefaultData">
<Subscript>"deleteVoitureDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>deleteVoitureDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
