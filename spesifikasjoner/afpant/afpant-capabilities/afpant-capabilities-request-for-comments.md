# e-tinglysing-afpant-capabilities: REQUEST FOR COMMENTS
## Sammendrag
Aktører som skal benytte AFPANT har behov for å:
* Vite om en annen aktør (mottaker-organisasjonsnummer) finnes på AFPANT
* Vite hvilke meldingstyper en annen aktør støtter

## Alternative løsninger
Difi/Brreg arbeider med en offentlig-privat løsning som kunne vært aktuell å benytte til å løse ovenstående behov (arbeidstittel KoFuVi / digital samhandling offentlig-privat DSOP) - men dette prosjektet er ikke ferdigstilt.
Det er indikert at løsningen også vil kunne benyttes mellom private næringsaktører og capability / servicediscovery er en sentral komponent i den løsningen.

## Forslag
Websystemer AS etablerer støtte for å kunne besvare CapabilityRequest-meldinger fra alle deltakende aktører på AFPANT. CapabilityResponse-svaret tar utgangspunkt i data fra felles vedlikeholdt liste over aktører (e-tinglysing-afpant/afpant-organizations/afpant-organizations-and-capabilities.tsv).

CapabilityRequest kan kun sendes til Websystemer AS (organisasjonsnummer 915343716). 


## Altinn Formidlingstjeneste: Manifest
Altinn ServiceEngine Broker støtter at avsender angir egendefinerte key/value pairs i Manifest.PropertyList (Manifest-objektet angis i ServiceEngine BrokerServiceInitiation.Manifest property). 

Ved bruk av ServiceEngine webservices vil Altinn Formidlingstjenester automatisk legge til en fil med navn "manifest.xml" i ZIP-filen som avsender tilknytter forsendelsen.

"Manifest.xml"-filen er av type BrokerServiceManifest.

## Altinn Request
<table>
	<thead>
		<tr>
			<th colspan="4">Manifest metadata (BrokerServiceInitiation.Manifest.PropertyList)</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><p><strong>Manifest key</strong></p></td>
			<td><p><strong>Type</strong></p></td>
			<td><p><strong>Required</strong></p></td>
			<td><p><strong>Beskrivelse</strong></p></td>
		</tr>
		<tr>
			<td><p>messageType</p></td>
			<td><p>String</p></td>
			<td><p>Yes</p></td>
			<td><p>Denne kan være en av følgende:</p><ul><li>CapabilityRequest</li></ul></td>
		</tr>		 
		<tr><td colspan="4"><strong>Payload (ZIP-fil)</strong></td></tr>
		<tr><td colspan="4">En ZIP-fil som inneholder en XML-serialisert fil av CapabilityRequest-objektet (CapabilityRequest.xml).<br>
		Tilknytting av ZIP-fil til forsendelsen kan gjøres ved bruk av  BrokerServiceExternalBasicStreamedClient / StreamedPayloadBasicBE.</td></tr>
	</tbody>
</table>


## Altinn Response 
<table>
	<thead>
		<tr>
			<th colspan="4">Manifest metadata (BrokerServiceInitiation.Manifest.PropertyList)</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><p><strong>Manifest key</strong></p></td>
			<td><p><strong>Type</strong></p></td>
			<td><p><strong>Beskrivelse</strong></p></td>
		</tr>
		<tr>
			<td><p>messageType</p></td>
			<td><p>String</p></td>
			<td><p>Denne kan være en av følgende:</p><ul><li>CapabilityResponse</li></ul></td>
		</tr>
		<tr><td colspan="3"><strong>Payload (ZIP-fil)</strong></td></tr>
		<tr><td colspan="3">En ZIP-fil som inneholder en XML-serialisert fil av CapabilityResponse-objektet (CapabilityResponse.xml).</td></tr>
	</tbody>
</table>

 
## CapabilityRequest objekt
<table>
	<tbody>
		<tr>
			<td><p><strong>Property</strong></p></td>
			<td><p><strong>Type</strong></p></td>
			<td><p><strong>Beskrivelse</strong></p></td>
		</tr>		
		<tr>
			<td><p>OrganizationNumbers</p></td>
			<td><p>String[]</p></td>
			<td><p>Optional: Array av organisasjonsnummer det spørres om capabilities for. Dersom verdien utelates vil hele listen over organisasjonsnumre returneres.</td>
		</tr>	
		<tr>
			<td><p>ExternalSystemId</p></td>
			<td><p>String</p></td>
			<td><p>Optional: ID/oppdragsnummer/key/identifikator fra eksternt meglersystem/banksystem hvor forespørselen sendes fra.</p></td>
		</tr>
	</tbody>
</table>

## CapabilityResponse objekt
<table>
	<tbody>
		<tr>
			<td><p><strong>Property</strong></p></td>
			<td><p><strong>Type</strong></p></td>
			<td><p><strong>Beskrivelse</strong></p></td>
		</tr>
		<tr>
			<td><p>GeneratedAt</p></td>
			<td><p>DateTime</p></td>
			<td><p>Timestamp for når responsen ble produsert.</p></td>
		</tr>     
		<tr>
			<td><p>Organizations</p></td>
			<td><p>OrganizationCapability[]</p></td>
			<td><p>Array av OrganizationCapability-objekter (ett objekt for hvert organisasjonsnummer det ble spurt om i CapabilityRequest, eller samtlige kjente organisasjonsnumre dersom CapabilityRequest angis uten CapabilityRequest.OrganizationNumbers).</p></td>
		</tr>  		      		
		<tr>
			<td><p>ExternalSystemId</p></td>
			<td><p>String</p></td>
			<td><p>Optional: ExternalSystemId som angitt i CapabilityRequest.</p></td>
		</tr>
	</tbody>
</table>

## OrganizationCapability objekt
<table>
	<tbody>
		<tr>
			<td><p><strong>Property</strong></p></td>
			<td><p><strong>Type</strong></p></td>
			<td><p><strong>Beskrivelse</strong></p></td>
		</tr>
		<tr>
			<td><p>OrganizationNumber</p></td>
			<td><p>String</p></td>
			<td><p>Organisasjonsnummeret.</td>
		</tr>
		<tr>
			<td><p>CompanyName</p></td>
			<td><p>String</p></td>
			<td><p>Firmanavn.</td>
		</tr>			
		<tr>
			<td><p>Status</p></td>
			<td><p>String (Enum)</p></td>
			<td><p>Angir om organisasjonsnummeret er aktivt eller ukjent på AFPANT. 
			<br>Denne kan være en av følgende verdier:
			<ul><li>Active</li>
			<li>Unknown</li></ul></td>
		</tr>			
		<tr>
			<td><p>SupportedMessageTypes</p></td>
			<td><p>String[]</p></td>
			<td><p>Array av strings som angir hvilke meldingstyper (objektnavn) som dette organisasjonsnummeret kan sende eller motta.
            <br>Eksempel: "SignedMortageDeed" "SignedMortgageDeedProcessed"</p></td>
		</tr>       		 
		<tr>
			<td><p>Provider</p></td>
			<td><p>String</p></td>
			<td><p>Optional: Firmanavnet til  systemleverandøren som håndterer AFPANT-kommunikasjon på vegne av organisasjonsnummeret.
            <br>Eksempel: Ambita AS</p></td>
		</tr>
	</tbody>
</table>     	