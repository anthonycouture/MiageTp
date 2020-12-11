Class msg.reservationRpse Extends msg.basic.reponse
{

Property plaque As %String;

Storage Default
{
<Data name="reservationRpseDefaultData">
<Subscript>"reservationRpse"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>reservationRpseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
