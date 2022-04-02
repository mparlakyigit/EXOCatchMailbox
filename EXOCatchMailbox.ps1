<#
.HAKKIMDA
	Mehmet PATLAKYÝÐÝT | Office Apps & Services MVP
	https://www.parlakyigit.net/
	Twitter:@mparlakyigit 
#>

<#
.NOTE
Bu PowerShell betiði dýþ organizasyonlardan gönderilen yanlýþ mail adreslerini belirlenen bir posta kutusu içerisine yönlendirir.
Böylelikle organizasyonunuza gelen hiç bir maili kaçýrmamýþ olursunuz.
#>

Set-ExecutionPolicy Unrestricted
Install-Module -Name ExchangeOnlineManagement
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline

$GroupName = "alluser@M365B816741.onmicrosoft.com"
#Oluþturulacak dinamik daðýtým grubu mail adresi yazýlýr.

$CatchMailbox = "catch@M365B816741.onmicrosoft.com"
#Catch mailbox için oluþturulacak shared mailbox ismi yazýlýr.(Shared Mailbox ücretsizdir. 50 GB kotasý bulunmaktadýr.)

$domain = "M365B816741.onmicrosoft.com"
#Kullandýðýnýz domain adresi yazýlýr.

Set-AcceptedDomain -Identity $domain -DomainType InternalRelay
#Kabul edien domain adresini internal relay pozisyonuna çeker.

New-Mailbox -Shared -Name "Catch Mailbox" -DisplayName "Catch Mailbox" -Alias catch -PrimarySmtpAddress $CatchMailbox
#Yeni bir Shared MailBox oluþturur. Oluþturulan mailbox için ilgili kullanýcýlara yetki verilmesi gerekmektedir.

New-DynamicDistributionGroup -Name "All User" -IncludedRecipients "MailboxUsers" -PrimarySmtpAddress $GroupName
#Yeni dinamik daðýtým grubu oluþturur.

New-TransportRule -Name "Catch Mailbox-Rule" -FromScope NotInOrganization -ExceptIfSentToMemberOf $GroupName -RedirectMessageTo $CatchMailbox
#Catch mailbox için transport rule oluþturur.