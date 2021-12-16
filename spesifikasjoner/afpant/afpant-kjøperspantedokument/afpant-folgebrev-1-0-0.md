# e-tinglysing-afpant-folgebrev-1.0.0
*Følgebrev er gammelt navn på forutsetningsbrev, forutsetningsbrev skal brukes her)*
## Forutsetningsbrev fra bank til megler


[XSD](https://github.com/bitsnorge/e-tinglysing-afpant/blob/master/spesifikasjoner/afpant/afpant-kj%C3%B8perspantedokument/afpant-folgebrev/afpant-folgebrev-xsd/afpant-folgebrev-1.0.0.xsd)

[XSLT](https://github.com/bitsnorge/e-tinglysing-afpant/blob/master/spesifikasjoner/afpant/afpant-kj%C3%B8perspantedokument/afpant-folgebrev/afpant-folgebrev-xslt/afpant-folgebrev-1.0.0.xslt)

[Eksempel XML](https://last-opp.pantedokumentet.no/AFPANT/afpant-folgebrev-example1.xml)

## Sammendrag
Forutsetningsbrev fra bank kan produseres som XML. Dokumentet må da validere i henhold til XSD, og vil bli rendret av mottakers system ved hjelp av XSLT.
Referanse til XSD (xsi:noNamespaceSchemaLocation) og XSLT (<?xml-stylesheet />) må inkluderes i produsert XML slik at dokumentet blir self-contained.

XSD og XSLT vil bli hostet på https://last-opp.pantedokumentet.no/AFPANT/

### Prod URI til XSD/XSLT
- [XSD](https://last-opp.pantedokumentet.no/AFPANT/afpant-folgebrev-1.0.0.xsd)
- [XSLT (uten semver revision)](https://last-opp.pantedokumentet.no/AFPANT/afpant-folgebrev-1.0.xslt)

## Eksempel
XSD.EXE kan brukes for å autogenerere en POCO fra XSD ([Se eksempel](https://github.com/bitsnorge/e-tinglysing-afpant/blob/master/spesifikasjoner/afpant/afpant-kj%C3%B8perspantedokument/afpant-folgebrev/generate-poco-from-xsd.bat))

[Hvordan serialisere AFPANT.Folgebrev til XML med XSD+XSLT referanser](https://github.com/bitsnorge/e-tinglysing-afpant/blob/master/spesifikasjoner/afpant/afpant-kj%C3%B8perspantedokument/afpant-folgebrev-example/Program.cs)

[Eksempel på rendret forutsetningsbrev som html (utgått)](afpant-folgebrev/afpant-folgebrev-xslt/afpant-folgebrev-rendered-example-utgaatt.PNG)

## Forutsetninsbrev XSD diagram
[Diagram av forutsetningsbrev XSD](https://github.com/bitsnorge/e-tinglysing-afpant/blob/master/spesifikasjoner/afpant/afpant-kj%C3%B8perspantedokument/afpant-folgebrev/afpant-folgebrev-xslt/afpant-folgebrev-1.0.0.jpg)
