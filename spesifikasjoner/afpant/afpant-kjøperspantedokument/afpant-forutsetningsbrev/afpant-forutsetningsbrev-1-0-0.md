# e-tinglysing-afpant-forutsetningsbrev-1.0.0
## Forutsetningsbrev fra bank til megler - AFPANT

TODO: bytt til hosted versjon 
[XSD](./afpant-forutsetningsbrev-1.0.0.xsd)

TODO: bytt til hosted versjon 
[XSLT](./afpant-forutsetningsbrev-1.0.0.xslt)

## Sammendrag
Forutsetningsbrev fra bank kan produseres som XML. Dokumentet må da validere i henhold til XSD, og vil bli rendret av mottakers system ved hjelp av XSLT.
Referanse til XSD (xsi:noNamespaceSchemaLocation) og XSLT (<?xml-stylesheet />) må inkluderes i produsert XML slik at dokumentet blir self-contained.

TODO: endre når det er besluttet ny cdn/domain for hosting av filer
XSD og XSLT vil bli hostet på https://last-opp.pantedokumentet.no/AFPANT/

### Prod URI til XSD/XSLT
TODO: endre de 2 linkene under når det er besluttet ny cdn/domain for hosting av filer
- [XSD](https://last-opp.pantedokumentet.no/AFPANT/afpant-folgebrev-1.0.0.xsd)
- [XSLT (uten semver revision)](https://last-opp.pantedokumentet.no/AFPANT/afpant-folgebrev-1.0.xslt)

## Eksempel
TODO: bytt til hosted versjon 
[Eksempel på visning av forutsetningsbrev](./afpant-forutsetningsbrev-eksempel.html)
