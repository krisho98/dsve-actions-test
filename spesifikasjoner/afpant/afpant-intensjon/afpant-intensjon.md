# Intensjon om tinglysingsmetode
## Introduksjon
Tinglysing av hjemmelsovergang og kjøpers pantedokument kan utføres enten elektronisk eller på papir.

Meldingstypene for intensjon skal brukes for å koordinere valgt metode mellom kjøpers bank og megler.

Signering av skjøtet og signering av pantedokumentet skjer på ulike tidspunkt i flyten, noe som kan skape utfordringer ved ulik intensjon mellom bank/megler.

## Referat fra arbeidsgruppe (DSVE)
[Les referat av arbeidsgruppens beslutning (PDF)](250619-Intensjonsmeldingen-spec-GODKJENT.pdf)

## Forutsetninger
* Megler tar stilling til sin intensjon om tinglysingmetode i eget fagsystem
* Bank sender sin intensjon til megler (_IntensjonFraBank_)
* Megler svarer bank med sin gjeldende tinglysingmetode (_IntensjonssvarFraMegler_)
* Dette betyr at bank ikke vet meglers intensjon før bank sender forespørsel om intensjon
* Endringer i intensjon skal kringkastes (_Intensjonsendring_)

*NB!* I startfasen skal megler alltid ha (signerte) papirdokumenter tilgjengelig selv om intensjon er elektronisk tinglysing.

## Krav til bank og megler

* Endring av intensjon skal alltid sendes til motpart (via meldingstype "Intensjonsendring").

## Flytskisse: Elektronisk tinglysing
![Flytdiagram](examples/intensjon-flytdiagram-eksempel1.PNG)

## Implementasjonsdetaljer
Se [her for tekniske detaljer](intensjon-0-1-0.md)