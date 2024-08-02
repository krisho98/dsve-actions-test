# Løsning for elektroniske skjøtepakker

Prosessen ved elektronisk tinglysing av skjøtepakker, innebærer at kjøpers bank oversender elektronisk signert pantedokument samt forutsetningsbrev til eiendomsmegler/oppgjørsforetak, som deretter tinglyser elektronisk skjøtepakke (e-signert skjøte og pantedokument) hos Kartverket.

Det sendes kvittering fra mottakersystem til avsendersystem med informasjon om forsendelsene kunne rutes korrekt. Kvitteringen skal sendes automatisk fra mottakende system uten opphold enten i form av ACK eller NACK. For NACK benyttes kjente feilkoder der disse er identifisert.

Når kjøpers pantedokument er tinglyst hos Kartverket, sendes det en melding fra megler til bank for å informere om at pantedokument er tinglyst.

## Dokumentasjon
- [Oversendelse av pantedokument - teknisk beskrivelse](./afpant-kj%C3%B8perspantedokument.md)

### Dokumentasjon for tilhørende funksjonaliteter
- [Intensjonsmelding](./../afpant-intensjon/README.md)
- [Statusoppdatering fra megler til bank](./../afpant-gjennomfoertetinglysing/README.md)

##### Forutsetningsbrev (oversendelsesbrev) til megler tilhørende kjøpers pantedokument
- [Forutsetningsbrev - løsningsbeskrivelse](./afpant-forutsetningsbrev/forutsetningsbrev.md)
- [Forutsetningsbrev - teknisk beskrivelse](./afpant-forutsetningsbrev/afpant-forutsetningsbrev.md)
