Class msg.suppressionVoitureDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property plaque As %String;

Storage Default
{
<Data name="suppressionVoitureDmdeDefaultData">
<Subscript>"suppressionVoitureDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>suppressionVoitureDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
