# Ruvbox - Sjálfvirk RÚV Spilun

*[Click here for English](README.md)*

Ruvbox er einföld Kodi (LibreELEC) uppsetning sem breytir Raspberry Pi tölvu í sérhæft tæki sem spilar beina útsendingu [RÚV](https://www.ruv.is/) sjálfkrafa um leið og kveikt er á því.

Þetta er fullkomin lausn fyrir eldra fólk eða hvern sem er sem vill bara geta kveikt á sjónvarpinu og horft á RÚV án þess að þurfa að flakka um í flóknum valmyndum eða öppum.

## Eiginleikar
*   **Sjálfvirk spilun:** Byrjar að spila beina útsendingu RÚV um leið og Kodi hefur ræst sig.
*   **Góð streymisgæði:** Notar `inputstream.adaptive` til að meðhöndla HLS streymi á mjúkan hátt og stillir myndgæði sjálfkrafa miðað við nethraða.
*   **Snjöll tenging:** Innbyggða Python þjónustan bíður eftir nettengingu áður en hún reynir að spila, og reynir aftur á öruggan hátt ef streymið hleðst ekki inn í fyrstu tilraun.
*   **Bætt biðminni (Buffering):** Inniheldur sérsniðið `advancedsettings.xml` skjal sem bætir biðminni (cache) fyrir myndbönd til að koma í veg fyrir hökt á óstöðugu Wi-Fi neti.

## Skrár og möppur
*   `src/service.autoplay/` - Sérsniðna Kodi Python viðbótin sem sér um sjálfvirku ræsinguna.
*   `config/ruv_live.strm` - Kodi streymisskráin sem vísar á RÚV streymið.
*   `config/advancedsettings_kodi20.xml` - Bestun á biðminni fyrir Kodi v17-v20.

## Uppsetningarleiðbeiningar

1.  **Settu upp LibreELEC:** Skrifaðu LibreELEC á SD kort fyrir Raspberry Pi með því að nota [Raspberry Pi Imager](https://www.raspberrypi.com/software/) eða [LibreELEC USB-SD Creator](https://libreelec.tv/downloads/).
2.  **Virkjaðu SSH/Samba:** Í upphaflegu LibreELEC uppsetningarvalmyndinni, vertu viss um að virkja SSH eða Samba deilingu svo þú getir flutt skrár yfir á Pi tölvuna.
3.  **Færðu skrárnar:**
    *   Afritaðu `config/ruv_live.strm` í `/storage/` möppuna á Raspberry Pi.
    *   Afritaðu `src/service.autoplay` möppuna í `/storage/.kodi/addons/` möppuna.
    *   *(Valfrjálst)* Ef þú ert að nota Kodi v17-v20, endurnefndu `config/advancedsettings_kodi20.xml` í `advancedsettings.xml` og settu það í `/storage/.kodi/userdata/`. *(Athugaðu: Fyrir Kodi v21 Omega, á að stilla biðminni (caching) í gegnum Kodi valmyndina í Settings > Services > Caching í staðinn).*
4.  **Endurræstu:** Endurræstu Raspberry Pi tölvuna. `service.autoplay` viðbótin mun hlaðast inn sjálfkrafa, bíða eftir nettengingu, og hefja RÚV streymið!

## Leyfi
Opinn hugbúnaður, gefinn út fyrir samfélagið.
