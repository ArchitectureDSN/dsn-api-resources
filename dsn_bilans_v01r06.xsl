<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gipmds="http://www.gip-mds.fr/">
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>DSN | La déclaration sociale nominative</title>
				<meta content="La déclaration sociale nominative va remplacer, automatiser et simplifier toutes les déclarations sociales demandées aux entreprises, experts-comptables, collectivités et associations." name="description"/>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<meta http-equiv="pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="Thu, 01 Dec 1994 120000 GMT"/>
				<meta http-equiv="X-UA-Compatible" content="IE=8"/>
				<link href="/dsn/ressources/images/favicon.png" rel="shortcut icon" type="image/x-icon"/>
				<link rel="stylesheet" type="text/css" href="/dsn/ressources/css/jspTemplate.css"/>
				<link rel="stylesheet" type="text/css" href="/dsn/ressources/css/declaration.css"/>
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
								<img id="bandeauGauche" src="/dsn/ressources/images/bandeau-gauche.gif" alt="" title="" border="0"/>
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
																		<xsl:when test="gipmds:rapport/@type= '20'">Bilan d'Identification des Salariés</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '21'">Compte-rendu de Traitement</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '22'">Bilan de préparation des données destinées à l'Assurance maladie pour les arrêts de plus de 6 mois</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '31'">Compte rendu de traitement d’arrêts ou reprise du travail</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '33'">Compte rendu de traitement d’arrêts maladie de plus de six mois</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '41'">Compte-rendu de Déclaration de cotisation et de télérèglement</xsl:when>
																		<xsl:when test="gipmds:rapport/@type= '42'">Compte-rendu de la Déclaration des Données nominatives URSSAF</xsl:when>
                                                                        <xsl:when test="gipmds:rapport/@type= '61'">Compte-rendu URSSAF</xsl:when>
                                                                        <xsl:when test="gipmds:rapport/@type= '62'">Compte-rendu URSSAF</xsl:when>
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
											<xsl:if test="gipmds:rapport/@message">
												<tr>
													<td>
														<div class="templateBlocETBContenu">
															<span class="templateBlocETBImportant">
															 <xsl:value-of select="gipmds:rapport/@message"/>
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
									<xsl:when test="gipmds:rapport/bordereau">
										<h1 class="TitreCrm">Bilan récapitulatif</h1>
										<br/>
										<div class="templateSection">IDENTIFICATION</div>
										<div class="templateTableauConteneur">
											<table class="templateBlocInformatif" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td align="left" valign="top" width="100%">
															<div class="templateBlocETBCrm">
																<strong>Point de dépôt (S10.G00.00.007) :</strong>
																<xsl:choose>
																	<xsl:when test="gipmds:rapport/bordereau/bordereau_identification/point_de_depot='01'">Net-entreprises</xsl:when>
																	<xsl:when test="gipmds:rapport/bordereau/bordereau_identification/point_de_depot='02'">MSA</xsl:when>
																	<xsl:otherwise>
																	<xsl:value-of select="gipmds:rapport/bordereau/bordereau_identification/point_de_depot"/>
																	</xsl:otherwise>
																</xsl:choose>
																<br/>
																<strong>Code envoi des fichiers d'essai ou réel (S10.G00.00.005) :</strong>
																<xsl:choose>
																	<xsl:when test="gipmds:rapport/bordereau/bordereau_identification/essai_reel='01'">envoi fichier test</xsl:when>
																	<xsl:when test="gipmds:rapport/bordereau/bordereau_identification/essai_reel='02'">envoi fichier réel</xsl:when>
																	<xsl:otherwise>
																	<xsl:value-of select="gipmds:rapport/bordereau/bordereau_identification/essai_reel"/>
																	</xsl:otherwise>
																</xsl:choose>
																<br/>
																<strong>Nature des déclarations (S20.G00.05.001) :</strong>
																<xsl:value-of select="gipmds:rapport/bordereau/bordereau_identification//nature"/>
																<br/>
																<xsl:if test="gipmds:rapport/bordereau/bordereau_identification/mois">
																	<strong>Mois :</strong>
																	<xsl:value-of select="gipmds:rapport/bordereau/bordereau_identification/mois"/>
																	<br/>
																</xsl:if>
																<strong>SIRET de l'emetteur (S10.G00.01.001, S10.G00.01.002) :</strong>
																<xsl:value-of select="gipmds:rapport/bordereau/bordereau_identification/emetteur_siret"/>
																<br/>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<br/>
									</xsl:when>
									<xsl:when test="gipmds:rapport/envoi">
										<h1 class="TitreCrm">Envoi <xsl:value-of select="gipmds:rapport/envoi/envoi_identification/identifiant"/></h1>
										<br/>
										<div class="templateSection">IDENTIFICATION</div>
										<div class="templateTableauConteneur">
											<table class="templateBlocInformatif" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td align="left" valign="top" width="100%">
															<div class="templateBlocETBCrm">
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/declarant">
																	<div class="templateBlocETBContenu">
																		<span class="templateBlocETBImportant"><strong>DECLARANT</strong></span>	
																		<br/>
																		<ul>
																			<li>SIRET : <xsl:value-of select="gipmds:rapport/envoi/envoi_identification/declarant/siret"/></li>
																			<li>Nom : <xsl:value-of select="gipmds:rapport/envoi/envoi_identification/declarant/nom"/></li>
																			<li>Prenom : <xsl:value-of select="gipmds:rapport/envoi/envoi_identification/declarant/prenom"/></li>
																		</ul>
																	</div>
																</xsl:if>
																<br/>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/idflux">
																	<strong>Identification du flux : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/idflux"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/identifiant_archive">
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
																	<strong>Date d'enregistrement électonique : </strong>
																	<xsl:value-of select="gipmds:rapport/envoi/envoi_identification/date_enregistrement"/>
																	<br/>
																</xsl:if>
																<xsl:if test="gipmds:rapport/envoi/envoi_identification/heure_enregistrement">
																	<strong>Heure d'enregistrement électonique : </strong>
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
										<br/>
										<h1 class="TitreCrm">Bilan <xsl:value-of select="gipmds:rapport/envoi/envoi_bilan/envoi_etat"/></h1>
										<div class="templateTableauConteneur">
											<table class="templateBlocInformatif" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td align="left" valign="top" width="100%">
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
																<xsl:for-each select="gipmds:rapport/envoi/envoi_bilan/envoi_compteurs">
																	<strong>Nombre d'anomalies de catégorie <xsl:value-of select="envoi_categorie"/> :</strong>
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
												<xsl:for-each select="gipmds:rapport/envoi/envoi_anomalie">
													<xsl:sort order="ascending" data-type="number" select="description/numero_ligne"/>
													<strong>Code : </strong>
													<xsl:value-of select="description/code"/>
													<br/>
													<xsl:if test="description/categorie">
													<strong>Catégorie : </strong>
													<xsl:value-of select="description/categorie"/>
													<br/>
													</xsl:if>
													<strong>Message : </strong>
													<xsl:value-of select="description/message"/>
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
												</xsl:for-each>
											</div>
										</xsl:if>
										<br/>
									</xsl:when>
								</xsl:choose>
								<xsl:if test="gipmds:rapport/declaration">	
									<xsl:for-each select="gipmds:rapport/declaration">
									<div class="templateSection" style="height :20px !important;">
										<table cellpadding="0" cellspacing="0" width="100%">
											<tbody>
												<tr>
													<td>DÉCLARATION <xsl:value-of select="position()"/></td>
													<td align="right"/>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="templateTableauConteneur">
										<div class="templateTitreInformation">Identification</div>
										<br/>
										<xsl:if test="declaration_identification/nature">
											<strong>Nature de la déclaration (S20.G00.05.001) :</strong>
											<xsl:value-of select="declaration_identification/nature"/>
											<br/>
										</xsl:if>
										<xsl:if test="declaration_identification/type">
											<strong>Type de la déclaration (S20.G00.05.002) :</strong>
											<xsl:value-of select="declaration_identification/type"/>
											<br/>
										</xsl:if>
										<xsl:if test="declaration_identification/fraction">
											<strong>Numéro de fraction de la déclaration (S20.G00.05.003) :</strong>
											<xsl:value-of select="declaration_identification/fraction"/>
											<br/>
										</xsl:if>
										<xsl:if test="declaration_identification/ordre">
											<strong>Numéro d'ordre de la déclaration (S20.G00.05.004) :</strong>
											<xsl:value-of select="declaration_identification/ordre"/>
											<br/>
										</xsl:if>
										<xsl:if test="declaration_identification/mois">
											<strong>Date du mois principal déclaré (S20.G00.05.005) :</strong>
											<xsl:value-of select="declaration_identification/mois"/>
											<br/>
										</xsl:if>
										<xsl:if test="declaration_identification/identifiant_metier">
											<strong>Identifiant métier (S20.G00.05.009) :</strong>
											<xsl:value-of select="declaration_identification/identifiant_metier"/>
											<br/>
										</xsl:if>
										<xsl:if test="declaration_identification/id_annulation">
											<strong>Identifiant de la déclaration initiale annulée ou remplacée (S20.G00.05.006) :</strong>
											<xsl:value-of select="declaration_identification/id_annulation"/>
											<br/>
										</xsl:if>
										<xsl:if test="declaration_identification/SIREN">
											<strong>SIREN (S21.G00.06.001) :</strong>
											<xsl:value-of select="declaration_identification/SIREN"/>
											<br/>
										</xsl:if>
										<xsl:if test="declaration_identification/nic_siege">
												<strong>NIC Siège (S21.G00.06.002) :</strong>
											<xsl:value-of select="declaration_identification/nic_siege"/>
											<br/>
										</xsl:if>
										<xsl:if test="declaration_identification/nic_affectation">
											<strong>NIC d'affectation (S21.G00.11.001) :</strong>
											<xsl:value-of select="declaration_identification/nic_affectation"/>
											<br/>
										</xsl:if>
										<br/>
										<div class="templateTitreInformation">Bilan <xsl:value-of select="declaration_bilan/etat"/></div>
										<br/>
										<xsl:if test="declaration_bilan/declaration_contenu/salaries">
											<strong>Nombre de salariés :</strong>
											<xsl:value-of select="declaration_bilan/declaration_contenu/salaries"/>
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
													<strong><xsl:value-of select="type"/></strong>
													<xsl:value-of select="etat"/>
													<xsl:value-of select="nombre"/>
													<br/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
										<xsl:for-each select="declaration_bilan/declaration_compteurs">
											<strong>Nombre d'anomalies de catégorie <xsl:value-of select="categorie"/> :</strong>
											<xsl:value-of select="nombre"/>
											<br/>
										</xsl:for-each>
										<xsl:if test="declaration_bilan/niveau_conformite">
											<strong>Conformité <xsl:value-of select="declaration_bilan/niveau_conformite/etat_conformite"/></strong>
											<br/>
											<xsl:if test="declaration_bilan/niveau_conformite/certificat_conformite">
												<strong>Certificat de conformité : </strong>
												<xsl:value-of select="declaration_bilan/niveau_conformite/certificat_conformite"/>
												<br/>
											</xsl:if>
										</xsl:if>
										<br/>
										<xsl:if test="declaration_anomalie">
											<div class="templateTitreInformation">Anomalie(s)</div>
											<br/>
											<xsl:for-each select="declaration_anomalie">
												<xsl:sort order="ascending" data-type="number" select="description/numero_ligne"/>
												<strong>Code : </strong>
												<xsl:value-of select="description/code"/>
												<br/>
												<xsl:if test="description/categorie">
													<strong>Catégorie : </strong>
													<xsl:value-of select="description/categorie"/>
													<br/>
												</xsl:if>
												<strong>Message : </strong>
												<xsl:value-of select="description/message"/>
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
												<xsl:if test="environnement">
													<br/>
													<table width="800">
													<tr>
													<xsl:for-each select="environnement/salarie">
														<td width="50%">
														<strong>Salarié <xsl:value-of select="@origine"/>
														</strong>
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
														</td>
													</xsl:for-each>
													</tr>
													</table>
													<xsl:if test="environnement/contrat">
														<br/>
														<strong>Date de début de contrat : </strong>
														<xsl:value-of select="environnement/contrat/date_debut_contrat"/>
														<br/>
														<strong>Numéro de contrat : </strong>
														<xsl:value-of select="environnement/contrat/num_contrat"/>
														<br/>
													</xsl:if>
												</xsl:if>
												<br/>
											</xsl:for-each>
										</xsl:if>
									</div>
								</xsl:for-each>
							</xsl:if>
							</td>
							<td class="templateBarreDroite" valign="top">
								<img src="/dsn/ressources/images/ops.gif" alt="" title="" border="0"/>
								<br/>
								<img src="/dsn/ressources/images/bandeau-variable.gif" alt="" title="" border="0"/>
							</td>
						</tr>
						<tr>
							<td class="templateBarreDroite" valign="bottom"> </td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>