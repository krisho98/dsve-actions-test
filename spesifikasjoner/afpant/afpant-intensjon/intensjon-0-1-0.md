# Intensjon om ønsket tinglysingsmetode 
En bank kan sende forespørsel om tinglysingsmetode til en megler basert på kjøpers fødsels- og personnummer og eiendomsobjektet som skal finansieres. Banken inkluderer sin egen intensjon om tinglysingsmetode i forespørselen. 

I et scenario hvor boligkjøper har innhentet tilbud fra flere banker vil megler måtte forvente å motta forespørsel om intensjon fra flere banker. 

Megler vil besvare forespørselen med en forsendelse som inneholder strukturerte data om eiendommen og partene, gjeldende intensjon om tinglysingmetode samt informasjon om hvorvidt signert skjøte/hjemmelsovergang på papir er registrert i meglers depot (papir er reserveløsning).

*NB!* Bank må håndtere NACK-response hvor status er "**UnknownJudicialRegistrationMethod**" (megler har ikke tatt stilling til metode for tinglysing).

Dersom forespørselen ikke kan besvares, vil banken få en feilmelding i retur som beskriver hvorfor megler ikke kan besvare forespørselen.
 
## Håndtering av endret intensjon
Ved endringer i valgt tinglysingmetode må det kringkastes en oppdatering fra den som endrer sin intensjon. 

## Validering og ruting
### Ruting (meglersystem)
- mottakende systemleverandør søker blant alle sine kunders matrikkelenhet(er)
- utvalget avgrenses til matrikkelenheter som tilhører meglersaker hvor organisasjonsnummeret til _enten_ meglerforetaket eller oppgjørsforetaket på meglersaken er lik organisasjonsnummeret pantedokumentet er sendt til ("reportee")
- utvalget avgrenses til meglersaker hvor **minst 1 kjøper i forespørselen er registrert som kjøper på meglersaken** 
 
### Ruting (banksystem)
- mottakende systemleverandør søker blant alle sine kunders matrikkelenhet(er) 
- utvalget avgrenses til lånesaker hvor **minst 1 kjøper i forespørselen er registrert som debitor i lånesaken** 

## Forespørsel om intensjon
Forespørsel sendes mellom partene for å få vite mottakers gjeldende intensjon om tinglysingmetode, i tillegg til å opplyse om avsenders gjeldende intensjon.


### Manifest
(BrokerServiceInitiation.Manifest.PropertyList)

|Manifest key|Type|Required|Beskrivelse|
|--- |--- |--- |--- |
|messageType|String|Yes|JudicialRegistrationMethodIntentRequest|

### Payload
En ZIP-fil som inneholder en XML med requestdata ihht. [definert skjema.](../afpant-model/xsd/dsve-1.0.0.xsd)

#### Om payload *(request)*
- En xml-fil av modell **Intensjonsforespoersel** som er i henhold til [definert skjema.](../afpant-model/xsd/dsve-1.0.0.xsd)
- [Se eksempel på presentasjon](examples/intensjonsforespoersel-example.png)

##### Modell
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
|status|String (enum)|Yes|Denne kan være en av følgende statuser: <br>- RoutedSuccessfully <br>- UnknownJudicialRegistrationMethod (Kun relevant ved svar fra megler til bank: megler har ikke tatt stilling til tinglysingsmetode) <br>- UnknownCadastre (ukjent matrikkelenhet) <br>- BuyerMismatch (fant matrikkelenhet, men kjøper eller navn/id på kjøper matcher ikke registrerte data hos mottaker) <br>- Rejected (sendt til et organisasjonsnummer som ikke lenger har et aktivt kundeforhold hos leverandøren - feil config i Altinn AFPANT, eller ugyldig forsendelse).<br><br>Kun status '**RoutedSuccessfully**' er å anse som ACK (positive acknowledgement) hvor . Øvrige statuser er å anse som NACK (negative acknowledgement).|
|statusDescription|String|Yes|Inneholder en utfyllende human-readable beskrivelse om hvorfor en forsendelse ble NACK'et.|

### Payload
En ZIP-fil som inneholder en XML med requestdata ihht. [definert skjema.](../afpant-model/xsd/dsve-1.0.0.xsd)
		
#### Om payload *(response)*

##### Positiv resultat (ACK)
- Må være en xml-fil av modell **Intensjonssvar** som er ihht. [definert skjema](../afpant-model/xsd/dsve-1.0.0.xsd).
- Se eksempel på presentasjon: [Eksempel](examples/intensjonssvar-example.png)

##### Modell
![model intensjon](examples/intensjonssvar-model.png "Model for intensjonssvar")

##### Negativt resultat (NACK)
- Tom payload returneres (ZIP arkiv med dummy innhold). Manifest key "status" og "statusDescription" må avleses for årsak. 

## Eksempel

### Forespørsel
![Eksempel](examples/intensjonsforespoersel-example.png)

### Svar
![Eksempel](examples/intensjonssvar-example.png)