<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://crd.gov.pl/wzor/2018/12/10/6355/" version="1.0">
    <xsl:import href="http://crd.gov.pl/xml/schematy/dziedzinowe/mf/2018/09/03/eD/DefinicjeSzablony/Posredni_wspolne_v7-0E.xsl"/>
	<xsl:import href="http://crd.gov.pl/xml/schematy/dziedzinowe/mf/2018/11/30/eD/PITO3X/PIT_O(23)_Z3X_v1-0E.xsl"/>
	<xsl:import href="http://crd.gov.pl/xml/schematy/dziedzinowe/mf/2018/11/30/eD/PITD/PIT_D(27)_Z_v1-0E.xsl"/>
	<xsl:import href="http://crd.gov.pl/xml/schematy/dziedzinowe/mf/2018/11/30/eD/PIT2K/PIT-2K(8)_Z_v3-0E.xsl"/>
	<xsl:import href="http://crd.gov.pl/xml/schematy/dziedzinowe/mf/2018/08/24/eD/ORDZU/ORD-ZU(3)_v4-0E.xsl"/>
    <xsl:output method="html" encoding="UTF-8" indent="yes" version="4.01" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
    <xsl:template name="TytulDokumentu">ZEZNANIE O WYSOKOŚCI OSIĄGNIĘTEGO DOCHODU (PONIESIONEJ STRATY) W ROKU
        PODATKOWYM
    </xsl:template>
    <xsl:template name="StyleDlaFormularza">
        <style type="text/css">
            .tlo-formularza { background-color: #CD853F; font-size:1.0em; }
            .opis-tekstowy { font-weight: normal}
            .niewypelnianeopisy {font-weight: bold}
            .pogrubiane { border: 3px solid black;}
            .rowdiv { height: 2em }
        </style>
    </xsl:template>
    <xsl:template match="tns:Deklaracja">
        <div class="deklaracja">
            <xsl:call-template name="NaglowekTechniczny">
                <xsl:with-param name="naglowek" select="tns:Naglowek"/>
                <xsl:with-param name="uzycie" select="'deklaracja'"/>
            </xsl:call-template>
            <xsl:call-template name="NaglowekTytulowy">
                <xsl:with-param name="naglowek" select="tns:Naglowek"/>
                <xsl:with-param name="uzycie" select="'deklaracja'"/>
                <xsl:with-param name="nazwa">ZEZNANIE O WYSOKOŚCI OSIĄGNIĘTEGO DOCHODU (PONIESIONEJ STRATY)<br/>W ROKU
                    PODATKOWYM
                </xsl:with-param>
                <xsl:with-param name="objasnienie">
                    <p>
                        <b>Formularz przeznaczony jest dla podatników, którzy w roku podatkowym:</b>
                    </p>
                    <ol>
                        <li>
                            uzyskali przychody ze źródeł położonych na terytorium Rzeczypospolitej Polskiej (podlegające
                            opodatkowaniu na ogólnych zasadach przy zastosowaniu skali podatkowej)
                            wyłącznie za pośrednictwem  płatników lub innych podmiotów obowiązanych do sporządzenia 
							imiennej informacji o wysokości tych dochodów (przychodów),
                        </li>
                        <li>
                            nie prowadzili pozarolniczej działalności gospodarczej oraz działów specjalnych produkcji
                            rolnej opodatkowanych na ogólnych zasadach przy zastosowaniu skali
                            podatkowej,
                        </li>
                        <li>
                            nie są obowiązani doliczać do uzyskanych dochodów dochodów małoletnich dzieci,
                        </li>
                        <li>
                            nie obniżają dochodów o straty z lat ubiegłych,
                        </li>
						<li>
                            nie odliczają tzw. minimalnego podatku dochodowego.
                        </li>
                    </ol>
                    <br/>
                </xsl:with-param>
                <xsl:with-param name="podstawy-prawne">
                    <table>
                        <tr>
                            <td class="etykieta">Podstawa prawna:</td>
                            <td class="wartosc">Art. 45 ust. 1 ustawy z dnia 26 lipca 1991 r. o podatku dochodowym od
                                osób fizycznych (Dz. U. z 2018 r. poz. 1509,
                                z późn. zm.), zwanej dalej
                                ”ustawą”.
                            </td>
                        </tr>
                        <tr>
                            <td class="etykieta">Termin składania:</td>
                            <td class="wartosc">Od dnia 15 lutego do dnia 30 kwietnia roku następującego po roku
                                podatkowym, z zastrzeżeniem art. 45 ust. 7 ustawy.
                            </td>
                        </tr>
                        <tr>
                            <td class="etykieta">Miejsce składania:</td>
                            <td class="wartosc">Urząd, o którym mowa w art. 45 ustawy, zwany dalej ”urzędem”.</td>
                        </tr>
                    </table>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="SposobOpodatkowania"/>
            <xsl:call-template name="MiejsceICel">
                <xsl:with-param name="sekcja">A.</xsl:with-param>
            </xsl:call-template>
            <xsl:for-each select="tns:Podmiot1">
                <xsl:call-template name="Podmiot1Z"/>
            </xsl:for-each>
            <xsl:for-each select="tns:Podmiot2">
                <xsl:call-template name="Podmiot2Z"/>
            </xsl:for-each>
            <!-- Pozycje Szczegolowe -->
            <xsl:call-template name="DochodyStraty">
                <xsl:with-param name="sekcja">C.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="OdliczeniaOdDochodu">
                <xsl:with-param name="sekcja">D.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="ObliczeniePodatku">
                <xsl:with-param name="sekcja">E.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="OdliczeniaOdPodatku">
                <xsl:with-param name="sekcja">F.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="ObliczenieZobowiazaniaPodatkowego">
                <xsl:with-param name="sekcja">G.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="Ulga">
                <xsl:with-param name="sekcja">H.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="InformacjaOdochodach">
                <xsl:with-param name="sekcja">I.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="OPP">
                <xsl:with-param name="sekcja">J.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="InformacjeUzupelniajace">
                <xsl:with-param name="sekcja">K.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="InformacjeOZalacznikach">
                <xsl:with-param name="sekcja">L.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="RachunekOsobistyDoZwrotu">
                <xsl:with-param name="sekcja">M.</xsl:with-param>
            </xsl:call-template>
			<xsl:call-template name="KartaKDR">
                <xsl:with-param name="sekcja">N.</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="PrzypisyIndeks"/>
            <xsl:call-template name="PouczeniaKoncowe"/>
        </div>
        <!-- deklaracja-->
        <xsl:apply-templates select="tns:Zalaczniki"/>
    </xsl:template>
    <xsl:template name="Podmiot1Z">
        <xsl:param name="sekcja"/>
        <h2 class="tytul-sekcja-blok">
            <xsl:value-of select="$sekcja"/>B. DANE IDENTYFIKACYJNE I AKTUALNY ADRES ZAMIESZKANIA
        </h2>
        <h3 class="tytul-sekcja-blok">
            <xsl:value-of select="$sekcja"/>B.1. DANE PODATNIKA
        </h3>
        <div class="sekcja">
            <xsl:call-template name="OsobaFizyczna1"/>
            <xsl:call-template name="AdresZamieszkania1"/>
        </div>
    </xsl:template>
    <xsl:template name="Podmiot2Z">
        <xsl:param name="sekcja"/>
        <h3 class="tytul-sekcja-blok">
            <xsl:value-of select="$sekcja"/>B.2. DANE MAŁŻONKA
        </h3>
        <div class="sekcja">
            <xsl:call-template name="OsobaFizyczna1"/>
            <xsl:call-template name="AdresZamieszkania1"/>
        </div>
    </xsl:template>
    <xsl:template name="OsobaFizyczna1">
        <xsl:for-each select="*[local-name()='OsobaFizyczna']">
            <table class="normalna">
                <tr>
                    <xsl:if test="*[local-name()='NIP' ]">
                        <td class="wypelniane">
                            <div class="opisrubryki">Identyfikator podatkowy NIP</div>
                            <xsl:apply-templates select="*[local-name() = 'NIP']"/>
                        </td>
                    </xsl:if>
                    <xsl:if test="*[local-name()='PESEL' ]">
                        <td class="wypelniane">
                            <div class="opisrubryki">Identyfikator podatkowy numer PESEL</div>
                            <xsl:apply-templates select="*[local-name() = 'PESEL']"/>
                        </td>
                    </xsl:if>
                </tr>
            </table>
            <table class="normalna">
                <tr>
                    <td class="wypelniane" style="width:40%">
                        <div class="opisrubryki">Nazwisko</div>
                        <xsl:apply-templates select="*[local-name()='Nazwisko']"/>
                    </td>
                    <td class="wypelniane" style="width:40%">
                        <div class="opisrubryki">Pierwsze imię</div>
                        <xsl:apply-templates select="*[local-name()='ImiePierwsze']"/>
                    </td>
                    <td class="wypelniane" style="width:20%">
                        <div class="opisrubryki">Data urodzenia</div>
                        <xsl:apply-templates select="*[local-name()='DataUrodzenia']"/>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="AdresZamieszkania1">
        <xsl:for-each select="*[local-name()='AdresZamieszkania']">
            <xsl:apply-templates select="*[local-name()='AdresPol'] | *[local-name()='AdresZagr']"/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="SposobOpodatkowania">
        <xsl:variable name="wartosc" select="tns:PozycjeSzczegolowe/tns:P_6"/>
        <table class="normalna">
            <tr>
                <td class="wypelniane" colspan="2">
                    <div class="opisrubryki">6. Wybór sposobu opodatkowania:</div>
                    <xsl:choose>
                        <xsl:when test="$wartosc =1">
                            <input type="checkbox" checked="checked" disabled="disabled"/>1. indywidualnie
                        </xsl:when>
                        <xsl:when test="$wartosc =2">
                            <input type="checkbox" checked="checked" disabled="disabled"/>2. wspólnie z małżonkiem,
                            zgodnie z wnioskiem, o którym mowa w art. 6 ust. 2 ustawy.
                        </xsl:when>
                        <xsl:when test="$wartosc =3">
                            <input type="checkbox" checked="checked" disabled="disabled"/>3. wspólnie z małżonkiem,
                            zgodnie z wnioskiem, o którym mowa w art. 6a ust. 1 ustawy
                        </xsl:when>
                        <xsl:otherwise>
                            <input type="checkbox" checked="checked" disabled="disabled"/>4. w sposób przewidziany dla
                            osób samotnie wychowujących dzieci
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td class="wypelniane">
                    <xsl:variable name="wartosc1" select="tns:PozycjeSzczegolowe/tns:P_7"/>
                    <div class="opisrubryki">7.</div>
                    <xsl:if test="$wartosc1 =1">
                        <input type="checkbox" checked="checked" disabled="disabled"/>w sposób przewidziany w art. 29
                        ust. 4 ustawy - podatnik
                    </xsl:if>
                    <xsl:if test="not($wartosc1 =1)">
                        <input type="checkbox" disabled="disabled"/>w sposób przewidziany w art. 29 ust. 4 ustawy -
                        podatnik
                    </xsl:if>
                </td>
                <td class="wypelniane">
                    <xsl:variable name="wartosc2" select="tns:PozycjeSzczegolowe/tns:P_8"/>
                    <div class="opisrubryki">8.</div>
                    <xsl:if test="$wartosc2 =1">
                        <input type="checkbox" checked="checked" disabled="disabled"/>w sposób przewidziany w art. 29
                        ust. 4 ustawy - małżonek
                    </xsl:if>
                    <xsl:if test="not($wartosc2 =1)">
                        <input type="checkbox" disabled="disabled"/>w sposób przewidziany w art. 29 ust. 4 ustawy -
                        małżonek
                    </xsl:if>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span style="font-size: 0.7em">
                        Zaznaczenie odpowiednich kwadratów oraz złożenie podpisu(ów) w części O traktuje się na równi ze
                        złożeniem wniosku o zastosowanie wskazanego sposobu
                        opodatkowania. Kwadrat w poz. 7 lub 8 zaznacza się łącznie z kwadratem 1, 2, 3 albo 4 w poz. 6.
                    </span>
                </td>
            </tr>
        </table>
    </xsl:template>
    <xsl:template name="DochodyStraty">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <h2 class="tytul-sekcja-blok">
                <xsl:value-of select="$sekcja"/> DOCHODY / STRATY ZE ŹRÓDEŁ PRZYCHODÓW
            </h2>
            <h3 class="tytul-sekcja-blok">
                <xsl:value-of select="$sekcja"/>1. DOCHODY I STRATY PODATNIKA
            </h3>
            <table class="normalna">
                <tr>
                    <td class="niewypelniane" style="width: 35%">
                        <b/>Źródła przychodów
                    </td>
                    <td class="niewypelniane" style="width: 12%">Przychód</td>
                    <td class="niewypelniane" style="width: 12%">Koszty uzyskania przychodów</td>
                    <td class="niewypelniane" style="width: 12%">Dochód<font style="font-weight: normal"><br/>(b – c)</font></td>
                    <td class="niewypelniane" style="width: 12%">Strata<font style="font-weight: normal"><br/>(c – b)</font></td>
                    <td class="niewypelniane" style="width: 12%">Zaliczka pobrana przez płatnika</td>
                </tr>
				<tr>
                    <td class="niewypelniane" style="width: 35%; font-weight: normal">a</td>
                    <td class="niewypelniane" style="width: 12%; font-weight: normal">b</td>
                    <td class="niewypelniane" style="width: 12%; font-weight: normal">c</td>
                    <td class="niewypelniane" style="width: 12%; font-weight: normal">d</td>
                    <td class="niewypelniane" style="width: 12%; font-weight: normal">e</td>
                    <td class="niewypelniane" style="width: 12%; font-weight: normal">f</td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%" rowspan="2">
                        1. Należności ze stosunku: pracy,
                        służbowego, spółdzielczego i z pracy
                        nakładczej, a także zasiłki pieniężne
                        z ubezpieczenia społecznego
                        wypłacone przez zakład pracy
                        <p class="opis-tekstowy">
                            W poz. 40 należy wykazać przychody,
                            do których w poz. 41 podatnik stosuje
                            50% koszty uzyskania przychodów na
                            podstawie art. 22 ust. 9 pkt 3 ustawy.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">35.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_35"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">36.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_36"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">37.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_37"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">38.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_38"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">39.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_39"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">40.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_40"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">41.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_41"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%">
                        2. Emerytury – renty oraz inne krajowe
                        świadczenia, o których mowa
                        w art. 34 ust. 7 ustawy
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">42.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_44"/>
                        </div>
                    </td>
                    <td class="puste" style="width: 12%"/>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">43.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_45"/>
                        </div>
                    </td>
                    <td class="puste" style="width: 12%"/>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">44.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_46"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%">
                        3. Działalność wykonywana osobiście,
                        o której mowa w art. 13 ustawy
                        (w tym umowy o dzieło i zlecenia)
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">45.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_45"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">46.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_46"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">47.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_47"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">48.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_48"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">49.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_49"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%" rowspan="2">
                        4. Prawa autorskie i inne prawa, o których
                        mowa w art. 18 ustawy
                        <p class="opis-tekstowy">
                            W poz. 55 należy wykazać przychody,
                            do których w poz. 56 podatnik stosuje
                            50% koszty uzyskania przychodów na
                            podstawie art. 22 ust. 9 pkt 1–3 ustawy.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">50.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_52"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">51.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_53"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">52.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_54"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">53.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_55"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">54.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_56"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">55.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_57"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">56.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_58"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%">
                        5. Inne źródła, niewymienione
                        w wierszach od 1 do 4
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">57.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_59"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">58.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_60"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">59.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_61"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">60.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_62"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">61.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_63"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%">
                        6. RAZEM
                        <p class="opis-tekstowy">Suma kwot z wierszy od 1 do 5.</p>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">62.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_62"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">63.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_63"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">64.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_64"/>
                        </div>
                    </td>
                    <td class="puste" style="width: 12%"/>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">65.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_65"/>
                        </div>
                    </td>
                </tr>
            </table>
            <h3 class="tytul-sekcja-blok">
                <xsl:value-of select="$sekcja"/>2. DOCHODY I STRATY MAŁŻONKA
            </h3>
            <table class="normalna">
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%" rowspan="2">
                        1. Należności ze stosunku: pracy,
                        służbowego, spółdzielczego i z
                        pracy nakładczej, a także zasiłki
                        pieniężne z ubezpieczenia
                        społecznego wypłacone przez zakład
                        <p class="opis-tekstowy">
                            W poz. 71 należy wykazać przychody,
                            do których w poz. 72 małżonek stosuje
                            50% koszty uzyskania przychodów na
                            podstawie art. 22 ust. 9 pkt 3 ustawy.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">66.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_66"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">67.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_67"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">68.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_68"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">69.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_69"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">70.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_70"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">71.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_71"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">72.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_72"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%">2. Emerytury - renty oraz inne krajowe
                        świadczenia, o których mowa w art. 34 ust. 7 ustawy
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">73.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_73"/>
                        </div>
                    </td>
                    <td class="puste" style="width: 12%"/>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">74.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_74"/>
                        </div>
                    </td>
                    <td class="puste" style="width: 12%"/>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">75.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_75"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%">3. Działalność wykonywana osobiście, o której mowa
                        w art. 13 ustawy (w tym umowy o dzieło i zlecenia)
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">76.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_76"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">77.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_77"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">78.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_78"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">79.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_79"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">80.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_80"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%" rowspan="2">4. Prawa autorskie i inne prawa, o
                        których mowa w art. 18 ustawy
                        <p class="opis-tekstowy">
                            W poz. 86 należy wykazać przychody,
                            do których w poz. 87 małżonek stosuje
                            50% koszty uzyskania przychodów na
                            podstawie art. 22 ust. 9 pkt 1–3 ustawy.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">81.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_81"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">82.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_82"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">83.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_83"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">84.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_84"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%" rowspan="2">
                        <div class="opisrubryki">85.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_85"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">86.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_86"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">87.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_87"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%">
                        5. Inne źródła, niewymienione w wierszach od 1 do 4
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">88.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_88"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">89.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_89"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">90.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_90"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">91.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_91"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">92.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_92"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 35%">
                        6. RAZEM
                        <p class="opis-tekstowy">Suma kwot z wierszy od 1 do 5.</p>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">93.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_93"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">94.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_94"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">95.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_95"/>
                        </div>
                    </td>
                    <td class="puste" style="width: 12%"/>
                    <td class="wypelniane" style="width: 12%">
                        <div class="opisrubryki">96.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_96"/>
                        </div>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="OdliczeniaOdDochodu">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <h2 class="tytul-sekcja-blok">
                <xsl:value-of select="$sekcja"/> ODLICZENIA OD DOCHODU
            </h2>
            <table class="normalna">
                <tr>
                    <td class="puste" style="width: 50%"/>
                    <td class="niewypelniane" style="width: 25%">podatnik</td>
                    <td class="niewypelniane" style="width: 25%">małżonek</td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Składki na ubezpieczenia społeczne
                        <p class="opis-tekstowy">Odliczenie podatnika nie może przekroczyć kwoty z poz. 64.</p>
                        <p class="opis-tekstowy">Odliczenie małżonka nie może przekroczyć kwoty z poz. 95.</p>

                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">97.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_97"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">98.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_98"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Odliczenia – wykazane w części B załącznika PIT/O
                        <p class="opis-tekstowy">Odliczenie podatnika nie może przekroczyć kwoty z poz. 64 pomniejszonej
                            o kwotę z poz. 97.
                        </p>
                        <p class="opis-tekstowy">Odliczenie małżonka nie może przekroczyć kwoty z poz. 95 pomniejszonej
                            o kwotę z poz. 98.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">99.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_99"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">100.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_100"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Ulga odsetkowa – wykazana w części B.1. załącznika PIT/D
                        <p class="opis-tekstowy">Odliczenie nie może przekroczyć sumy kwot z poz. 64 i 95 pomniejszonej
                            o kwoty
                            z poz. 97, 98, 99 i 100.
                        </p>
                    </td>
                    <td class="wypelniane" colspan="2">
                        <div class="opisrubryki">101.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_101"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Dochód po odliczeniach
                        <p class="opis-tekstowy">Od sumy kwot z poz. 64 i 95 należy odjąć kwoty z poz. 97, 98, 99, 100 i
                            101.
                        </p>
                    </td>
                    <td class="wypelniane" colspan="2">
                        <div class="opisrubryki">102.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_102"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Odliczenia mieszkaniowe – wykazane w części B.3. załącznika PIT/D
                        <p class="opis-tekstowy">Odliczenia nie mogą przekroczyć kwoty z poz. 102. Nadwyżka odliczeń
                            ponad kwotę z poz. 102
                            podlega odliczeniu w następnych latach.
                        </p>
                    </td>
                    <td class="wypelniane" colspan="2">
                        <div class="opisrubryki">103.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_103"/>
                        </div>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="ObliczeniePodatku">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <h2 class="tytul-sekcja-blok">
                <xsl:value-of select="$sekcja"/> OBLICZENIE PODATKU
            </h2>
            <table class="normalna">
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Podstawa obliczenia podatku
                        <p class="opis-tekstowy">
                            Jeżeli w poz. 6 zaznaczono kwadrat nr 1, należy wpisać kwotę z poz. 102 pomniejszoną o kwotę
                            z poz. 103. W pozostałych przypadkach należy wpisać połowę kwoty obliczonej jako różnica
                            kwot
                            z poz. 102 i 103.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 50%">
                        <div class="opisrubryki">104.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_104"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">Obliczony podatek – zgodnie z art. 27 ust. 1
                        ustawy
                        <p class="opis-tekstowy">
                            Podatek od podstawy z poz. 104; jeżeli w poz. 6 zaznaczono kwadrat nr 2, 3 albo 4, tak
                            obliczony podatek
                            należy pomnożyć przez dwa; jeżeli wynik jest liczbą ujemną, należy wpisać 0.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 50%">
                        <div class="opisrubryki">105.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_105"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">Doliczenia do podatku</td>
                    <td class="wypelniane">
                        <div class="opisrubryki">106.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_106"/>
                        </div>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="OdliczeniaOdPodatku">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <h2 class="tytul-sekcja-blok">
                <xsl:value-of select="$sekcja"/> ODLICZENIA OD PODATKU
            </h2>
            <table class="normalna">
                <tr>
                    <td class="puste" style="width: 50%"/>
                    <td class="niewypelniane" style="width: 25%">podatnik</td>
                    <td class="niewypelniane" style="width: 25%">małżonek</td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Składki na ubezpieczenie zdrowotne
                        <p class="opis-tekstowy">Suma odliczanych kwot nie może przekroczyć sumy kwot z poz. 105 i
                            106.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">107.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_107"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">108.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_108"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Odliczenia – wykazane w części C załącznika PIT/O
                        <p class="opis-tekstowy">
                            Suma odliczanych kwot nie może przekroczyć sumy kwot z poz. 105 i 106 pomniejszonej o sumę
                            kwot z poz. 107 i 108.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">109.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_109"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">110.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_110"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Podatek po odliczeniach
                        <p class="opis-tekstowy">
                            Od sumy kwot z poz. 105 i 106 należy odjąć sumę kwot z poz. 107, 108, 109 i 110.
                        </p>
                    </td>
                    <td class="wypelniane" colspan="2">
                        <div class="opisrubryki">111.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_111"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Odliczenia mieszkaniowe – wykazane w części C.2. załącznika PIT/D
                        <p class="opis-tekstowy">
                            Odliczenia nie mogą przekroczyć kwoty z poz. 111. Nadwyżka odliczeń ponad kwotę z poz. 111
                            podlega odliczeniu w następnych latach.
                        </p>
                    </td>
                    <td class="wypelniane" colspan="2">
                        <div class="opisrubryki">112.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_112"/>
                        </div>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="ObliczenieZobowiazaniaPodatkowego">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <h2 class="tytul-sekcja-blok">
                <xsl:value-of select="$sekcja"/> OBLICZENIE ZOBOWIĄZANIA PODATKOWEGO
            </h2>
            <table class="normalna">
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Podatek należny
                        <p class="opis-tekstowy">
                            Od kwoty z poz. 111 należy odjąć kwotę z poz. 112.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 50%">
                        <div class="opisrubryki">113.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_113"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Różnica między podatkiem należnym a sumą zaliczek pobranych przez płatników
                        <br/>
                        DO ZAPŁATY
                        <p class="opis-tekstowy">
                            Od kwoty z poz. 113 należy odjąć sumę kwot z poz. 65 i 96. Jeżeli różnica jest liczbą
                            ujemną, należy
                            wpisać 0.
                        </p>
                    </td>
                    <td class="wypelniane pogrubiane" style="width: 50%;">
                        <div class="opisrubryki">114.</div>
                        <div class="kwota ">
                            <xsl:call-template name="valueOrZero">
                                <xsl:with-param name="value" select="tns:P_114"/>
                            </xsl:call-template>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">Różnica między sumą zaliczek pobranych przez
                        płatników a podatkiem należnym
                        <br/>
                        NADPŁATA
                        <p class="opis-tekstowy">
                            Od sumy kwot z poz. 65 i 96 należy odjąć kwotę z poz. 113. Jeżeli różnica jest liczbą
                            ujemną, należy
                            wpisać 0.
                        </p>
                    </td>
                    <td class="wypelniane pogrubiane" style="width: 50%;">
                        <div class="opisrubryki">115.</div>
                        <div class="kwota">
                            <xsl:call-template name="valueOrZero">
                                <xsl:with-param name="value" select="tns:P_115"/>
                            </xsl:call-template>
                        </div>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="Ulga">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <h2 class="tytul-sekcja-blok">
                <xsl:value-of select="$sekcja"/> DODATKOWY ZWROT Z TYTUŁU ULGI NA DZIECI
            </h2>
            <table class="normalna">
                <tr>
                    <td class="niewypelniane" style="width: 50%"/>
                    <td class="niewypelniane" style="width: 25%">Podatnik</td>
                    <td class="niewypelniane" style="width: 25%">Małżonek</td>
                </tr>
            </table>
            <table class="normalna">
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">Składki na ubezpieczenia społeczne i zdrowotne
                        <font style="font-weight: normal"><sup>3)</sup></font>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">116.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_116"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">117.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_117"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Różnica między kwotą przysługującego odliczenia a kwotą odliczoną w zeznaniu
                        podatkowym
                        <font style="font-weight: normal"><sup>4)</sup></font>
                        <p class="opis-tekstowy">
                            Podatnik – od sumy kwot z poz. 7 części E załącznika PIT/O należy odjąć kwotę z poz. 39 tego
                            załącznika.
                        </p>
                        <p class="opis-tekstowy">
                            Małżonek – od sumy kwot z poz. 8 części E załącznika PIT/O należy odjąć kwotę z poz. 40 tego
                            załącznika.
                        </p>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">118.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_118"/>
                        </div>
                    </td>
                    <td class="wypelniane" style="width: 25%">
                        <div class="opisrubryki">119.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_119"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">Przysługująca kwota różnicy
                        <font style="font-weight: normal"><sup>5)</sup></font>
                        <p class="opis-tekstowy">
                            Suma kwot z poz. 118 i 119 nie więcej niż suma kwot z poz. 116 i 117.
                        </p>
                    </td>
                    <td class="wypelniane" colspan="2">
                        <div class="opisrubryki">120.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_120"/>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td class="niewypelnianeopisy" style="width: 50%">
                        Łączna kwota zwrotu
                        <p class="opis-tekstowy">
                            Suma kwot z poz. 115 i 120.
                        </p>
                    </td>
                    <td class="wypelniane pogrubiane" colspan="2">
                        <div class="opisrubryki">121.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_121"/>
                        </div>
                    </td>

                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="InformacjaOdochodach">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <h2 class="tytul-sekcja-blok">
                <xsl:value-of select="$sekcja"/> INFORMACJA O DOCHODACH (PRZYCHODACH) WYKAZYWANYCH
                NA PODSTAWIE ART. 45 UST. 3<span style="font-size: 0.8em">c</span> USTAWY
            </h2>
            <table class="normalna">
                <tr>
                    <td class="wypelniane" style="width: 90%">
                        <div class="opisrubryki">122. Kwota dochodów (przychodów)</div>
                        <xsl:apply-templates select="tns:P_122"/>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="OPP">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <div class="tytul-sekcja-blok">
                <h2>
                    <xsl:value-of select="$sekcja"/> WNIOSEK O PRZEKAZANIE 1% PODATKU NALEŻNEGO NA RZECZ ORGANIZACJI
                    POŻYTKU
                    PUBLICZNEGO (OPP)
                </h2>
                <p class="opis-tekstowy">
                    Należy podać numer wpisu do Krajowego Rejestru Sądowego (numer KRS) organizacji wybranej z wykazu
                    prowadzonego na podstawie
                    odrębnych przepisów oraz wysokość kwoty na jej rzecz.
                </p>
            </div>
            <table class="normalna">
                <td class="wypelniane" style="width: 40%">
                    <div class="opisrubryki">123. Numer KRS</div>
                    <xsl:value-of select="tns:P_123"/>
                </td>
                <td class="niewypelnianeopisy" style="width: 35%">
                    Wnioskowana kwota
                    <p class="opis-tekstowy">
                        Kwota z poz. 124 nie może przekroczyć 1% kwoty z poz. 113 po zaokrągleniu do pełnych
                        dziesiątek groszy w dół.
                    </p>
                </td>
                <td class="wypelniane" style="width: 25%">
                    <div class="opisrubryki">124.</div>
                    <div class="kwota">
                        <xsl:value-of select="tns:P_124"/>
                    </div>
                </td>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="InformacjeUzupelniajace">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <div class="tytul-sekcja-blok">
                <h2>
                    <xsl:value-of select="$sekcja"/> INFORMACJE UZUPEŁNIAJĄCE
                </h2>
                <p class="opis-tekstowy">
                    Podatnicy, którzy wypełnili część J, w poz. 125 mogą podać cel szczegółowy 1%, a zaznaczając kwadrat
                    w poz. 126 wyrazić zgodę na
                    przekazanie OPP swojego imienia, nazwiska i adresu wraz z informacją o kwocie z poz. 124. W poz. 127
                    można podać dodatkowe informacje,
                    np. ułatwiające kontakt z podatnikiem (telefon, e-mail).
                </p>
            </div>
            <table class="normalna">
                <tr>
                    <td class="wypelniane" style="width: 85%">
                        <div class="opisrubryki">125. Cel szczegółowy 1%</div>
                        <xsl:apply-templates select="tns:P_125"/>
                    </td>
                    <td class="wypelniane" style="width: 15%">
                        <div class="opisrubryki">126. Wyrażam zgodę</div>
                        <xsl:choose>
                            <xsl:when test="tns:P_126 = 1">
                                <input type="checkbox" checked="checked" disabled="disabled"/>tak
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <td class="wypelniane" colspan="2">
                        <div class="opisrubryki">127.</div>
                        <xsl:apply-templates select="tns:P_127"/>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="InformacjeOZalacznikach">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <div class="tytul-sekcja-blok">
                <h2>
                    <xsl:value-of select="$sekcja"/> INFORMACJE O ZAŁĄCZNIKACH
                </h2>
                <p class="opis-tekstowy">
                    W poz. 128–131 należy podać liczbę załączników. Poz. 132 i 133 wypełniają podatnicy, którzy
                    załącznik PIT/D dołączyli do innego niż składane
                    zeznanie. Jeśli w poz. 132 zaznaczono kwadrat nr 2, należy wypełnić poz. 134.
                </p>
            </div>
            <table class="normalna">
                <tr>

                    <td class="niewypelniane" style="width: 25%">PIT/O</td>
                    <td class="niewypelniane" style="width: 25%">Certyfikat rezydencji</td>
                    <td class="niewypelniane" style="width: 25%">PIT-2K</td>
                    <td class="niewypelniane" style="width: 25%">PIT/D</td>
                </tr>
                <tr>

                    <td class="wypelniane">
                        <div class="opisrubryki">128.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_128"/>
                        </div>
                    </td>
                    <td class="wypelniane">
                        <div class="opisrubryki">129.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_129"/>
                        </div>
                    </td>
                    <td class="wypelniane">
                        <div class="opisrubryki">130.</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_130"/>
                        </div>
                    </td>
                    <td class="wypelniane">
                        <div class="opisrubryki">131</div>
                        <div class="kwota">
                            <xsl:value-of select="tns:P_131"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="wypelniane" colspan="2">
                        <div class="rowdiv">
                            <xsl:variable name="wartosc3" select="tns:P_132"/>
                            <div class="opisrubryki">132. Załącznik PIT/D dołącza do swojego zeznania:</div>
                            <xsl:choose>
                                <xsl:when test="$wartosc3 =1">
                                    <input type="checkbox" checked="checked" disabled="disabled"/>1. podatnik
                                </xsl:when>
                                <xsl:when test="$wartosc3 =2">
                                    <input type="checkbox" checked="checked" disabled="disabled"/>2. małżonek
                                </xsl:when>
                            </xsl:choose>
                        </div>
                    </td>
                    <td class="wypelniane" colspan="2">
                        <div class="rowdiv">
                            <xsl:variable name="wartosc4" select="tns:P_133"/>
                            <div class="opisrubryki">
                                133. Kod formularza, do którego został dołączony załącznik PIT/D:
                            </div>
                            <xsl:choose>
                                <xsl:when test="$wartosc4 ='1'">
                                    <input type="checkbox" checked="checked" disabled="disabled"/>1. PIT-28
                                </xsl:when>
                                <xsl:when test="$wartosc4 ='2'">
                                    <input type="checkbox" checked="checked" disabled="disabled"/>2. PIT-36
                                </xsl:when>
                                <xsl:when test="$wartosc4 ='3'">
                                    <input type="checkbox" checked="checked" disabled="disabled"/>3. PIT-37
                                </xsl:when>
                            </xsl:choose>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="wypelniane" colspan="4">
                        <div class="opisrubryki">
                            134. Identyfikator podatkowy, nazwisko i imię małżonka oraz urząd, do którego został złożony
                            załącznik PIT/D
                        </div>
                        <xsl:value-of select="tns:P_134"/>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="RachunekOsobistyDoZwrotu">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <div class="tytul-sekcja-blok">
                <h2>
                    <xsl:value-of select="$sekcja"/> RACHUNEK OSOBISTY WŁAŚCIWY DO ZWROTU NADPŁATY
                </h2>
                <p class="opis-tekstowy">
                    Jeżeli z zeznania wynika nadpłata w tej części można wskazać rachunek bankowy lub w spółdzielczej kasie
                    oszczędnościowo-kredytowej (SKOK), inny niż związany z prowadzoną działalnością gospodarczą, na
                    który ma nastąpić jej zwrot. Podaje się wyłącznie rachunek, którego posiadaczem (współposiadaczem)
                    jest podatnik lub małżonek. Wskazanie rachunku, którego posiadaczem (współposiadaczem) nie jest
                    podatnik, a jest nim małżonek, jest możliwe jedynie w przypadku zaznaczenia w poz. 6 kwadratu nr 2.
                    Wskazany rachunek aktualizuje poprzednio zgłoszony rachunek służący do zwrotu podatku lub nadpłaty
                    osoby wskazanej w poz. 135.
                </p>
            </div>

            <table class="normalna">
                <tr>
                    <td class="wypelniane" style="width: 100%">
                        <div class="opisrubryki">135. Osoba zgłaszająca rachunek 
							<font style="font-weight: normal">(należy zaznaczyć właściwe kwadraty; kwadrat nr 2 można zaznaczyć wyłącznie w przypadku zaznaczenia w poz. 6 kwadratu  nr 2):</font></div>
                            <xsl:if test="tns:P_135_1 ='1'">
                                <input type="checkbox" checked="checked" disabled="disabled"/>1. podatnik
                            </xsl:if>
                            <xsl:if test="tns:P_135_2 ='1'">
                                <input type="checkbox" checked="checked" disabled="disabled"/>2. małżonek
                            </xsl:if>
                    </td>
                </tr>
                <tr>
                    <td class="wypelniane" style="width: 100%">
                        <div class="divrow">
                            <div class="opisrubryki">136. Posiadacz rachunku
								<font style="font-weight: normal">(wypełnić wyłącznie, gdy posiadaczem są również inne osoby niż wskazane w poz. 135):</font>
							</div>
                            <xsl:value-of select="tns:P_136"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="wypelniane" style="width: 100%">
                        <div class="divrow">
                            <div class="opisrubryki">137. Kraj siedziby banku (oddziału)
								<font style="font-weight: normal">(uzupełnić wyłącznie, gdy wskazano rachunek zagraniczny)</font></div>
                            <xsl:call-template name="ZnajdzWEnumeracji">
                                <xsl:with-param name="schema" select="$schema-krajow"/>
                                <xsl:with-param name="typ" select="'TKodKraju'"/>
                                <xsl:with-param name="kod" select="tns:P_137"/>
                            </xsl:call-template>
                            (<xsl:apply-templates select="tns:P_137"/>)
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="wypelniane" style="width: 100%">
                        <div class="divrow">
                            <div class="opisrubryki">138. Pełny numer rachunku 
								<font style="font-weight: normal">(w przypadku rachunku zagranicznego należy podać kod SWIFT)</font>
							</div>
							<table style="border-style: none; width: 100%">
								<tr>
									<td>
										<span>1. Numer IBAN:</span>
										<xsl:value-of select="tns:P_138_1"/>
									</td>
									<td>
										<span>2. Kod SWIFT:</span>
										<xsl:value-of select="tns:P_138_2"/>
									</td>
								</tr>
							</table>
                        </div>
                    </td>
                </tr>
            </table>

        </xsl:for-each>
    </xsl:template>
	    <xsl:template name="KartaKDR">
        <xsl:param name="sekcja"/>
        <xsl:for-each select="tns:PozycjeSzczegolowe">
            <div class="tytul-sekcja-blok">
                <h2>
                    <xsl:value-of select="$sekcja"/> KARTA DUŻEJ RODZINY (KDR)
                </h2>
                <p class="opis-tekstowy">
                    Wypełnienie poz. 139 nie jest obowiązkowe.
                </p>
            </div>

            <table class="normalna">
                <tr>
                    <td class="wypelniane" style="width: 100%">
                        <div class="opisrubryki">139. Osoba posiadająca ważną KDR:
							<font style="font-weight: normal">(kwadrat nr 2 można zaznaczyć wyłącznie w przypadku zaznaczenia w poz. 6 kwadratu  nr 2):</font>
						</div>
                            <xsl:if test="tns:P_139_1 ='1'">
                                <input type="checkbox" checked="checked" disabled="disabled"/>1. podatnik
                            </xsl:if>
                            <xsl:if test="tns:P_139_2 ='1'">
                                <input type="checkbox" checked="checked" disabled="disabled"/>2. małżonek
                            </xsl:if>
                    </td>
                </tr>
            </table>

        </xsl:for-each>
    </xsl:template>
	
    <xsl:template name="PrzypisyIndeks">
        <h3 align="justify">
            <font size="2pt">
                <sup>1)</sup>
                Przez urząd, do którego jest adresowane zeznanie rozumie się urząd skarbowy, przy pomocy którego
                właściwy dla podatnika naczelnik urzędu skarbowego wykonuje swoje zadania.
            </font>
        </h3>
        <h3 align="justify">
            <font size="2pt">
                <sup>2)</sup>
                Zgodnie z art. 81 ustawy z dnia 29 sierpnia 1997 r. – Ordynacja podatkowa (Dz. U. z 2018 r. poz. 800, z
                późn. zm.).
            </font>
        </h3>
        <h3 align="justify">
            <font size="2pt">
                <sup>3)</sup>
                Należy wpisać kwotę składek, o których mowa w art. 26 ust. 1 pkt 2 i 2a oraz art. 27b ust. 1 i 2 ustawy,
                tj. zapłaconych w roku podatkowym i podlegających odliczeniu
                (wykazanych przez płatnika lub samodzielnie wpłaconych do ZUS lub zagranicznych systemów ubezpieczeń),
                pomniejszonych o składki odliczone w PIT-36L,
                w PIT-28 lub wykazane jako odliczone w PIT-16A lub PIT-19A. W przypadku obojga rodziców,
                opiekunów prawnych dziecka, rodziców zastępczych, którzy
                pozostają w związku małżeńskim przez cały rok podatkowy, należy wypełnić zarówno poz. 116 jak i poz.
                117. Zasada ta obejmuje również podatnika, który zawarł
                związek małżeński przed rozpoczęciem roku podatkowego, a jego małżonek zmarł w trakcie roku podatkowego.
            </font>
        </h3>
        <h3 align="justify">
            <font size="2pt">
                <sup>4)</sup>
                Poz. 119 wypełnia się jedynie w przypadku łącznego opodatkowania dochodów małżonków.
            </font>
        </h3>
        <h3 align="justify">
            <font size="2pt">
                <sup>5)</sup>
                W przypadku obojga rodziców, opiekunów prawnych dziecka, rodziców zastępczych, którzy pozostają w
                związku małżeńskim przez cały rok podatkowy, składających
                odrębne zeznania PIT-36 albo PIT-37, suma kwot z poz. 120 PIT-37 i poz. 327 PIT-36,
                każdego z małżonków, nie może przekroczyć sumy kwot
                z poz. 116 i 117. Na podstawie art. 72 § 1a ustawy z dnia 29 sierpnia 1997 r. – Ordynacja podatkowa,
                kwotę obliczoną zgodnie z art. 27f ust. 8–10 ustawy traktuje się
                na równi z nadpłatą.
            </font>
        </h3>
    </xsl:template>
    <xsl:template name="PouczeniaKoncowe">
        <xsl:if test="tns:Pouczenia =1">
            <h2 class="tekst">Pouczenia</h2>
            <h3 align="justify">
				<font size="2pt">
					W przypadku niewpłacenia w obowiązującym terminie kwoty z poz. 114 lub wpłacenia jej w niepełnej wysokości niniejsze zeznanie stanowi podstawę do wystawienia
					tytułu wykonawczego, zgodnie z przepisami o postępowaniu egzekucyjnym w administracji.
					<br/>
					Za podanie nieprawdy lub zatajenie prawdy i przez to narażenie podatku na uszczuplenie grozi
					odpowiedzialność przewidziana w Kodeksie karnym skarbowym.
					<br/>
				</font>
            </h3>
        </xsl:if>
        <div class="lamstrone"/>
    </xsl:template>
    <xsl:template name="valueOrZero">
        <xsl:param name="value"/>
        <xsl:if test="$value">
            <xsl:value-of select="$value"/>
        </xsl:if>
        <xsl:if test="not($value)">
            0
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>