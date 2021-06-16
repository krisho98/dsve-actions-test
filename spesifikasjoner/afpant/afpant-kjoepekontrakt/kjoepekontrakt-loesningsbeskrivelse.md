Kjøpekontrakt - Løsningsbeskrivelse
===================================
---
# Innledning
Dette dokumentet beskriver løsning for oversendelse av kjøpekontrakt fra megler til bank. Kjøpekontrakten skal kunne sendes både som strukturerte data og som signert dokument, og informasjon skal også kunne sendes før endelig dokument er signert.

## Overordnet beskrivelse
Kjøpekontrakt eller informasjon fra kjøpekontrakten skal kunne oversendes fra megler til bank, via allerede etablert løsning mot AFPANT.

En bank kan sende forespørsel om kjøpekontrakt til en megler basert på kjøpers fødselsnummer (11 siffer). Megler vil besvare forespørselen med en forsendelse som inneholder strukturerte data, samt en signert versjon av den fulle kontrakten. Dersom den faktiske kjøpekontrakten ikke er signert, skal kun den strukturerte delen returneres. Dersom forespørselen ikke kan besvares, vil banken få en feilmelding i retur som beskriver hvorfor megler ikke kan besvare forespørselen.

# Informasjonsflyt
## Henvendelse fra bank
Ved henvendelse fra bank til megler, med ønske om å få oversendt kjøpekontrakt, skal banken sende følgende informasjon til meglers organisasjonsnummer;

| Én av kjøpernes fødselsnummer |
|---|

