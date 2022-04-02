<#
.HAKKIMDA
	Mehmet PATLAKY���T | Office Apps & Services MVP
	https://www.parlakyigit.net/
	Twitter:@mparlakyigit 
#>

<#
.NOTE
Bu PowerShell beti�i d�� organizasyonlardan g�nderilen yanl�� mail adreslerini belirlenen bir posta kutusu i�erisine y�nlendirir.
B�ylelikle organizasyonunuza gelen hi� bir maili ka��rmam�� olursunuz.
#>

Set-ExecutionPolicy Unrestricted
Install-Module -Name ExchangeOnlineManagement
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline

$GroupName = "alluser@M365B816741.onmicrosoft.com"
#Olu�turulacak dinamik da��t�m grubu mail adresi yaz�l�r.

$CatchMailbox = "catch@M365B816741.onmicrosoft.com"
#Catch mailbox i�in olu�turulacak shared mailbox ismi yaz�l�r.(Shared Mailbox �cretsizdir. 50 GB kotas� bulunmaktad�r.)

$domain = "M365B816741.onmicrosoft.com"
#Kulland���n�z domain adresi yaz�l�r.

Set-AcceptedDomain -Identity $domain -DomainType InternalRelay
#Kabul edien domain adresini internal relay pozisyonuna �eker.

New-Mailbox -Shared -Name "Catch Mailbox" -DisplayName "Catch Mailbox" -Alias catch -PrimarySmtpAddress $CatchMailbox
#Yeni bir Shared MailBox olu�turur. Olu�turulan mailbox i�in ilgili kullan�c�lara yetki verilmesi gerekmektedir.

New-DynamicDistributionGroup -Name "All User" -IncludedRecipients "MailboxUsers" -PrimarySmtpAddress $GroupName
#Yeni dinamik da��t�m grubu olu�turur.

New-TransportRule -Name "Catch Mailbox-Rule" -FromScope NotInOrganization -ExceptIfSentToMemberOf $GroupName -RedirectMessageTo $CatchMailbox
#Catch mailbox i�in transport rule olu�turur.