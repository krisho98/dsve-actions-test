# Altinn: maskinell kontroll av delegerte rettigheter (for systemleverandører)
Det er mulighet for at det delegeres mangelfulle rettigheter til systemleverandør. Slike mangelfulle oppsett kan være vanskelig å avdekke, og kan manifestere seg på forskjellig vis (for eksempel at en kunde har delegert leserettighet men ikke skriverettighet).

For å unngå mangelfulle oppsett er det mulig å gjøre en maskinell kontroll av kunders delegering og oppsett.

## Forutsetninger
- Anskaff virksomhetssertifikat 
- Opprett virksomhetsbruker på Altinn.no for denne integrasjonen (https://www.altinn.no/hjelp/innlogging/alternativ-innlogging-i-altinn/virksomhetssertifikat/ - https://www.altinn.no/ui/Authentication/EnterpriseIdentified). 
- Virksomhetsbrukeren må ha rollen "ECKEYROLE" for å få listet ut alle virksomheter som har delegert rettigheter.
- Anskaff Altinn.no ApiKey for virksomheter som ikke er tjenesteeier (https://altinn.github.io/docs/api/rest/kom-i-gang/ og https://digdir.apps.altinn.no/digdir/be-om-api-nokkel/ - krever innlogging i Altinn.no)
- NB: ApiKey må bestilles med leserettighet til "Authorization" (må begrunnes eksplisitt med denne integrasjonen)

## Implementasjonsforslag - maskinell sjekk via Altinn.no REST API
*NB:* alle REST API requests må kalles opp med request header `Accept: application/hal+json`, client certificate (virksomhetssertifikatet) må være registrert slik at det inkluderes av den http client'en som benyttes.

### Steg 1
- <abbr title="Det skal utføres en maskinell pålogging med virksomhetsbrukeren">"Logg på"</abbr> Altinn.no API for å få tak i `.ASPXAUTH`-auth cookien. Kallet må utføres med følgende credentials:
    - apikey
    - client certificate
    - brukernavn og passord tilhørende virksomhetsbrukeren
- Eksempel request:<br/>
`POST https://www.altinn.no/api/authentication/authenticatewithpassword?ForceEIAuthentication=true`<br/>
<br/>Request body payload:<br/>
    ```
    { 
        "UserName": "din-virksomhetsbruker",
        "UserPassword": "din-virksomhetsbruker-passord"
    }
    ```
- Hent `.ASPXAUTH` cookie fra responsen og ta vare på verdien

### Steg 2
- Hent alle virksomheter som har delegert rettighet til din organisasjon for DSVE-servicecode (4752)
- Kallet må utføres med følgened credentials:
    - apikey
    - client certificate
    - `.ASPXAUTH` cookie fra steg 1
- Eksempel request:<br/>
    `GET https://www.altinn.no/api/reportees?ForceEIAuthentication=true&serviceCode=4752` 

### Steg 3
- For hver `ReporteeId` (format "rNNNNNNN") returnert i steg 2:
    - Hent delegerte rettigheter. 
- Kallet må utføres med følgende credentials:
    - apikey
    - client certificate
    - `.ASPXAUTH` cookie fra steg 1
- Eksempel request:<br/>
`GET https://www.altinn.no/api/{ReporteeId}/authorization/rights?ForceEIAuthentication=true&$filter=ServiceCode eq '4752'` <br/><br/>(NB! Erstatt `{ReporteeId}` med faktisk `ReporteeId` fra steg 2)

### Steg 4
- Sjekk at virksomheten har delegert både `Read` og `Write`-rettighetene til DSVE (`ServiceCode` 4752) til din organisasjon/virksomhetsbruker:
- ``` 
     "_embedded": {
        "rights": [
            {
                "RightID": nnnnnnnn,
                "RightType": "Service",
                "ServiceCode": "4752",
                "ServiceEditionCode": 1,
                "Action": "Read",
                "RightSourceType": "DirectlyDelegatedRights",
                "IsDelegatable": true
            },
            {
                "RightID": nnnnnnnn,
                "RightType": "Service",
                "ServiceCode": "4752",
                "ServiceEditionCode": 1,
                "Action": "Write",
                "RightSourceType": "DirectlyDelegatedRights",
                "IsDelegatable": true
            }
        ]
    }
   ```
- Valgfritt: sjekk at virksomheten ikke har delegert flere rettigheter enn det som er nødvendig for DSVE.