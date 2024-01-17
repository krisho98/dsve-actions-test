# Melding om oppnådd prioritet (OppnaaddPrioritetOk)
OppnaaddPrioritetOk er en meldingstype som sendes fra megler til bank for å informere om at avtalt prioritet er oppnådd. 
Meldingen kommer etter meldingen GjennomfoertEtinglysing(tinglyst hos Kartverket) som forventes mottatt først. GjennomfoertEtinglysing skal sendes uten opphold så fort som mulig.

## Implementasjonskrav
Banker som ønsker å motta meldingen må være registrert som aktiv i Akeldo registeret med støtte for meldingstypen OppnaaddPrioritetOk.

Når bank sender kjøpers pantedokument elektronisk til megler i form av en SignedMortgageDeed melding, må banken benytte sitt eget organisasjonsnummer som Reportee for meldingen som sendes via Altinn. Dette er for at megler skal kunne vite hvilken bank som skal motta potensiell OppnaaddPrioritetOk melding for det aktuelle pantedokumentet, siden det ikke finnes felter i selve pantedokumentet som er garantert å indikere dette.

## Validering og ruting

### Krav til filnavn i ZIP-arkiv
- Payload filen med OppnaaddPrioritetOk melding må følge konvensjonen "oppnaaddprioritet_*.zip".
- Vedlegget med forsendelsesstatus fra Kartverket må følge konvensjonen "forsendelsesstatus_*.xml".

### Ruting (meglersystem)
Når megler har verifisert oppgjøret og har fastslått av avtalt prioritet er oppnådd indikerer megler dette i systemleverandørs system. Systemleverandøren sjekker om oppdraget inneholder ett eller flere pantedokument fra bank.

For hver av disse pantedokumentene må meglers systemleverandør utføre følgende:
1. Finn organisasjonsnummer for Altinn reportee som sendte SignedMortgageDeed melding til megler med det aktuelle pantedokumentet. Dette organisasjonsnummeret regnes for å være avsender bank som skal motta OppnaaddPrioritetOk melding.
2. Sjekk om avsender bankens organisasjonsnummer er registrert i Akeldo med støtte for meldingstypen "OppnaaddPrioritetOk". Dersom ja, send OppnaaddPrioritetOk melding til dette organisasjonsnummeret.

Merknad: flere pantedokumenter i samme e-tinglysing forsendelse fra samme bank, gitt at banken støtter meldingstypen i Akeldo, medfører OppnaaddPrioritetOk meldinger til banken for hvert enkelt av disse pantedokumentene.

### Ruting (bank)
Så lenge banken har registrert seg på Akeldo med støtte for meldingstypen OppnaaddPrioritetOk skal de kunne motta og prossessere disse meldingene. Det er også lagt opp til enveis kommunikasjon fra megler til bank, slik at bank ikke trenger å sende tilbake bekreftelse på mottak.
Banken bør også være oppmerksom på at hvert pantedokumentet kommer separat, de må selv se om de magler svar på ett ellere flere i saken.

## Meldingstype: OppnaaddPrioritetOk

Meldingstypen OppnaaddPrioritetOk sendes fra megler til bank for å informere om at korrekt prioritet er oppnådd.

### Manifest
(BrokerServiceInitiation.Manifest.PropertyList)

|Manifest key|Type|Obligatorisk|Beskrivelse|
|--- |--- |--- |--- |
|messageType|String|Ja|OppnaaddPrioritetOk|

### Payload
Et ZIP-arkiv med 2 filer:
- En OppnaaddPrioritetOk XML med data ihht. [definert skjema.](../afpant-model/xsd/dsve.xsd)
- Et vedlegg med forsendelsesstatus xml data.

#### Om payload
Følgende info er inkludert om pantedokumentet som ble sendt i SignedMortgageDeed melding fra bank til megler, og nå er tinglyst:

- SendersReference fra Altinn
- Dokumentreferanse

#### Krav/begrensninger
I OppnaaddPrioritetOk meldingen må metadata.ressurser elementet registeres med "application/xml" i feltet "mimetype".
Feltet "navn" må tilsvare navnet på vedlegget (som følger konvensjonen "forsendelsesstatus_*.xml").
Meldingen GjennomfoertEtinglysing skal sendes når tinglysning gjennomført og er en forutsetting for senere forsendelse av OppnaaddPrioritetOk meldingen.
