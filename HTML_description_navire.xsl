<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    version="2.0">
    
    <xsl:output 
        method="html" 
        indent="yes"
    />
    
    <!-- ETAPE 1 : DECLARATION DES VARIABLES -->
    
    <!--chemin des fichiers de sortie-->
    <xsl:variable name='home'>
        <xsl:value-of select="concat('description_navire_accueil','.html')"/> 
        <!-- variable pour le contenu de l'accueil -->
    </xsl:variable>
    
    <xsl:variable name='extraits'>
        <xsl:value-of select="concat('description_navire_extraits','.html')"/>
        <!-- variable pour le contenu du texte -->
    </xsl:variable>
    
    <xsl:variable name='navires_exception'>
        <xsl:value-of select="concat('description_navire_exception','.html')"/>
        <!-- variable pour le contenu de la page présentant les navires -->
    </xsl:variable>
    
    <xsl:variable name='auteur_et_son_ouvrage'>
        <xsl:value-of select="concat('description_navire_auteur_et_son_ouvrage','.html')"/>
    </xsl:variable>
    
    <xsl:variable name='glossaire'>
        <xsl:value-of select="concat('description_navire_glossaire','.html')"/>
        <!-- variable pour le contenu du glossaire -->
    </xsl:variable>
    
    <!-- variables contenant les liens de retour et leur habillage -->
    <xsl:variable name='return_accueil'>
        <a href="./{$home}" style="color: #1D3461; font-weight: bold; font-size: 16px; text-decoration: none;" onmouseover="this.style.backgroundColor='#DBE9EE'" onmouseout="this.style.backgroundColor='transparent'">Accueil</a> 
    </xsl:variable>
    
    <xsl:variable name='return_extraits'>
        <a href="./{$extraits}" style="color: #1D3461; font-weight: bold; font-size: 16px; text-decoration: none;" onmouseover="this.style.backgroundColor='#DBE9EE'" onmouseout="this.style.backgroundColor='transparent'">Extraits</a> 
    </xsl:variable> 
    
    <xsl:variable name='return_navires'>
        <a href="./{$navires_exception}" style="color: #1D3461; font-weight: bold; font-size: 16px; text-decoration: none;" onmouseover="this.style.backgroundColor='#DBE9EE'" onmouseout="this.style.backgroundColor='transparent'">Navires d'exception</a> 
    </xsl:variable>
    
    <xsl:variable name="return_auteur_livre">
        <a href="./{$auteur_et_son_ouvrage}" style="color: #1D3461; font-weight: bold; font-size: 16px; font-weight: bold; text-decoration: none;" onmouseover="this.style.backgroundColor='#DBE9EE'" onmouseout="this.style.backgroundColor='transparent'">L'auteur et son ouvrage</a> 
    </xsl:variable>
    
    <xsl:variable name='return_glossaire'>
        <a href="./{$glossaire}" style="color: #1D3461; font-weight: bold; font-size: 16px; text-decoration: none;" onmouseover="this.style.backgroundColor='#DBE9EE'" onmouseout="this.style.backgroundColor='transparent'">Glossaire</a> 
    </xsl:variable>
    
    <!-- variable contenant le nom de l'auteur -->
    <xsl:variable name='auteur'>
        <xsl:value-of select="//fileDesc/titleStmt/author/concat(roleName, ' ',forename, ' ', surname)"/>
    </xsl:variable>
    
    <!-- variable contenant le header -->
    <xsl:variable name='header'>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title>
                <xsl:value-of select="//fileDesc/titleStmt/title"/>
            </title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="//fileDesc/titleStmt/title"/>
                    <xsl:text>par</xsl:text>
                    <xsl:value-of select="$auteur"/>
                </xsl:attribute>
            </meta>
            <meta name="author">
                <xsl:attribute name="content">Maddalena Accardo</xsl:attribute>                
            </meta>
            <!-- changement de police d'écriture et de couleur de fond -->
            <style>
                body {
                font-family: 'Constantia';
                background-color:  #FEFEFA;
                }
            </style>
        </head>
    </xsl:variable>
    
    <!-- variable contenant le <footer> -->
    <xsl:variable name="footer">
        <footer style="text-align: center;">
            <p><i><xsl:value-of select="//editionStmt/edition"/>.</i></p>
        </footer>
    </xsl:variable>
    
    <!-- variable contenant le css du body -->
    <xsl:variable name="body_css">
        <div>
            <xsl:text>margin-right: 20%; margin-left: 20%; margin-top: 6%;</xsl:text>
        </div>
    </xsl:variable>
    
    <!-- variable contenant l'en-tête du <body> des pages -->
    <xsl:variable name="body_header">
        <div style="text-align: center; margin-bottom: 8%"> 
            <h1 style="color: #1D3461">Édition en ligne de l'ouvrage <i><xsl:value-of select="//fileDesc/titleStmt/title"/></i></h1>
            <p><xsl:value-of select="$auteur"/></p>
        </div>
    </xsl:variable>
  
    <!-- variable contenant le menu et les liens clickables -->
    <xsl:variable name="menu">
        <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap;">
            <hr style="margin: 0; width: 100%;" />
            <span style="display: inline-block; margin: 20px;">
                    <xsl:copy-of select="$return_accueil"/>
            </span>
            <span style="display: inline-block; margin: 20px;">
                    <xsl:copy-of select="$return_extraits"/>
            </span>
            <span style="display: inline-block; margin: 20px;">
                    <xsl:copy-of select="$return_auteur_livre"/>
            </span>
            <span style="display: inline-block; margin: 20px;">
                    <xsl:copy-of select="$return_navires"/>             
            </span>
            <span style="display: inline-block; margin: 20px;">
                    <xsl:copy-of select="$return_glossaire"/>
            </span>
            <hr style="margin: 0; width: 100%;" />
        </div>
    </xsl:variable>
    
    <!-- fin des déclarations des variables-->
    
    <!-- template match sur la racine avec les call templates des pages -->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="Extraits"/>
        <xsl:call-template name="glossaire_description_navire"/>
        <xsl:call-template name="navire_exception"/>
        <xsl:call-template name="presentation_auteur_et_son_ouvrage"/>
    </xsl:template>
    
    <!-- ETAPE 2 : LA PAGE D'ACCUEIL -->
    <xsl:template name="home">
            <xsl:result-document href="{$home}" method="html">
                <html lang="fr">
                    <xsl:copy-of select="$header"/>
                <body> 
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <h2 style="text-align: center;">Accueil</h2>
                    <!-- menu clickable -->
                    <xsl:copy-of select="$menu"/>
                    <div style="text-align: justify;">
                        <h3>Pourquoi ce site ?</h3>
                        <p>Ce site a pour but de mettre en avant l'œuvre de l'<xsl:value-of select="$auteur"/>, en se concentrant spécifiquement sur l'ouvrage <i>Souvenirs de marine</i>, aussi intitulé <i><xsl:value-of select="//fileDesc/titleStmt/title"/></i>. Ce livre, qui comprend des gravures et des plans extrêmement détaillés, constitue une mine d'informations sur l'architecture navale. Par conséquent, on trouvera ici une édition modernisée du texte, accompagnée d'une définition de chaque terme rencontré.</p>
                        <div style="text-align: center;"><img src="./bpt6k5699565s_f16.jpg" alt="plan de navires arabes et indiens" width="900" height="600"/></div>
                        
                        <h3>Présentation du projet</h3>
                        
                        <h4>Projet d'encodage</h4>
                        <p><xsl:value-of select="//encodingDesc/projectDesc/p"/></p>
                        
                        <h4>La partie du livre encodé</h4>
                        <xsl:for-each select="//fileDesc//biblFull/seriesStmt/biblScope">
                            <p><xsl:value-of select="."/></p>
                        </xsl:for-each>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- ETAPE 3 : LA PAGE CONTENANT LES EXTRAITS DE TEXTE -->
    <xsl:template name="Extraits">
        <xsl:result-document href="{$extraits}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <h2 style="text-align: center;">Extraits de l'ouvrage</h2>
                    <!-- menu clickable -->
                    <xsl:copy-of select="$menu"/>
                    <br/>
                    <div style="text-align: justify;">
                        <!-- organisation du texte en extrayant les numéro des extraits -->
                        <xsl:for-each select="//text/body/div">
                            <xsl:variable name="extractNum" select="@n"/> <!-- Le choix est fait de laisser la variable relative au numéro des extraits dans le corps du texte, car elle est utilisée uniquement dans ce contexte -->
                                <h3>Extrait n°<xsl:value-of select="$extractNum"/></h3>
                                <br>
                                    <xsl:value-of select="p"/>
                                </br>
                        </xsl:for-each>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- ETAPE 4 : LA PAGE CONTENANT LA PRESENTATION DES NAVIRES -->
    <xsl:template name="navire_exception">
            <xsl:result-document href="{$navires_exception}" method="html">
                <html lang="fr">
                    <xsl:copy-of select="$header"/>
                    <body>
                     <xsl:attribute name="style">
                         <xsl:value-of select="$body_css"/>
                     </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <h2 style="text-align: center;">Navires d'exception</h2> 
                    <!-- menu clickable -->
                    <xsl:copy-of select="$menu"/>
                    
                    <div>
                        <!-- un xsl:for-each aurait pu être utilisé, mais il devenair alors difficile de mettre l'image du navire juste en dessous du texte correspondant, ce qui explique l'abandon de cette balise -->
                         <br/>
                               <p><b>Nom : </b> <i><xsl:value-of select="//standOff/listPerson/person[1]//ref"/></i></p>
                               <p><b>Date de création : </b><xsl:value-of select="//standOff/listPerson/person[1]//birth"/></p>
                               <p><b>Note : </b><xsl:value-of select="//standOff/listPerson/person[1]//note"/>.</p>
                                <p><b>Pour plus d'information : </b><a href="https://fr.wikipedia.org/wiki/Couronne_(1632)"><xsl:value-of select="//standOff/listPerson/person[1]//ref/@target"/></a></p> 
                                <div style="text-align: center;"><img src="./bpt6k5699565s_f10.jpg" alt="coupe d'un navire" width="900" height="600"/></div>
                            
                                <p><b>Nom : </b><i><xsl:value-of select="//standOff/listPerson/person[2]//ref"/></i></p>
                                <p><b>Date de création : </b> <xsl:value-of select="//standOff/listPerson/person[2]//birth"/></p>
                                <p><b>Note : </b><xsl:value-of select="//standOff/listPerson/person[2]//note"/>.</p>
                                <p><b>Pour plus d'information : </b><a href="https://fr.wikipedia.org/wiki/Royal_Louis_(1759)"><xsl:value-of select="//standOff/listPerson/person[2]//ref/@target"/></a></p>
                                <div style="text-align: center;"><img src="./bpt6k5699565s_f34.jpg" alt="coupe d'un navire" width="900" height="600"/></div>
                            
                    </div>
                    <p>
                        
                    </p>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- ETAPE 5 : LA PAGE CONTENANT LE GLOSSAIRE -->
    <xsl:template name="glossaire_description_navire">
            <xsl:result-document href="{$glossaire}">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <h2 style="text-align: center;">Glossaire</h2> 
                    <!-- menu clickable -->
                    <xsl:copy-of select="$menu"/>
                    
                    <div style="text-align: justify;">
                        <div>                            
                            <!-- index des noms de lieux -->
                            <xsl:for-each select="//standOff/listPlace">
                                <br/>
                                <h3>Endroits, espaces et emplacements accessibles d'un navire</h3>
                                    <xsl:for-each select="./place">
                                        <p>
                                            <b><xsl:value-of select="string-join(placeName, ', ')"/></b> <!-- utilisation de string-join pour mettre des virgules si plusieurs termes existent pour une même définition-->
                                            <xsl:text> : </xsl:text>
                                            <xsl:value-of select="./note"/>
                                        </p>
                                    </xsl:for-each>
                            </xsl:for-each>
                            <br/>
                            <!-- insertion d'une image -->
                            <div style="text-align: center;"><img src="./bpt6k5699565s_f36.jpg" alt="coupe d'un navire" width="900" height="600"/></div>
                            <!-- index des noms d'éléments et de types de navires -->
                            <xsl:for-each-group select="//standOff/listObject" group-by="./@type">
                                <xsl:choose>
                                    <xsl:when test="./@type='element'">
                                        <br/>    
                                        <h3>Composants et éléments constitutifs d'un navire</h3>
                                                <xsl:for-each select="./object">
                                                    <p>
                                                        <b><xsl:value-of select="string-join(./objectIdentifier/objectName, ', ' )"/></b> <!-- utilisation de string-join pour mettre des virgules si plusieurs termes existent pour une même définition-->
                                                        <xsl:text> : </xsl:text>
                                                        <xsl:value-of select="./physDesc/p"/>
                                                    </p>
                                                </xsl:for-each>
                                    </xsl:when>
                                    <xsl:when test="./@type='ships'">
                                        <br/>
                                        <h3>Types de navires existants</h3>
                                        <xsl:for-each select="./object">
                                                <p><b><xsl:value-of select="./objectIdentifier/objectName/name"/></b>
                                                <xsl:text> : </xsl:text>
                                                <xsl:value-of select="./objectIdentifier/objectName/note"/></p>
                                            
                                        </xsl:for-each>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each-group> 
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- ETAPE 6: PRESENTATION DE L'AUTEUR ET DE L'OUVRAGE -->
    <xsl:template name="presentation_auteur_et_son_ouvrage">
        <xsl:result-document href="{$auteur_et_son_ouvrage}">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <h2 style="text-align: center;">L'auteur et son ouvrage</h2>
                    <!-- menu clickable -->
                    <xsl:copy-of select="$menu"/>
                    <div style="text-align: justify;"> 
                        <h3>Présentation de l'auteur</h3>
                       <p>L'<xsl:value-of select="$auteur"/> (1806-1893), est un amiral français du XIXe siècle, connu pour ses travaux en construction navale dans la période de développement de la propulsion à vapeur, pour son rôle dans l'organisation du Musée national de la Marine et pour ses publications sur la construction navale dans le monde.</p>
                    </div>
                    <div style="text-align: justify;">
                        <h3>Présentation de l'ouvrage</h3>
                        <!-- ajout d'un texte rédigé -->
                        <p>Ce livre commente la structure des navires les plus performants du 17e, au 18e et au début du 19e afin de donner les informations nécessaires aux ingénieurs de marine de la fin du 19e qui souhaitent étudier les anciens modèles. Cet ouvrage suit une vocation à la fois historique et scientifique puisque l'auteur fournit :</p>
                        <ul>
                            <li>des informations concernant les différents types de navire existants</li>
                            <li>des détails généraux relatifs à la vie à bord du navire</li>
                            <li>des détails décrivant les différents éléments qui composent le navire</li>
                            <li>des détails relatifs à la géographie d'un navire (tous les endroits où un être humain peut se rendre)</li>
                            <li>des précisions mathématiques sur les mesures d'un navire.</li>
                        </ul>
                    <p>Les "Souvenirs de Marine" de l'amiral Pâris, avec leurs 360 plans cotés en grand format, constituent une documentation unique au monde dans le domaine de l'archéologie navale. L'immense mérite de Pâris a été de s'astreindre à collecter et à faire graver vingt années durant, sans souci des modes et des préoccupation de rentabilité, les plans de bateaux d'origines et de catégories différentes.</p>
                    <p>C'est ainsi que nous lui devons de connaître les relevés de centaines d'embarcations côtières du monde entier, d'un grand intérêt archéologique, et dont aucun plan n'a jamais existé. Les très nombreux plans de vaisseaux, galères, bombardes, bricks... des "souvenirs" nous épargnent d'interminables quêtes dans tous les musées d'Europe. La finesse de la gravure fait d'ailleurs oublier le prestige des documents originaux des XVIIe et XVIIIe siècles, parfois peu clairs, et qui sont rarement accessibles au commun des mortels. </p>
                    </div>
                    <h4>L'édition d'époque</h4>
                    <xsl:for-each select="//fileDesc//biblFull/publicationStmt">
                    <p>Date de publication : <xsl:value-of select="./date"/></p>
                    <p>Editeur : <xsl:value-of select="./publisher"/></p>
                    <p>Adresse de l'éditeur : n° <xsl:value-of select="./pubPlace//address/street/num"/> au <xsl:text>6e Quai des Augustins</xsl:text></p>
                    <p>Nombre de gravures contenues dans l'ouvrage : 39</p>
                    <p>Nombre total de pages : 128</p>
                    </xsl:for-each>
                        
                    <h4>L'édition numérisée</h4>
                    <p>Pour consulter le document : <a href="https://gallica.bnf.fr/ark:/12148/bpt6k5699565s/f50.planchecontact#">https://gallica.bnf.fr/ark:/12148/bpt6k5699565s/f50.planchecontact#</a></p>
                    <p>Editeur en ligne : <xsl:value-of select="//fileDesc/publicationStmt/publisher"/></p>
                    <p>Date de mise en ligne : <xsl:value-of select="//fileDesc/publicationStmt/date"/></p>
                    <p>Licence : <xsl:value-of select="//fileDesc/publicationStmt//licence"/></p>   
                </body>
            </html> 
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>