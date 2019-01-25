# e-tinglysing-afpant-capabilities: REQUEST FOR COMMENTS
## Sammendrag
Aktører som skal benytte AFPANT har behov for å:
* Vite om en annen aktør (mottaker-organisasjonsnummer) finnes på AFPANT
* Vite hvilke meldingstyper en annen aktør støtter

## Alternative løsninger
Difi/Brreg arbeider med en offentlig-privat løsning som kunne vært aktuell å benytte til å løse ovenstående behov (arbeidstittel KoFuVi / digital samhandling offentlig-privat DSOP) - men dette prosjektet er ikke ferdigstilt.
Det er indikert at løsningen også vil kunne benyttes mellom private næringsaktører og capability / servicediscovery er en sentral komponent i den løsningen.

## Forslag
Websystemer AS etablerer støtte for å kunne besvare CapabilityRequest-meldinger fra alle deltakende aktører på AFPANT. CapabilityResponse-svaret tar utgangspunkt i felles vedlikeholdt liste over aktører (e-tinglysing-afpant/afpant-organizations/afpant-organizations-and-capabilities.tsv).

CapabilityRequest-meldinger kan sendes til Websystemer AS (organisasjonsnummer 915343716). 

## Ny request/response meldingstype: CapabilityRequest + CapabilityResponse
## CapabilityRequest objekt
<table>
	<tbody>
		<tr>
			<td><p><strong>Key</strong></p></td>
			<td><p><strong>Type</strong></p></td>
			<td><p><strong>Beskrivelse</strong></p></td>
		</tr>
		<tr>
			<td><p>messageType</p></td>
			<td><p>String</p></td>
			<td><p>Denne kan være en av følgende:</p><ul><li>CapabilityRequest</li></ul></td>
		</tr>		 
		<tr>
			<td><p>externalSystemId</p></td>
			<td><p>String</p></td>
			<td><p>Optional: ID/oppdragsnummer/key/identifikator fra eksternt meglersystem/banksystem hvor forespørselen sendes fra.</p></td>
		</tr>
	</tbody>
</table>

## CapabilityResponse objekt
<table>
	<tbody>
		<tr>
			<td><p><strong>Key</strong></p></td>
			<td><p><strong>Type</strong></p></td>
			<td><p><strong>Beskrivelse</strong></p></td>
		</tr>
		<tr>
			<td><p>messageType</p></td>
			<td><p>String</p></td>
			<td><p>Denne kan være en av følgende:</p><ul><li>CapabilityResponse</li></ul></td>
		</tr>
		<tr>
			<td><p>messageGenerated</p></td>
			<td><p>DateTime</p></td>
			<td><p>Timestamp meldingen ble produsert hos avsender</p></td>
		</tr>           
		<tr>
			<td><p>supportedMessageTypes</p></td>
			<td><p>String[]</p></td>
			<td><p>Array av strings som angir hvilke meldingstyper (objektnavn) som dette organisasjonsnummeret kan sende eller motta.
            <br>Eksempel: "SignedMortageDeed" "SignedMortgageDeedProcessed"</p></td>
		</tr>       		 
		<tr>
			<td><p>generatedBy</p></td>
			<td><p>String</p></td>
			<td><p>Optional: Firmanavnet til  systemleverandøren som håndterer AFPANT-kommunikasjon på vegne av organisasjonsnummeret.
            <br>Eksempel: Ambita AS</p></td>
		</tr>        	
		<tr>
			<td><p>externalSystemId</p></td>
			<td><p>String</p></td>
			<td><p>Optional: externalSystemId som angitt i CapabilityRequest.</p></td>
		</tr>
	</tbody>
</table>