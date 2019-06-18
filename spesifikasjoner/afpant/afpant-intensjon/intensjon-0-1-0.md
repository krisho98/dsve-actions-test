# Intensjon om ønsket tinglysingsmetode 
En bank kan sende forespørsel om tinglysingsmetode til en megler basert på kjøpers fødsels- og personnummer og eiendomsobjektet som skal finansieres. Banken inkluderer sin egen intensjon om tinglysingsmetode i forespørselen. Banken kan også angi (valgfritt) om hvorvidt låneavtale er inngått. 

I et scenario hvor boligkjøper har innhentet tilbud fra flere banker vil megler måtte forvente å motta forespørsel om intensjon fra flere banker. Informasjon om at låneavtale er inngått er en saksopplysning til megler som kan forenkle videre samhandling.

Megler vil besvare forespørselen med en forsendelse som inneholder strukturerte data samt gjeldende intensjon om tinglysingmetode.

*NB!* Bank må håndtere at gjeldende metode kan ha verdi  "**Uavklart**" (megler har ikke tatt stilling til metode).

Dersom forespørselen ikke kan besvares, vil banken få en feilmelding i retur som beskriver hvorfor megler ikke kan besvare forespørselen.

## Forspørsel om intensjon
Forespørsel sendes fra bank til megler for å få vite gjeldende intensjon om tinglysingmetode.

*NB!* Ved endringer av tinglysingmetode må det kringkastes en oppdatering fra meglersystem til alle banker som har tidligere forespurt intensjon.

Det forventes at positivt svar er en melding som definert under.

### Implementasjonsbeskrivelse: ruting (meglersystem)
- mottakende systemleverandør søker blant alle sine kunders matrikkelenhet(er)
- utvalget avgrenses til matrikkelenheter som tilhører meglersaker hvor organisasjonsnummeret til _enten_ meglerforetaket eller oppgjørsforetaket på meglersaken er lik organisasjonsnummeret pantedokumentet er sendt til ("reportee")
- utvalget avgrenses til meglersaker hvor **minst 1 kjøper i forespørselen er registrert som kjøper på meglersaken** 
 
### Implementasjonsbeskrivelse: ruting (banksystem)
@TODO: angi fornuftige krav til ruting ved kringkasting av endring fra meglersystem til banksystem.

### Manifest
(BrokerServiceInitiation.Manifest.PropertyList)

|Manifest key|Type|Required|Beskrivelse|
|--- |--- |--- |--- |
|messageType|String|Yes|JudicialRegistrationMethodIntentRequest|

### Payload
En ZIP-fil som inneholder en XML med requestdata ihht. [definert skjema.](../afpant-model/xsd/dsve-1.0.0.xsd)

#### Om payload *(request)*
- En xml-fil som er i henhold til xsd-filen.
- [Se eksempel på presentasjon](examples/intensjonsforespoersel-example.png)

##### Model
![model intensjonsforespørsel](examples/intensjonsforespoersel-model.png "Model for forespørsel om kjøpekontrakt")
<hr/>

## Svar på intensjon
Svar fra meglersystem til banksystem eller banksystem til meglersystem (ved oppdatering av intensjon fra megler).

Dersom avsender oppgir referanse skal denne inkluderes som mottakers referanse i svaret (noden "avsender/referanse" fra request kopieres til noden "mottaker/referanse" i response).

### Manifest
(BrokerServiceInitiation.Manifest.PropertyList)

|Manifest key|Type|Required|Beskrivelse|
|--- |--- |--- |--- |
|messageType|String|Yes|JudicialRegistrationMethodIntentResponse|

### Payload
En ZIP-fil som inneholder en XML med responsdata ihht. gitte xsd.
Tilknytting av ZIP-fil til forsendelsen kan gjøres ved bruk av BrokerServiceExternalBasicStreamedClient / StreamedPayloadBasicBE.
		
#### Om payload *(response)*

##### Positiv resultat
- Må være en xml-fil som er ihht. [definert skjema](../afpant-model/xsd/dsve-1.0.0.xsd).
- Se eksempel på presentasjon [Eksempel](examples/intensjonssvar-example.png)

##### Model
![model intensjon](examples/intensjonssvar-model.png "Model for intensjonssvar")

##### Negativt resultat
- @todo: Må definere hvor ack/navk-informasjon skal legges

## Eksempel

### Forespørsel
![Eksempel](examples/intensjonsforespoersel-example.png)

### Svar
![Eksempel](examples/intensjonssvar-example.png)