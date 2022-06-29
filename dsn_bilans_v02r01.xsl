<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gipmds="http://www.gip-mds.fr/">
	<!-- $Revision: 28257 $ -->
	<xsl:template name="string-replace">
		<xsl:param name="str" />
		<xsl:param name="search" />
		<xsl:param name="replace" />

		<xsl:choose>
			<!-- Si la chaine de recherche contient plusieurs sous-chaine -->
			<xsl:when test="contains($search, ';')">
				<!-- on recupere la premiere sous-chaine -->
				<xsl:variable name="search-item" select="substring-before($search,';')"/>
				<xsl:variable name="replace-item" select="substring-before($replace,';')"/>
				<xsl:choose>
					<!-- Si le texte contient la sous-chaine de remplacement -->
					<xsl:when test="$search-item and contains($str, $search-item)">
						<!-- On rappele le template en remplacant la sous-chaine trouve par la sous-chaine de remplacement -->
						<xsl:call-template name="string-replace">
							<xsl:with-param name="str" select="concat(substring-before($str,$search-item),$replace-item,substring-after($str,$search-item))" />
							<xsl:with-param name="search" select="$search" />
							<xsl:with-param name="replace" select="$replace" />	
						</xsl:call-template>
					</xsl:when>
					<!-- Si le texte ne contient pas la sous-chaine -->
					<xsl:otherwise>
						<xsl:variable name="reste-search" select="substring-after($search,';')"/>
						<xsl:variable name="reste-replace" select="substring-after($replace,';')"/>
						<!-- on rappele le template en retirant la sous-chaine dont on a fini le traitement -->
						<xsl:call-template name="string-replace">
							<xsl:with-param name="str" select="$str" />
							<xsl:with-param name="search" select="$reste-search" />
							<xsl:with-param name="replace" select="$reste-replace" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose> 
			</xsl:when>
			<!-- si la chaine de recherche ne contient pas plusieurs sous-chaine -->
			<xsl:otherwise>
				<xsl:choose>
					<!-- si la chaine de recherche est contenue dans le message -->
					<xsl:when test="$search and contains($str, $search)">
						<!-- on rappele le template en remplacant la chaine de recherche par la chaine de remplacement -->
						<xsl:call-template name="string-replace">
							<xsl:with-param name="str" select="concat(substring-before($str,$search),$replace,substring-after($str, $search))" />
							<xsl:with-param name="search" select="$search" />
							<xsl:with-param name="replace" select="$replace" />	
						</xsl:call-template>
					</xsl:when>
					<!-- si la chaine de recherche n'est pas dans le message, on a fini et on affiche le message -->
					<xsl:otherwise>
						<xsl:value-of select="$str" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="encoding-characters">
		<xsl:param name="message" />

		<xsl:call-template name="string-replace">
			<xsl:with-param name="str" select="$message" />
			<xsl:with-param name="search">
				<xsl:text>Ã´;</xsl:text>
				<!-- Mettre ici les chaines a rechercher separe par des ; -->
				<!-- exemple de caractères qui pourraient poser problème <xsl:text>â¬;Å“;Ã€;Ã‡;ÃË†;Ã‰;ÃŠ;Ãâ€¹;ÃŽ;Ã”;Ãâ€“;Ã™;Ãâ€º;Ãœ;Ã ;Ã§;Ã¨;Ã©;Ãª;Ã«;Ã®;Ã¯;Ã´;Ã¶;Ã¹;Ã»;Ã¼;</xsl:text> -->
			</xsl:with-param>
			<xsl:with-param name="replace">
				<xsl:text>ô;</xsl:text>
				<!-- Metrre ici les chaines de remplacement separe par des ; 
				- /!\ il doit y avoir autant de chaines de remplacement que de chaines recherche -->
				<!-- exemple de caractères qui pourraient poser problème <xsl:text>€;œ;À;Ç;È;É;Ê;Ë;Î;Ô;Ö;Ù;Û;Ü;à;ç;è;é;ê;ë;î;ï;ô;ö;ù;û;ü;</xsl:text> -->
			</xsl:with-param>
		</xsl:call-template>

	</xsl:template>

	<xsl:output method="html" encoding="UTF-8" />
	<xsl:template match="/">
		<html>
			<head>
				<title>DSN | La déclaration sociale nominative</title>
				<meta content="La déclaration sociale nominative va remplacer, automatiser et simplifier toutes les déclarations sociales demandées aux entreprises, experts-comptables, collectivités et associations." name="description"/>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<meta http-equiv="pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="Thu, 01 Dec 1994 120000 GMT" />
				<meta http-equiv="X-UA-Compatible" content="IE=8" />
				<link href="/dsn/ressources/images/favicon.png" rel="shortcut icon" type="image/x-icon"/>
				<link rel="stylesheet" type="text/css" href="/dsn/ressources/css/jspTemplate.css" />
				<link rel="stylesheet" type="text/css" href="/dsn/ressources/css/declaration.css" />
			</head>
			<body class="templateBody">
				<table class="templateContenuPage" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="templateBandeau" colspan="3">
								<a name="templateAncreHautDePage" id="templateAncreHautDePage"/>
								<div class="templateBandeauBlocTitre">
									<a>
										<xsl:attribute name="href">
											<xsl:choose>
												<xsl:when test="gipmds:rapport/bordereau/bordereau_identification/point_de_depot='02'">http://www.msa.fr</xsl:when>
												<xsl:when test="gipmds:rapport/envoi/envoi_identification/point_de_depot='02'">http://www.msa.fr</xsl:when>
												<xsl:otherwise>https://www.net-entreprises.fr</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<div class="templateBandeauTitreImage" style="cursor: pointer"/>
									</a>
									<div class="templateBandeauTitre"/>
								</div>
								<table class="templateBandeauLiens" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td nowrap="nowrap"/>
											<td align="right" nowrap="nowrap"/>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="templateBarreHautId" class="templateBarreHaut">
									<span class="label" id="label_declBarreDUCSTitre"/>
								</div>
							</td>
							<td id="bandeauOpsId" class="templateBarreDroiteHaut"/>
						</tr>
						<tr>
							<td class="templateBarreGauche" rowspan="2" valign="top">
								<img id="bandeauGauche" src="/dsn/ressources/images/bandeau-gauche.gif" alt="" title="" border="0" />
							</td>
							<td class="templateCorps" rowspan="2" valign="top" width="100%">
								<div class="templateCorpsSeparateur"/>
								<div class="templateTrainConteneur">
									<table class="templateTrain" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td nowrap="nowrap" width="50%">
													<div class="templateTrainEltCourantCrm">
														<a class="linkCrm">
															<span class="infobulle" id="label_decl_BulleTrainElt2">
																<span class="label" id="label_decl_TrainElt2">
																	<xsl:choose>
																		<xsl:when test="gipmds:rapport/@type= 'AEE'">Accusé d'Enregistrement Electronique</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= 'ARE'">Avis de Rejet</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= 'CCO'">Certificat de Conformité</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= 'BAN'">Bilan d'Anomalies</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= 'ANO'">Bilan d'Anomalies</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '20'">Bilan d'Identification des Individus</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '21'">Compte-rendu de Traitement</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '22'">Bilan de préparation des données destinées à l'Assurance maladie pour les arrêts de plus de 6 mois</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '31'">Compte rendu de traitement d’arrêts ou reprise du travail</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '33'">Compte rendu de traitement d’arrêts maladie de plus de six mois</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '41'">Compte-rendu de Déclaration de cotisation et de télérèglement</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '42'">Compte-rendu de la Déclaration des Données nominatives URSSAF</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '61'">Compte-rendu URSSAF</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '62'">Compte-rendu URSSAF</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '80'">Contrôles métier MSA</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="gipmds:rapport/@type"/>
																		</xsl:otherwise>
																	</xsl:choose>
																</span>
															</span>
														</a>
													</div>
												</td>
											</tr>
											<xsl:choose>
												<xsl:when test="gipmds:rapport/@type= 'CCO' and contains(gipmds:rapport/declaration/declaration_bilan/niveau_conformite/certificat_conformite,'Vous libère de vos obligations déclaratives vis à vis de la DSN')">
													<div class="templateTableauConteneur">
														<tr>
															<td align="left" style="width: 100%; height: 15px; color: red; font-family: verdana; font-size: 11px;">
																Le certificat de conformit&#233; vous lib&#232;re de vos obligations d&#233;claratives vis-&#224;-vis de la DSN. Cependant, vous devez imp&#233;rativement consulter l&#8217;ensemble des comptes rendus m&#233;tier et retours d&#8217;informations mis &#224; disposition par les organismes de protection sociale afin d&#8217;apporter les &#233;ventuelles modifications n&#233;cessaires au bon traitement des donn&#233;es.</td>
														</tr>
													</div>
												</xsl:when>
											</xsl:choose>
											<xsl:if test="gipmds:rapport/@message">
												<tr>
													<td>
														<div class="templateBlocETBContenu">
															<span class="templateBlocETBImportant">
															&#xA0;<xsl:value-of select="gipmds:rapport/@message"/>
															</span>
														</div>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</div>
								<div class="templateCorpsSeparateur"/>
								<xsl:choose>
									<xsl:when test="gipmds:rapport/envoi and gipmds:rapport/@type!= '21'">
										<br />
										<h1 class="TitreCrm">Bilan <xsl:value-of select="gipmds:rapport/envoi/envoi_bilan/envoi_etat"/>
										</h1>
										<div class="templateTableauConteneur">
											<table class="templateBlocInformatif" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td align="left" valign="top" width="100%" >
															<div class="templateBlocETBCrm">
																<xsl:if test="gipmds:rapport/envoi/envoi_bilan/envoi_contenu/declarations">
																	<strong>Nombre de déclarations : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_bilan/envoi_contenu/declarations"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_bilan/envoi_contenu/salaries">
																	<strong>Nombre de salariés : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_bilan/envoi_contenu/salaries"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_bilan/envoi_contenu/individus_non_salaries">
																	<strong>Nombre d'individus non salariés : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_bilan/envoi_contenu/individus_non_salaries"/>
																	<br/>
																</xsl:if>
																<xsl:for-each select="gipmds:rapport/envoi/envoi_bilan/envoi_compteurs">
																	<strong>Nombre d'anomalies de catégorie <xsl:value-of select="envoi_categorie"/> : </strong>
																	<xsl:value-of select="nombre"/>
																	<br/>
																</xsl:for-each>
																<br/>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<xsl:if test="gipmds:rapport/envoi/envoi_anomalie">
											<div class="templateTableauConteneur">
												<div class="templateTitreInformation">Anomalie(s)</div>
												<br/>
												<xsl:apply-templates select="gipmds:rapport/envoi/envoi_anomalie"/>
											</div>
										</xsl:if>
										<br />
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="gipmds:rapport/bordereau">
										<h1 class="TitreCrm">Bilan récapitulatif</h1>
										<br />
										<div class="templateSection">IDENTIFICATION</div>
										<div class="templateTableauConteneur">
											<table class="templateBlocInformatif" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td align="left" valign="top" width="100%" >
															<div class="templateBlocETBCrm">
																<strong>Point de dépôt (S10.G00.00.007) : </strong>
																<xsl:choose>
																	<xsl:when test="gipmds:rapport/bordereau/bordereau_identification/point_de_depot='01'">Net-entreprises</xsl:when>
																	<xsl:when test="gipmds:rapport/bordereau/bordereau_identification/point_de_depot='02'">MSA</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="gipmds:rapport/bordereau/bordereau_identification/point_de_depot"/>
																	</xsl:otherwise>
																</xsl:choose>
																<br/>
																<strong>Code envoi des fichiers d'essai ou réel (S10.G00.00.005) : </strong>
																<xsl:choose>
																	<xsl:when test="gipmds:rapport/bordereau/bordereau_identification/essai_reel='01'">envoi fichier test</xsl:when>
																	<xsl:when test="gipmds:rapport/bordereau/bordereau_identification/essai_reel='02'">envoi fichier réel</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="gipmds:rapport/bordereau/bordereau_identification/essai_reel"/>
																	</xsl:otherwise>
																</xsl:choose>
																<br/>
																<strong>Nature des déclarations (S20.G00.05.001) : </strong>
																<xsl:value-of select="gipmds:rapport/bordereau/bordereau_identification//nature"/>
																<br/>
																<xsl:if test="gipmds:rapport/bordereau/bordereau_identification/mois">
																	<strong>Mois : </strong>
																	<xsl:value-of select="gipmds:rapport/bordereau/bordereau_identification/mois"/>
																	<br/>
																</xsl:if>
																<strong>SIRET de l'emetteur (S10.G00.01.001, S10.G00.01.002) : </strong>
																<xsl:value-of select="gipmds:rapport/bordereau/bordereau_identification/emetteur_siret"/>
																<br/>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<br />
									</xsl:when>
								</xsl:choose>
								<xsl:if test="gipmds:rapport/declaration">	
									<xsl:for-each select="gipmds:rapport/declaration">
										<div class="templateSection">DÉCLARATION <xsl:value-of select="declaration_identification/rang"/>
										</div>
										<div class="templateTableauConteneur">
											<div class="templateTitreInformation">Identification</div>
											<br/>
											<xsl:if test="declaration_identification/nature">
												<strong>Nature de la déclaration (S20.G00.05.001) : </strong>
												<xsl:value-of select="declaration_identification/nature"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_identification/type">
												<strong>Type de la déclaration (S20.G00.05.002) : </strong>
												<xsl:value-of select="declaration_identification/type"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_identification/fraction">
												<strong>Numéro de fraction de la déclaration (S20.G00.05.003) : </strong>
												<xsl:value-of select="declaration_identification/fraction"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_identification/ordre">
												<strong>Numéro d'ordre de la déclaration (S20.G00.05.004) : </strong>
												<xsl:value-of select="declaration_identification/ordre"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_identification/mois">
												<strong>Date du mois principal déclaré (S20.G00.05.005) : </strong>
												<xsl:value-of select="declaration_identification/mois"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_identification/identifiant_metier">
												<strong>Identifiant métier (S20.G00.05.009) : </strong>
												<xsl:value-of select="declaration_identification/identifiant_metier"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_identification/id_annulation">
												<strong>Identifiant de la déclaration initiale annulée ou remplacée (S20.G00.05.006) : </strong>
												<xsl:value-of select="declaration_identification/id_annulation"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_identification/SIREN">
												<strong>SIREN (S21.G00.06.001) : </strong>
												<xsl:value-of select="declaration_identification/SIREN"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_identification/nic_siege">
												<strong>NIC Siège (S21.G00.06.002) : </strong>
												<xsl:value-of select="declaration_identification/nic_siege"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_identification/nic_affectation">
												<strong>NIC d'affectation (S21.G00.11.001) : </strong>
												<xsl:value-of select="declaration_identification/nic_affectation"/>
												<br/>
											</xsl:if>
											<br/>
											<div class="templateTitreInformation">Bilan <xsl:value-of select="declaration_bilan/etat"/>
											</div>
											<br />
											<xsl:if test="declaration_bilan/declaration_contenu/salaries">
												<strong>Nombre de salariés : </strong>
												<xsl:value-of select="declaration_bilan/declaration_contenu/salaries"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_bilan/declaration_contenu/individus_non_salaries">
												<strong>Nombre d'individus non salariés : </strong>
												<xsl:value-of select="declaration_bilan/declaration_contenu/individus_non_salaries"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_bilan/declaration_contenu/contrats">
												<strong>Nombre de contrats :</strong>
												<xsl:value-of select="declaration_bilan/declaration_contenu/contrats"/>
												<br/>
											</xsl:if>
											<xsl:for-each select="declaration_bilan/declaration_reconstituee">
												<xsl:choose>
													<xsl:when test="type = 'A6M'">
														<xsl:if test="etat = 'OK'">
															<strong>Nombre d'attestations de salaire valides pour des arrêts de plus de 6 mois : </strong>
															<xsl:value-of select="nombre"/>
															<br/>
														</xsl:if>
														<xsl:if test="etat='KO'">
															<strong>Nombre d'attestations de salaire invalides pour des arrêts de plus de 6 mois : </strong>
															<xsl:value-of select="nombre"/>
															<br/>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<strong>
															<xsl:value-of select="type"/>
														</strong>
														<xsl:value-of select="etat"/>
														<xsl:value-of select="nombre"/>
														<br/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
											<xsl:for-each select="declaration_bilan/declaration_compteurs">
												<strong>Nombre d'anomalies de catégorie <xsl:value-of select="categorie"/> : </strong>
												<xsl:value-of select="nombre"/>
												<br/>
											</xsl:for-each>
											<xsl:if test="declaration_bilan/niveau_conformite">
												<strong>Conformité <xsl:value-of select="declaration_bilan/niveau_conformite/etat_conformite"/>
												</strong>
												<br/>
												<xsl:if test="declaration_bilan/niveau_conformite/certificat_conformite">
													<strong>Certificat de conformité : </strong>
													<xsl:value-of select="declaration_bilan/niveau_conformite/certificat_conformite"/>
													<br/>
												</xsl:if>
											</xsl:if>
											<xsl:apply-templates select="declaration_bilan/salarie"/>
											<xsl:apply-templates select="declaration_bilan/contrat"/>
											<xsl:apply-templates select="declaration_bilan/taux_AT"/>
											<xsl:if test="declaration_bilan/mois">
												<strong>Date du mois principal déclaré : </strong>
												<xsl:value-of select="declaration_bilan/mois"/>
												<br/>
											</xsl:if>
											<xsl:if test="declaration_anomalie">
											<div class="templateTitreInformation">Anomalie(s) </div>
											<br/>
											<xsl:if test="//gipmds:rapport/@type= '20'">
												<table width="800">
													<!--<thead>-->
														<tr>
															<th width="50%" style="font-weight: bold; text-align: left;">Informations transmises en DSN</th>
															<th width="50%" style="font-weight: bold; text-align: left;">Informations présentes dans le SNGI</th>
														</tr>
													<!-- </thead> -->
												</table>
												<br/>
											</xsl:if>
											<xsl:apply-templates select="declaration_anomalie"/>
											<br/>
											</xsl:if>
										</div>										
									</xsl:for-each>
								</xsl:if>
								<h1 class="TitreCrm">Envoi <xsl:value-of select="gipmds:rapport/envoi/envoi_identification/identifiant"/>
								</h1>
								<xsl:choose>
									<xsl:when test="gipmds:rapport/envoi">
										<br />
										<div class="templateSection">IDENTIFICATION</div>
										<div class="templateTableauConteneur">
											<table class="templateBlocInformatif" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td align="left" valign="top" width="100%" >
															<div class="templateBlocETBCrm">
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/declarant">
																	<div class="templateBlocETBContenu">
																		<span class="templateBlocETBImportant">
																			<strong>DECLARANT</strong>
																		</span>	
																		<br />
																		<ul>
																			<li>SIRET : <xsl:value-of select="gipmds:rapport/envoi/envoi_identification/declarant/siret"/>
																			</li>
																			<li>Nom : <xsl:value-of select="gipmds:rapport/envoi/envoi_identification/declarant/nom"/>
																			</li>
																			<li>Prenom : <xsl:value-of select="gipmds:rapport/envoi/envoi_identification/declarant/prenom"/>
																			</li>
																		</ul>
																	</div>
																</xsl:if>
																<br/>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/idflux">
																	<strong>Identification du flux : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/idflux"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/identifiant_archive and (gipmds:rapport/envoi/envoi_identification/identifiant_archive != gipmds:rapport/envoi/envoi_identification/identifiant)">
																	<strong>Nom de l'archive : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/identifiant_archive"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/version_norme">
																	<strong>Numéro de version de la norme utilisée (S10.G00.00.006) : </strong>
																	<xsl:choose>
																		<xsl:when test="gipmds:rapport/envoi/envoi_identification/version_norme='PHASE1V1'">Phase 1 prototype v1.1</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/version_norme"/>
																		</xsl:otherwise>
																	</xsl:choose>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/point_de_depot">
																	<strong>Point de dépôt (S10.G00.00.007) : </strong>
																	<xsl:choose>
																		<xsl:when test="gipmds:rapport/envoi/envoi_identification/point_de_depot='01'">Net-entreprises</xsl:when>
																		<xsl:when test="gipmds:rapport/envoi/envoi_identification/point_de_depot='02'">MSA</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/point_de_depot"/>
																		</xsl:otherwise>
																	</xsl:choose>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/type_envoi">
																	<strong>Type de l'envoi (S10.G00.00.008) : </strong>
																	<xsl:choose>
																		<xsl:when test="gipmds:rapport/envoi/envoi_identification/type_envoi='01'">envoi normal</xsl:when>
																		<xsl:when test="gipmds:rapport/envoi/envoi_identification/type_envoi='02'">envoi néant</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/type_envoi"/>
																		</xsl:otherwise>
																	</xsl:choose>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/essai_reel">
																	<strong>Code envoi du fichier d'essai ou réel (S10.G00.00.005) : </strong>
																	<xsl:choose>
																		<xsl:when test="gipmds:rapport/envoi/envoi_identification/essai_reel='01'">envoi fichier test</xsl:when>
																		<xsl:when test="gipmds:rapport/envoi/envoi_identification/essai_reel='02'">envoi fichier réel</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/essai_reel"/>
																		</xsl:otherwise>
																	</xsl:choose>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/emetteur_siret">
																	<strong>SIRET de l'emetteur (S10.G00.01.001, S10.G00.01.002) : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/emetteur_siret"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/raison_sociale">
																	<strong>Raison sociale ou nom de l'emetteur (S10.G00.01.003) : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/raison_sociale"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/nom_logiciel">
																	<strong>Nom du logiciel utilisé (S10.G00.00.001) : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/nom_logiciel"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/editeur_logiciel">
																	<strong>Nom de l'éditeur (S10.G00.00.002) : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/editeur_logiciel"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/version_logiciel">
																	<strong>Numéro de version du logiciel utilisé (S10.G00.00.003) : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/version_logiciel"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/code_conformite">
																	<strong>Code de conformité en pré-contrôle (S10.G00.00.004) : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/code_conformite"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/date_reception">
																	<strong>Date de réception du fichier  : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/date_reception"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/heure_reception">
																	<strong>Heure de réception du fichier  : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/heure_reception"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/date_enregistrement">
																	<strong>Date d'enregistrement électronique : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/date_enregistrement"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/heure_enregistrement">
																	<strong>Heure d'enregistrement électronique : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/heure_enregistrement"/>
																	<br/>
																</xsl:if>
																<br/>
																<br/>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</xsl:when>
								</xsl:choose>
							</td>
							<td class="templateBarreDroite" valign="top">
								<img src="/dsn/ressources/images/ops.gif" alt="" title="" border="0" />
								<br />
								<img src="/dsn/ressources/images/bandeau-variable.gif" alt="" title="" border="0" />
							</td>
						</tr>
						<tr>
							<td class="templateBarreDroite" valign="bottom">&#xA0;</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="declaration_anomalie|envoi_anomalie">
		<strong>Code : </strong>
		<xsl:value-of select="description/code"/>
		<br/>
		<xsl:if test="description/categorie">
			<strong>Catégorie : </strong>
			<xsl:value-of select="description/categorie"/>
			<br/>
		</xsl:if>
		<strong>Message : </strong>
		<xsl:call-template name="encoding-characters">
			<xsl:with-param name="message">
				<xsl:value-of select="description/message"/>
			</xsl:with-param>
		</xsl:call-template>
		<br/>
		<xsl:if test="description/numero_ligne">
			<strong>Numéro de ligne : </strong>
			<xsl:value-of select="description/numero_ligne"/>
			<br/>
		</xsl:if>
		<xsl:if test="description/nombre">
			<strong>Nombre : </strong>
			<xsl:value-of select="description/nombre"/>
			<br/>
		</xsl:if>
		<xsl:if test="valeurs">
			<strong>Identifiant de la rubrique déclenchante : </strong>
			<xsl:value-of select="valeurs/rubrique_declenchante/identifiant"/>
			<br/>
			<xsl:if test="valeurs/rubrique_declenchante/libelle">
				<strong>Libellé de la rubrique déclenchante : </strong>
				<xsl:value-of select="valeurs/rubrique_declenchante/libelle"/>
				<br/>
			</xsl:if>
			<strong>Valeur de la rubrique déclenchante : </strong>
			<xsl:value-of select="valeurs/rubrique_declenchante/valeur"/>
			<br/>
		</xsl:if>
		<xsl:if test="valeurs/rubrique_associee">
			<xsl:for-each select="valeurs/rubrique_associee">
				<strong>Identifiant de la rubrique associée : </strong>
				<xsl:value-of select="identifiant"/>
				<br/>
				<xsl:if test="libelle">
					<strong>Libellé de la rubrique associée : </strong>
					<xsl:value-of select="libelle"/>
					<br/>
				</xsl:if>
				<strong>Valeur de la rubrique associée : </strong>
				<xsl:value-of select="valeur"/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<br/>
		<xsl:apply-templates select="environnement/salarie"/>
		<xsl:apply-templates select="environnement/individu_non_salarie"/>
		<xsl:apply-templates select="environnement/contrat"/>			
	</xsl:template>
	
	<xsl:template match="salarie|individu_non_salarie">
		<table width="800">
			<tr>
				<td width="50%" style="vertical-align: top">
					<xsl:if test="name() = 'salarie'">
					<strong>Salarié <xsl:value-of select="@origine"/></strong>
					</xsl:if>
					<xsl:if test="name() = 'individu_non_salarie'">
					<strong>Individu non salarié <xsl:value-of select="@origine"/></strong>
					</xsl:if>
					<br/>
					<xsl:if test="NIR">
						<strong>NIR : </strong>
						<xsl:value-of select="NIR"/>
						<br/>
					</xsl:if>
					<xsl:if test="NTT">
						<strong>NTT : </strong>
						<xsl:value-of select="NTT"/>
						<br/>
					</xsl:if>
					<xsl:if test="nom_famille">
						<strong>Nom de famille : </strong>
						<xsl:value-of select="nom_famille"/>
						<br/>
					</xsl:if>
					<xsl:if test="nom_usage">
						<strong>Nom d'usage : </strong>
						<xsl:value-of select="nom_usage"/>
						<br/>
					</xsl:if>
					<xsl:if test="prenoms">
						<strong>Prénom : </strong>
						<xsl:value-of select="prenoms"/>
						<br/>
					</xsl:if>
					<xsl:if test="sexe">
						<strong>Sexe : </strong>
						<xsl:value-of select="sexe"/>
						<br/>
					</xsl:if>
					<xsl:if test="date_naissance">
						<strong>Date de naissance : </strong>
						<xsl:value-of select="date_naissance"/>
						<br/>
					</xsl:if>
					<xsl:if test="lieu_naissance">
						<strong>Lieu de naissance : </strong>
						<xsl:value-of select="lieu_naissance"/>
						<br/>
					</xsl:if>
					<xsl:if test="code_pays">
						<strong>Code pays : </strong>
						<xsl:value-of select="code_pays"/>
						<br/>
					</xsl:if>
					<xsl:if test="matricule">
						<strong>Matricule : </strong>
						<xsl:value-of select="matricule"/>
						<br/>
					</xsl:if>
					<xsl:if test="rang">
						<strong>Rang : </strong>
						<xsl:value-of select="rang"/>
						<br/>
					</xsl:if>
					<xsl:if test="taux_imposition_PAS">
						<strong>Taux imposition : </strong>
						<xsl:value-of select="taux_imposition_PAS"/>
						<br/>
					</xsl:if>
					<xsl:if test="future_imposition_PAS/taux">
						<strong>Futur taux d'imposition PAS: </strong>
						<xsl:value-of select="future_imposition_PAS/taux"/>
						<br/>
					</xsl:if>
					<xsl:if test="future_imposition_PAS/date_effet">
						<strong>Date d'effet du futur taux d'imposition PAS: </strong>
						<xsl:value-of select="future_imposition_PAS/date_effet"/>
						<br/>
					</xsl:if>
				</td>															
			</tr>
		</table>
		<br/>
	</xsl:template>
	
	<xsl:template match="contrat">
		<table width="800">
			<tr>
				<td width="50%" style="vertical-align: top">
					<xsl:if test="date_debut_contrat">
						<strong>Date de début du contraaat : </strong>
						<xsl:value-of select="date_debut_contrat"/>
						<br/>
					</xsl:if>
					<xsl:if test="num_contrat">
						<strong>Numéro du contrat : </strong>
						<xsl:value-of select="num_contrat"/>
						<br/>
					</xsl:if>
					<xsl:if test="nature_contrat">
						<strong>Nature du contrat : </strong>
						<xsl:value-of select="nature_contrat"/>
						<br/>
					</xsl:if>
					<xsl:if test="statut_conventionnel_contrat">
						<strong>Statut conventionnel du contrat : </strong>
						<xsl:value-of select="statut_conventionnel_contrat"/>
						<br/>
					</xsl:if>
					<xsl:if test="libelle_emploi_contrat">
						<strong>Libellé emploi du contrat : </strong>
						<xsl:value-of select="libelle_emploi_contrat"/>
						<br/>
					</xsl:if>
					<xsl:if test="code_regime_maladie_contrat">
						<strong>Code régime de base risque maladie du contrat : </strong>
						<xsl:value-of select="code_regime_maladie_contrat"/>
						<br/>
					</xsl:if>
				</td>															
			</tr>
		</table>
		<br/>
	</xsl:template>
	
	<xsl:template match="taux_AT">
		<table width="800">
				<tr>
					<td width="50%" style="vertical-align: top">
						<xsl:if test="code_ctn">
							<strong>Code CTN : </strong>
							<xsl:value-of select="code_ctn"/>
							<br/>
						</xsl:if>
						<xsl:if test="section">
							<strong>Section : </strong>
							<xsl:value-of select="section"/>
							<br/>
						</xsl:if>
						<xsl:if test="code_risque">
							<strong>Code risque : </strong>
							<xsl:value-of select="code_risque"/>
							<br/>
						</xsl:if>
						<xsl:if test="temoin_bureau">
							<strong>Témoin de modulation bureau : </strong>
							<xsl:value-of select="temoin_bureau"/>
							<br/>
						</xsl:if>
						<xsl:if test="taux">
							<strong>Taux : </strong>
							<xsl:value-of select="taux"/>
							<br/>
						</xsl:if>
						<xsl:if test="date_effet">
							<strong>Date d'effet du taux AT : </strong>
							<xsl:value-of select="date_effet"/>
							<br/>
						</xsl:if>
						<xsl:if test="date_calcul">
							<strong>Date de calcul du taux AT : </strong>
							<xsl:value-of select="date_calcul"/>
							<br/>
						</xsl:if>
					</td>															
				</tr>
			</table>
		<br/>	
	</xsl:template>
</xsl:stylesheet>
