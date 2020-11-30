Class webObjet.wsReservation Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property voiture As webObjet.wsVoiture;

Property dateDebut As %TimeStamp;

Property dateFin As %TimeStamp;

Storage Default
{
<Data name="wsReservationState">
<Value name="1">
<Value>voiture</Value>
</Value>
<Value name="2">
<Value>dateDebut</Value>
</Value>
<Value name="3">
<Value>dateFin</Value>
</Value>
</Data>
<State>wsReservationState</State>
<StreamLocation>^webObjet.wsReservationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
