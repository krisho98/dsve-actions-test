# Kjøpers pantedokument og forutsetningsbrev
 
* Overføring av ett BankId-signert pantedokument (SDO) fra kjøpers bank til eiendomsmegler 
* Overføring av forutsetningsbrev som XML 
* ACK/NACK-kvittering fra mottakersystem til avsendersystem med informasjon om forsendelsen kunne rutes korrekt

For å kunne gjennomføre overføring av pantedokumentet er også bankens forutsetningsbrev inntatt i denne spesifikasjonen.

Forutsetningsbrevet fra bank inneholder normalt sett viktige detaljer om overførselen:
* Informasjon om innbetaler, beløp, kontonummer, KID 
* Strukturerte forutsetninger (iht xsd)

#### Spesifikasjoner
##### Oveføring av kjøpers pantedokument til megler 
* [Spesifikasjon overføring av kjøpers pantedokument](https://github.com/bitsnorge/e-tinglysing-afpant/blob/master/spesifikasjoner/afpant/afpant-kjøperspantedokument/afpant-kjøperspantedokument-1-0-0.md)

##### Forutsetningsbrev (oversendelsesbrev) til megler tilhørende kjøpers pantedokument
* [Spesifikasjon forutsetningsbrev/oversendelsesbrev](https://github.com/bitsnorge/e-tinglysing-afpant/blob/master/spesifikasjoner/afpant/afpant-kjøperspantedokument/afpant-forutsetningsbrev-1-0-0.md)
