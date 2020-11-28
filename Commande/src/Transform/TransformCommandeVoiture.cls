Class Transform.TransformCommandeVoiture Extends Ens.DataTransformDTL [ DependsOn = (data.Catalogue, data.Voiture) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='data.Catalogue' targetClass='data.Voiture' create='new' language='objectscript' >
<assign value='source.marque' property='target.marque' action='set' />
<assign value='source.modele' property='target.modele' action='set' />
<if condition='source.nbPlaces=2' >
<true>
<assign value='2 Places' property='target.categorie' action='insert' key='"1"' />
</true>
<false>
<if condition='source.nbPlaces=7' >
<true>
<assign value='7 Places' property='target.categorie' action='set' key='"2"' />
</true>
<false>
<assign value='source.type' property='target.categorie' action='set' />
</false>
</if>
</false>
</if>
<assign value='source.nbPlaces' property='target.nbPlaces' action='set' />
</transform>
}

}
