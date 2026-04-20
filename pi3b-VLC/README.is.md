# Ruvbox - VLC Kiosk Útgáfa

*[Click here for English](README.md)*

Þetta er **ofur-örugga, skrifvarða (read-only)** útgáfan af RÚV tækinu.
Í stað þess að nota flókið margmiðlunarkerfi eins og Kodi, notar þessi uppsetning Raspberry Pi OS Lite og VLC til að búa til "heimskt sjónvarp" sem er nánast ómögulegt að skemma.

## Af hverju þessi útgáfa?
*   **Ekkert viðmót til að skemma:** Það eru engar valmyndir. Tækið ræsir sig beint í beina útsendingu á öllum skjánum.
*   **Ónæmt fyrir rafmagnsleysi:** Með því að virkja OverlayFS verður SD kortið skrifvarið. Þú getur tekið tækið úr sambandi við vegg 10.000 sinnum og það mun aldrei skemmast.
*   **Léttkeyrandi:** Keyrir á lágmarks stýrikerfi án skjáborðsumhverfis (desktop), sem sparar minni og gerir það að verkum að það ræsir sig hraðar.

## Vélbúnaður sem þarf
*   **Raspberry Pi (3, 4, eða 5):** Fullkomið fyrir sjónvarpstæki.
*   **Hvaða Linux tölva sem er:** Forritið skynjar sjálfkrafa umhverfið þitt. Það er hægt að keyra það á Ubuntu, Debian, Linux Mint eða gömlu fartölvunni!

## Uppsetning

### 1. Skrifaðu Raspberry Pi OS Lite
Notaðu [Raspberry Pi Imager](https://www.raspberrypi.com/software/) til að skrifa **Raspberry Pi OS Lite (64-bit)** (finnst undir *Raspberry Pi OS (other)*). 
*Áður en þú skrifar*, smelltu á tannhjólið (OS Customisation) og:
*   Stilltu notandanafn (t.d. `pi`) og lykilorð.
*   Stilltu Wi-Fi netið þitt.
*   Virkjaðu SSH.

### 2. Afritaðu skrárnar
Kveiktu á Raspberry Pi og notaðu SCP/SFTP forrit (eins og FileZilla eða WinSCP) til að afrita alla þessa `pi3b-VLC` möppu inn í heimasvæðið á Pi tölvunni (t.d. `/home/pi/pi3b-VLC`).

### 3. Keyrðu uppsetningarforritið
Tengdu þig við Raspberry Pi í gegnum SSH og keyrðu:
```bash
cd pi3b-VLC
sudo ./install.sh
```
Forritið mun setja upp VLC, stilla sjálfvirka ræsingu og byrja að spila streymið.

### 4. Læstu kerfinu (Sérstaklega mikilvægt!)
Til að gera tækið algjörlega óbrjótanlegt verður þú að gera skráarkerfið skrifvarið svo það sé óhætt að taka það úr sambandi:
1. Keyrðu `sudo raspi-config`
2. Farðu í **Advanced Options** (eða **Performance Options** á nýrri útgáfum) -> **Overlay File System**.
3. Veldu **Yes** til að virkja overlay, og **Yes** til að gera boot diskinn skrifvarinn.
4. Endurræstu tölvuna.

*Athugaðu: Ef þú þarft einhvern tímann að uppfæra kerfið eða breyta forritinu þarftu að keyra `sudo raspi-config` og slökkva á Overlay File System fyrst, gera breytingarnar og virkja það svo aftur.*
