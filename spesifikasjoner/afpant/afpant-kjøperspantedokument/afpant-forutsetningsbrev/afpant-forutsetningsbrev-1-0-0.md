# e-tinglysing-afpant-forutsetningsbrev-1.0.0
## Forutsetningsbrev fra bank til megler - AFPANT
Forutsetningsbrev fra bank kan produseres som XML. Dokumentet må da validere i henhold til XSD, og vil bli rendret av mottakers system ved hjelp av XSLT.
Referanse til XSD (xsi:noNamespaceSchemaLocation) og XSLT (<?xml-stylesheet />) må inkluderes i produsert XML slik at dokumentet blir self-contained.

XSD og XSLT vil bli hostet på https://prod.cdn.dsop.no/dsve/

### Prod URI til XSD/XSLT
TODO: endre de 2 linkene under når det er besluttet ny cdn/domain for hosting av filer
- [XSD](https://prod.cdn.dsop.no/dsve/v/2.0.0/xsd/afpant-forutsetningsbrev.xsd)
- [XSLT](https://prod.cdn.dsop.no/dsve/v/2.0.0/xslt/afpant-forutsetningsbrev.xslt)

## Eksempel
[Eksempel på visning av forutsetningsbrev](./afpant-forutsetningsbrev-eksempel.html)
[Eksempel på xml format forutsetningsbrev](./afpant-forutsetningsbrev-eksempel.xml)
