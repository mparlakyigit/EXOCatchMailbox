# With PowerShell Exchange Online Catch Mailbox Create
Bu PowerShell betiği ile Exchange Online için tüm catch mailbox süreçlerini otomatize etmenizi sağlar.

![catch](https://user-images.githubusercontent.com/53214224/161403595-4a198e04-9c68-4d20-bbec-d18ccd11d3bb.png)

Yapmanız gereken görselde mavi kare içerisinde bulunan değişkenleri kendi organizasyonuza göre düzenlemektir.

![catch1](https://user-images.githubusercontent.com/53214224/161403854-fa395f26-b276-4c9b-aae7-b923ff809e2d.png)

- PowerShell betiğini çalıştırabilmek için öncelikle PowerShell uygulamanızı yönetici olarak çalıştırınız.
- cd EXOCatchMailbox.ps1 dosyasının bulunduğu dizine geçiniz.
- ./EXOCatchMailbox.ps1 şeklinde betiği çalıştırınız.
- Sizden istenilen Office 365 Global admin yetkisi olan bir kullanıcı adı ve parolasını giriniz. (İlgili kullanıcının Exchange Administrator yetkisi olduğundan emin olunuz.)

![catch2](https://user-images.githubusercontent.com/53214224/161404002-eadd2525-57e5-46de-8a90-5680c0adb7b2.png)

Son olarak exchange admin center üzerinde Catch Mailbox  Trasnport rule başarılı bir şekilde oluşturulmuştur.

