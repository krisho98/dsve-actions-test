# e-tinglysing-afpant-forutsetningsbrev-1.0.0
## Forutsetningsbrev fra bank til megler - AFPANT

[XSD](https://github.com/bitsnorge/e-tinglysing-afpant/blob/master/spesifikasjoner/afpant/afpant-kj%C3%B8perspantedokument/afpant-forutsetningsbrev/afpant-forutsetningsbrev-xsd/afpant-forutsetningsbrev-1.0.0.xsd)

[XSLT](https://github.com/bitsnorge/e-tinglysing-afpant/blob/master/spesifikasjoner/afpant/afpant-kj%C3%B8perspantedokument/afpant-forutsetningsbrev/afpant-forutsetningsbrev-xslt/afpant-forutsetningsbrev-1.0.0.xslt)

[Eksempel XML](https://last-opp.pantedokumentet.no/AFPANT/afpant-folgebrev-example1.xml)

## Sammendrag
Forutsetningsbrev fra bank kan produseres som XML. Dokumentet må da validere i henhold til XSD, og vil bli rendret av mottakers system ved hjelp av XSLT.
Referanse til XSD (xsi:noNamespaceSchemaLocation) og XSLT (<?xml-stylesheet />) må inkluderes i produsert XML slik at dokumentet blir self-contained.

TODO: endre når det er besluttet ny cdn for hosting av filer
XSD og XSLT vil bli hostet på https://last-opp.pantedokumentet.no/AFPANT/

### Prod URI til XSD/XSLT
TODO: endre når det er besluttet ny cdn for hosting av filer
- [XSD](https://last-opp.pantedokumentet.no/AFPANT/afpant-folgebrev-1.0.0.xsd)
- [XSLT (uten semver revision)](https://last-opp.pantedokumentet.no/AFPANT/afpant-folgebrev-1.0.xslt)

## Eksempel
TODO: link til eksempel
