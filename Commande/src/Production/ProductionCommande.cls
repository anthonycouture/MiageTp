Class Production.ProductionCommande Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Production.ProductionCommande" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>4</ActorPoolSize>
  <Item Name="Catalogue" Category="" ClassName="BO.Catalogue" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Voiture" Category="" ClassName="BO.Voiture" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="VoitureFile" Category="" ClassName="BO.VoitureFile" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/tmp/</Setting>
  </Item>
  <Item Name="ServiceCatalogue" Category="" ClassName="BS.ServiceCatalogue" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="ServiceVoiture" Category="" ClassName="BS.ServiceVoiture" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="CommanderVoiture" Category="" ClassName="BP.CommanderVoiture" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Plaque" Category="" ClassName="BO.Plaque" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Reservation" Category="" ClassName="BO.Reservation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">52773</Setting>
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="URL">/api/reservation/voiture/</Setting>
    <Setting Target="Adapter" Name="Credentials">intersystem</Setting>
  </Item>
  <Item Name="SortirParcReservation" Category="" ClassName="BO.SortirParcReservation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="HTTPPort">52773</Setting>
    <Setting Target="Adapter" Name="Credentials">intersystem</Setting>
    <Setting Target="Adapter" Name="URL">/api/reservation/sortirparcvoiture/</Setting>
  </Item>
  <Item Name="SortirParcVoiture" Category="" ClassName="BP.SortirParcVoiture" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ServiceSortirParcVoiture" Category="" ClassName="BS.ServiceSortirParcVoiture" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