Meldingstype: [KjoepekontraktforespoerselFraBank](./kjoepekontrakt-teknisk-beskrivelse.md#meldingstype-kjoepekontraktforespoerselfrabank)

## Svar fra megler
Ved henvendelse fra bank om oversendelse av kjøpekontrakt, skal megler sende strukturert informasjon, i tillegg til signert kjøpekontrakt dersom denne er signert når henvendelsen kommer. 
Følgende informasjon skal oversendes som strukturerte data;

|Datafelt|Sendes ved endring|
|:-------|:-----------------|
|**Mottaker:** Bank/Finansieringsselskaps firmanavn / Org.nummer                                     |      |
|**Avsender:** Meglerforetak / Org.nr. / Ansvarlig megler / Mobilnummer / Mailadresse                |      |
|**Oppgjørsavdeling:** Inkludert oppgjørsmeglers fulle adresse                                       |      |
|**Oppdragsnummer:**                                                                                 |      |
|**Oppgjørsinformasjon:** Kontonummer / KID nummer / betalingsmelding                                | :white_check_mark: |
|**Eiendomsinformasjon:** Kommunenummer / Gårdsnummer / Bruksnummer / Festenummer / Seksjonsnummer / Adresse / Postnummer (det må være mulig med flere gårds- og bruksnummer) Ved andel/aksje: Organisasjonsnummer / Andelsnummer /Aksjenummer(Informasjon om personlige sameier og hvorvidt de skal pantsettes må inkluderes) | :white_check_mark: |
|**Salgssum:**                                                                                       | :white_check_mark: |
|**Omkostninger for kjøper:** (Eks. boligkjøperforsikring pga. manglende felt)                       | :white_check_mark: |
|**Oppgjørsbeløp:** Kjøpesum + kjøpsomkostninger (det skal angis om beløpet er tentativt eller satt) | :white_check_mark: |
|**Signeringsdato:** (dersom det finnes i meglersystemene)                                           |      |
|**Overtagelsesdato:** Denne skal ikke fylles ut dersom nybygg                                       | :white_check_mark: |
|**Andel fellesgjeld:**                                                                              |      |
|**Andel fellesformue:**                                                                             |      |
|**Selger:** Navn og fødselsnummer på alle selgere, dersom selger ikke er hjemmelshaver               |      |
|**Hjemmelshaver:** Navn og fødselsnummer på alle hjemmelshavere                                      |      |
|**Kjøper:** Navn og fødselsnummer på alle kjøpere                                                    | :white_check_mark: |
|**Kjøpers eierandel:** Oppgitt i brøk pr kjøper                                                     | :white_check_mark: |
|**Objektstype:** Type eiendom/bygning                                                |      |
|**Link til salgsoppgave:** (Valgfritt felt)                                                         |      |
|**Signert kjøpekontrakt:** (Valgfritt felt)                                                         | :white_check_mark: |

Det er et ønske om at dersom ikke all strukturert informasjon er lagt inn i meglersystemet enda, skal megler likevel sende det som finnes av informasjon. 
Bank vil så få push-varsel om oppdatert informasjon så snart dette er lagt til. Kun endringer i de datafeltene som er merket over vil medføre push-varsel.
*For at dette skal være mulig, må også skjemaet (XSD-filen) gjenspeile dette ved at felter som kan mangle må defineres som valgfrie.*


Signert kjøpekontrakt skal alltid sendes elektronisk, uavhengig av om det er elektronisk signert, eller om det sendes en PDF av et fysisk signert dokument.

Meldingstype: [KjoepekontraktSvarFraMegler](./kjoepekontrakt-teknisk-beskrivelse.md#meldingstype-kjoepekontraktsvarframegler)

# Alternative flyter

## Kjøpekontrakten er ikke signert
Dersom kjøpekontrakten ikke er signert på det tidspunktet bank ber om data, skal det som finnes av strukturert informasjon sendes til banken. Resterende informasjon vil kunne ettersendes sammen med det signerte dokumentet.

Det skal gå en pushvarsling fra meglersystemet til banken eller bankene som har bedt om kjøpekontrakt så snart kjøpekontrakten er 
signert eller det er endringer i datafeltene. Dette skal sendes som en egen [meldingstype](./kjoepekontrakt-teknisk-beskrivelse.md#meldingstype-kjoepekontraktframegler). 
For at banken skal kunne koble kjøpekontrakten til sin egen sak, er det viktig at bankens referanse fra kjøpekontraktforespørselen er med.

Det er viktig at meglersystemene sørger for at det signerte dokumentet alltid inneholder lik informasjon 
som det som ligger av strukturerte data.

Det skal ikke sendes et dokument ved siden av de strukturerte dataene, dersom det ikke finnes et signert dokument.

## Kunden har kjøpt flere boliger
Dersom kunden har kjøpt flere boliger via samme megler og en henvendelse fra bank får treff på flere aktive oppdrag, 
skal informasjon om alle oppdragene sendes til banken. Banken må selv håndtere dette i sine systemer, og lage en løsning 
som støtter at rådgiver kan måtte velge mellom de ulike kjøpekontraktene.

## Oversendt informasjon er endret
Det er viktig at banken har oppdatert informasjon i systemene og at denne er lik det som ligger i det signerte dokumentet. 
Dersom megler endrer eller legger til informasjon i meglersystemene, må banken få beskjed om dette. Det gjøres ved at 
meglersystemet sender en [melding](./kjoepekontrakt-teknisk-beskrivelse.md#meldingstype-kjoepekontraktframegler) til banken. 

Hvilke felter som skal trigge en melding til banken om at det har skjedd en endring, er merket i tabellen under [Svar fra megler](#svar-fra-megler).

Meldingstype: [KjoepekontraktFraMegler](./kjoepekontrakt-teknisk-beskrivelse.md#meldingstype-kjoepekontraktframegler)

## Det finnes ingen oppdrag på kunden
Dersom det ikke finnes noen megleroppdrag på angitt fødselsnummer, må megler kunne svare med en beskjed om dette.

## Oversendelse uten forespørsel fra bank
I tilfeller hvor megler har informasjon om banken som har verifisert finansiering, vil det være mulig for megler å sende kjøpekontrakt 
til bank når denne er signert, uten å først ha mottatt en forespørsel fra banken. 
Dette innebærer at megler kan sende kjøpekontrakt og strukturerte data ved hjelp av en pushmelding til banken.
I slike tilfeller vil megler da ikke kunne fylle ut bankens referanse i meldingen!

Meldingstype: [KjoepekontraktFraMegler](./kjoepekontrakt-teknisk-beskrivelse.md#meldingstype-kjoepekontraktframegler)

## Boligen blir kjøpt på forkjøpsrett
Megler bør avvente signering av kjøpekontrakt til etter forkjøpsretten er avklart. I de tilfellene banken får oversendt en signert kjøpekontrakt, kan de derfor alltid regne med at eventuell forkjøpsrett allerede er avklart.

## Ny, signert kjøpekontrakt
Ved signifikante endringer i kjøpekontrakten, kan en ny kjøpekontrakt opprettes og signeres.
Signifikante endringer er:
* Kjøper lagt til eller fjernet
* Eiendom/andel lagt til eller fjernet. 
  
Banken skal da få oversendt den nye, signerte kjøpekontrakten sammen med strukturerte data.

Meldingstype: [KjoepekontraktFraMegler](./kjoepekontrakt-teknisk-beskrivelse.md#meldingstype-kjoepekontraktframegler)

