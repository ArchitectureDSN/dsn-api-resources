<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:gipmds="https://gipmds/1.0" xmlns:map="xalan://java.util.Map"
	extension-element-prefixes="map"
	xpath-default-namespace="https://gipmds/1.0">
	<xsl:output method="xml" media-type="text/xml"
		encoding="UTF-8" indent="no" />

	<xsl:param name="path_fichier_transcos" />

	<xsl:variable name="fichier_transcos"
		select="document($path_fichier_transcos)/balises" />


	<xsl:template match="/">
		<html>
			<body>
				<div id="blocRO">
					<div>
						<xsl:if
							test="contains('|01|02|03|04|', concat('|', GIPMDS/RO/RO_B001/RO_B001_R001/text(), '|'))">
							<fieldset>
								<legend id="legendBlocFluxDsn">
									Flux DSN de rattachement
								</legend>

								<table id="tableBlocFluxDsn">
									<tr>
										<td id="labelIdentificationBlocFluxDsn" width="500px">
											Identification
											du flux DSN
										</td>
										<td id="dpIdentificationBlocFluxDsn" class="pr-10">:</td>
										<td id="valeurIdentificationBlocFluxDsn">
											<xsl:call-template name="valoriser">
												<xsl:with-param name="value">
													<xsl:value-of
														select="GIPMDS/RO/RO_B000/RO_B000_R001" />
												</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:if test="GIPMDS/RO/RO_B000/RO_B000_R003/text()">
										<tr>
											<td id="labelSiretEmetteurBlocFluxDsn">
												SIRET de l'émetteur de la DSN
											</td>
											<td id="dpSiretEmetteurBlocFluxDsn" class="pr-10">:</td>
											<td id="valeurSiretEmetteurdBlocFluxDsn">
												<xsl:call-template name="formatSIRET">
													<xsl:with-param name="siret">
														<xsl:value-of
															select="GIPMDS/RO/RO_B000/RO_B000_R003" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td id="labelSiretDeclareBlocFluxDsn">
											SIRET du déclaré de la DSN
										</td>
										<td id="dpSiretDeclareBlocFluxDsn" class="pr-10">:</td>
										<td id="valeurSiretDeclareBlocFluxDsn">
											<xsl:call-template name="valoriser">
												<xsl:with-param name="value">
													<xsl:call-template name="formatSIRET">
														<xsl:with-param name="siret">
															<xsl:value-of
																select="GIPMDS/RO/RO_B000/RO_B000_R004/text()" />
														</xsl:with-param>
													</xsl:call-template>
												</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td id="labelNumeroFractionBlocFluxDsn">
											Numéro de fraction de la déclaration
										</td>
										<td id="dpNumeroFractionBlocFluxDsn" class="pr-10">:</td>
										<td id="valeurNumeroFractionBlocFluxDsn">
											<xsl:call-template name="valoriser">
												<xsl:with-param name="value">
													<xsl:value-of
														select="GIPMDS/RO/RO_B000/RO_B000_R005" />
												</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
									<xsl:if test="GIPMDS/RO/RO_B000/RO_B000_R006/text()">
										<tr>
											<td id="labelMoisPrincipalBlocFluxDsn">
												Date du mois principal déclaré
											</td>
											<td id="dpMoisPrincipalBlocFluxDsn" class="pr-10">:</td>
											<td id="valeurMoisPrincipalBlocFluxDsn">
												<xsl:call-template name="formatDate">
													<xsl:with-param name="date">
														<xsl:value-of
															select="GIPMDS/RO/RO_B000/RO_B000_R006" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="GIPMDS/RO/RO_B000/RO_B000_R007/text()">
										<tr>
											<td id="labelPointDepotBlocFluxDsn">
												Point de dépôt
											</td>
											<td id="dpPointDepotBlocFluxDsn" class="pr-10">:</td>
											<td id="valeurPointDepotBlocFluxDsn">
												<xsl:variable name="code"
													select="GIPMDS/RO/RO_B000/RO_B000_R007" />
												<xsl:variable name="transco_found"
													select="$fichier_transcos/RO_B000_R007/transco[@code = $code]/text()" />
												<xsl:choose>
													<xsl:when test="$transco_found">
														<xsl:value-of select="$transco_found" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$code" />
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="GIPMDS/RO/RO_B000/RO_B000_R008/text()">
										<tr>
											<td id="labelNomLogicielBlocFluxDsn">
												Nom du logiciel de paie
											</td>
											<td id="dpNomLogicielBlocFluxDsn" class="pr-10">:</td>
											<td id="valeurNomLogicielBlocFluxDsn">
												<xsl:value-of
													select="GIPMDS/RO/RO_B000/RO_B000_R008" />
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="GIPMDS/RO/RO_B000/RO_B000_R009/text()">
										<tr>
											<td id="labelNomEditeurBlocFluxDsn">
												Nom de l'éditeur
											</td>
											<td id="dpNomEditeurBlocFluxDsn" class="pr-10">:</td>
											<td id="valeurNomEditeurBlocFluxDsn">
												<xsl:value-of
													select="GIPMDS/RO/RO_B000/RO_B000_R009" />
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="GIPMDS/RO/RO_B000/RO_B000_R010/text()">
										<tr>
											<td id="labelNumeroVersionLogicielBlocFluxDsn">
												Numéro de version du logiciel de paie
											</td>
											<td id="dpNumeroVersionLogicielBlocFluxDsn" class="pr-10">:</td>
											<td id="valeurNumeroVersionLogicielBlocFluxDsn">
												<xsl:value-of
													select="GIPMDS/RO/RO_B000/RO_B000_R010" />
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="GIPMDS/RO/RO_B000/RO_B000_R011/text()">
										<tr>
											<td id="labelTypeDeclarationBlocFluxDsn">
												Type de la déclaration DSN
											</td>
											<td id="dpTypeDeclarationBlocFluxDsn" class="pr-10">:</td>
											<td id="valeurTypeDeclarationBlocFluxDsn">
												<xsl:variable name="code"
													select="GIPMDS/RO/RO_B000/RO_B000_R011" />
												<xsl:variable name="transco_found"
													select="$fichier_transcos/RO_B000_R011/transco[@code = $code]/text()" />
												<xsl:choose>
													<xsl:when test="$transco_found">
														<xsl:value-of select="$transco_found" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$code" />
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="GIPMDS/RO/RO_B000/RO_B000_R012/text()">
										<tr>
											<td id="labelNumeroOrdreDeclarationBlocFluxDsn">
												Numéro d'ordre de la déclaration DSN
											</td>
											<td id="dpNumeroOrdreDeclarationBlocFluxDsn" class="pr-10">:</td>
											<td id="valeurNumeroOrdreDeclarationBlocFluxDsn">
												<xsl:value-of
													select="GIPMDS/RO/RO_B000/RO_B000_R012" />
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="GIPMDS/RO/RO_B000/RO_B000_R013/text()">
										<tr>
											<td id="labelCodeEnvoiBlocFluxDsn">
												Code envoi du fichier d'essai ou réel DSN
											</td>
											<td id="dpCodeEnvoiBlocFluxDsn" class="pr-10">:</td>
											<td id="valeurCodeEnvoiBlocFluxDsn">
												<xsl:variable name="code"
													select="GIPMDS/RO/RO_B000/RO_B000_R013" />
												<xsl:variable name="transco_found"
													select="$fichier_transcos/RO_B000_R013/transco[@code = $code]/text()" />
												<xsl:choose>
													<xsl:when test="$transco_found">
														<xsl:value-of select="$transco_found" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$code" />
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="GIPMDS/RO/RO_B000/RO_B000_R014/text()">
										<tr>
											<td id="labelNumeroVersionNormeBlocFluxDsn">
												Numéro de version de la norme utilisée par le
												déclarant
												DSN
											</td>
											<td id="dpNumeroVersionNormeBlocFluxDsn" class="pr-10">:</td>
											<td id="valeurNumeroVersionNormeBlocFluxDsn">
												<xsl:value-of
													select="GIPMDS/RO/RO_B000/RO_B000_R014" />
											</td>
										</tr>
									</xsl:if>
								</table>

							</fieldset>
						</xsl:if>
						<br />
						<div id="blocDeclencheurRetourOrganisme" class="row">
							<h2>
								<xsl:if test="GIPMDS/RO/RO_B001/RO_B001_R001/text()">
									<xsl:variable name="code"
										select="GIPMDS/RO/RO_B001/RO_B001_R001/text()" />
									<xsl:variable name="transco_found"
										select="$fichier_transcos/RO_B001_R001/transco[@code = $code]/text()" />
									<xsl:choose>
										<xsl:when test="$transco_found">
											<xsl:value-of select="$transco_found" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$code" />
										</xsl:otherwise>
									</xsl:choose>
									<br />
								</xsl:if>
							</h2>
						</div>
						<xsl:if
							test="contains('|01|02|03|04|', concat('|', GIPMDS/RO/RO_B001/RO_B001_R001/text(), '|'))">
							<div id="blocContext">
								<legend id="legendBlocContext">
									Contexte
								</legend>
								<br />
								<div class="bloc-context">
									<table id="tableBlocContext">
										<tr>
											<td id="labelIdentifiantRetourOrganismeBlocContext"
												width="300px">
												Identifiant du retour organisme
											</td>
											<td id="dpIdentifiantRetourOrganismeBlocContext"
												class="pr-10">:</td>
											<td id="valeurIdentifiantRetourOrganismeBlocContext">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R001" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td id="labelCodeRetourOrganismeBlocContext">
												Code du retour organisme
											</td>
											<td id="dpCodeRetourOrganismeBlocContext" class="pr-10">:</td>
											<td id="valeurCodeRetourOrganismeBlocContext">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R002" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td id="labelLibelleRetourOrganismeBlocContext">
												Libellé du retour organisme
											</td>
											<td id="dpLibelleRetourOrganismeBlocContext" class="pr-10">:</td>
											<td id="valeurLibelleRetourOrganismeBlocContext">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R003" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td id="labelTypeRetourOrganismeBlocContext">
												Type du retour organisme
											</td>
											<td id="dpTypeRetourOrganismeBlocContext" class="pr-10">:</td>
											<td id="valeurTypeRetourOrganismeBlocContext">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:variable name="code"
															select="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R004/text()" />
														<xsl:variable name="transco_found"
															select="$fichier_transcos/RO_B002_R004/transco[@code = $code]/text()" />
														<xsl:choose>
															<xsl:when test="$transco_found">
																<xsl:value-of select="$transco_found" />
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="$code" />
															</xsl:otherwise>
														</xsl:choose>
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td id="labelOrganismeEmetteurBlocContext">
												Organisme émetteur
											</td>
											<td id="dpOrganismeEmetteurBlocContext" class="pr-10">:</td>
											<td id="valeurOrganismeEmetteurBlocContext">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R005" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td id="labelIdentifiantOrganismeEmetteurBlocContext">
												Identifiant de l'organisme émetteur
											</td>
											<td id="dpIdentifiantOrganismeEmetteurBlocContext"
												class="pr-10">:</td>
											<td id="valeurIdentifiantOrganismeEmetteurBlocContext">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R006" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:if
											test="not(GIPMDS/RO/RO_B001/RO_B001_R001 = '04') or GIPMDS/RO/RO_B001/RO_B002/RO_B002_R008/text()">
											<tr>
												<td id="labelDebutPeriodeAssocieeBlocContext">
													Début de la période associée
												</td>
												<td id="dpDebutPeriodeAssocieeBlocContext" class="pr-10">:</td>
												<td id="valeurDebutPeriodeAssocieeBlocContext">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:call-template name="formatDate">
																<xsl:with-param name="date">
																	<xsl:value-of
																		select="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R008" />
																</xsl:with-param>
															</xsl:call-template>
														</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
										<xsl:if
											test="not(GIPMDS/RO/RO_B001/RO_B001_R001 = '04') or GIPMDS/RO/RO_B001/RO_B002/RO_B002_R009/text()">
											<tr>
												<td id="labelFinPeriodeAssocieeBlocContext">
													Fin de la période associée
												</td>
												<td id="dpFinPeriodeAssocieeBlocContext" class="pr-10">:</td>
												<td id="valeurFinPeriodeAssocieeBlocContext">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:call-template name="formatDate">
																<xsl:with-param name="date">
																	<xsl:value-of
																		select="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R009" />
																</xsl:with-param>
															</xsl:call-template>
														</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
										<xsl:if
											test="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R010/text()">
											<tr>
												<td id="labelDateRealisationTraitementsBlocContext">
													Date de réalisation des traitements
												</td>
												<td id="dpDateRealisationTraitementsBlocContext"
													class="pr-10">:</td>
												<td id="valeurDateRealisationTraitementsBlocContext">
													<xsl:call-template name="formatDate">
														<xsl:with-param name="date">
															<xsl:value-of
																select="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R010" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
										<tr>
											<td id="labelDateProductionRetourOrganismeBlocContext">
												Date de production du retour organisme
											</td>
											<td id="dpDateProductionRetourOrganismeBlocContext"
												class="pr-10">:</td>
											<td id="valeurDateProductionRetourOrganismeBlocContext">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:call-template name="formatDate">
															<xsl:with-param name="date">
																<xsl:value-of
																	select="GIPMDS/RO/RO_B001/RO_B002/RO_B002_R011" />
															</xsl:with-param>
														</xsl:call-template>
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<br />

							<xsl:if
								test="GIPMDS/RO/RO_B001/RO_B001_R001 = '01' or GIPMDS/RO/RO_B001/RO_B001_R001 = '02'">

								<div id="blocValidationDonneesDsn">
									<fieldset>
										<legend id="legendBlocValidationDonneesDsn">
											Validation des données DSN
										</legend>

										<table id="tableBlocValidationDonneesDsn">
											<tr>
												<td id="labelTypeMetierBlocValidationDonneesDsn"
													width="300px">
													Type de métier
												</td>
												<td id="labelTypeMetierBlocValidationDonneesDsn"
													class="pr-10">:</td>
												<td id="valeurTypeMetierBlocValidationDonneesDsn">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="GIPMDS/RO/RO_B001/RO_B002/RO_B003/RO_B003_R001" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<xsl:variable name="code"
												select="GIPMDS/RO/RO_B001/RO_B002/RO_B003/RO_B003_R002/text()" />

											<xsl:variable name="couleur">
												<xsl:if test="$code='OK'">
													green
												</xsl:if>
												<xsl:if test="$code='KO'">
													orange
												</xsl:if>
											</xsl:variable>
											<xsl:variable name="gras">
												<xsl:if test="$code='OK' or $code='KO'">
													titre
												</xsl:if>
											</xsl:variable>
											<tr class="{$gras}" style="color:{$couleur};">
												<td id="labelConformiteMetierBlocValidationDonneesDsn">
													Conformité métier des données analysées
												</td>
												<td id="labelConformiteMetierBlocValidationDonneesDsn"
													class="pr-10">:</td>
												<td id="valeurConformiteMetierBlocValidationDonneesDsn">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:variable name="transco_found"
																select="$fichier_transcos/RO_B003_R002/transco[@code = $code]/text()" />
															<xsl:choose>
																<xsl:when test="$transco_found">
																	<xsl:value-of select="$transco_found" />
																</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="$code" />
																</xsl:otherwise>
															</xsl:choose>
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td class="position-icon-conformite">
													<xsl:if test="normalize-space($couleur) = 'green'">
														<span
															class="icon icon-checkbox-checked position-icon-conformite-ok" />
													</xsl:if>
													<xsl:if test="normalize-space($couleur) = 'orange'">
														<span
															class="icon icon-warning position-icon-conformite-ko" />
													</xsl:if>
												</td>
											</tr>
										</table>
									</fieldset>
								</div>
								<br />
							</xsl:if>

							<xsl:if test="GIPMDS/RO/RO_B001/RO_B002/RO_B004">
								<xsl:for-each
									select="GIPMDS/RO/RO_B001/RO_B002/RO_B004">

									<xsl:variable name="i" select="position()" />
									<div id="blocAction">
										<div>
											<fieldset>
												<legend id="legendBlocAction">
													Action
													<xsl:value-of select="$i" />
													sur
													<xsl:value-of select="last()" />
													-
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of select="RO_B004_R002" />
														</xsl:with-param>
													</xsl:call-template>
												</legend>

												<table id="tableBlocAction">
													<tr>
														<td id="labelCodeTraitementBlocAction" width="300px">
															Code du
															traitement
														</td>
														<td id="dpCodeTraitementBlocAction" class="pr-10">:</td>
														<td id="valeurCodeTraitementBlocAction">
															<xsl:call-template name="valoriser">
																<xsl:with-param name="value">
																	<xsl:value-of select="RO_B004_R001" />
																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td id="labelTypeActionBlocAction">
															Type d'action
														</td>
														<td id="dpTypeActionBlocAction" class="pr-10">:</td>
														<td id="valeurTypeActionBlocAction">
															<xsl:call-template name="valoriser">
																<xsl:with-param name="value">

																	<xsl:variable name="code"
																		select="RO_B004_R003/text()" />
																	<xsl:variable name="transco_found"
																		select="$fichier_transcos/RO_B004_R003/transco[@code = $code]/text()" />
																	<xsl:choose>
																		<xsl:when test="$transco_found">
																			<xsl:value-of select="$transco_found" />
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="$code" />
																		</xsl:otherwise>
																	</xsl:choose>

																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<xsl:if test="RO_B004_R004/text()">
														<tr>
															<td id="labelNiveauBlocAction">
																Niveau
															</td>
															<td id="dpNiveauBlocAction" class="pr-10">:</td>
															<td id="valeurNiveauBlocAction">
																<xsl:variable name="code"
																	select="RO_B004_R004/text()" />
																<xsl:variable name="transco_found"
																	select="$fichier_transcos/RO_B004_R004/transco[@code = $code]/text()" />
																<xsl:choose>
																	<xsl:when test="$transco_found">
																		<xsl:value-of select="$transco_found" />
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="$code" />
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="RO_B004_R005/text()">
														<tr>
															<td id="labelCategorieDonneesBlocAction">
																Catégorie de données
															</td>
															<td id="dpCategorieDonneesBlocAction" class="pr-10">:</td>
															<td id="valeurCategorieDonneesBlocAction">
																<xsl:variable name="code"
																	select="RO_B004_R005/text()" />
																<xsl:variable name="transco_found"
																	select="$fichier_transcos/RO_B004_R005/transco[@code = $code]/text()" />
																<xsl:choose>
																	<xsl:when test="$transco_found">
																		<xsl:value-of select="$transco_found" />
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="$code" />
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</tr>
													</xsl:if>
													<xsl:if
														test="RO_B004_R006/text() and not(ancestor::RO_B001/RO_B001_R001 = '04')">
														<tr>
															<td id="labelResultatControleBlocAction">
																Résultat du contrôle
															</td>
															<td id="dpResultatControleBlocAction" class="pr-10">:</td>
															<td id="valeurResultatControleBlocAction">
																<xsl:variable name="code"
																	select="RO_B004_R006/text()" />
																<xsl:variable name="transco_found"
																	select="$fichier_transcos/RO_B004_R006/transco[@code = $code]/text()" />
																<xsl:choose>
																	<xsl:when test="$transco_found">
																		<xsl:value-of select="$transco_found" />
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="$code" />
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</tr>
													</xsl:if>
													<xsl:if
														test="RO_B004_R007/text() and not(ancestor::RO_B001/RO_B001_R001 = '04')">
														<tr>
															<td id="labelPerimetreErreurBlocAction">
																Périmètre de l'erreur
															</td>
															<td id="dpPerimetreErreurBlocAction" class="pr-10">:</td>
															<td id="valeurPerimetreErreurBlocAction">
																<xsl:variable name="code"
																	select="RO_B004_R007/text()" />
																<xsl:variable name="transco_found"
																	select="$fichier_transcos/RO_B004_R007/transco[@code = $code]/text()" />
																<xsl:choose>
																	<xsl:when test="$transco_found">
																		<xsl:value-of select="$transco_found" />
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="$code" />
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</tr>
													</xsl:if>
													<xsl:if
														test="RO_B004_R008/text() and not(ancestor::RO_B001/RO_B001_R001 = '04')">
														<tr>
															<td id="labelDetailIndividusContratsBlocAction">
																Détail des individus et des contrats
															</td>
															<td id="dpDetailIndividusContratsBlocAction"
																class="pr-10">:</td>
															<td id="valeurDetailIndividusContratsBlocAction">
																<xsl:variable name="code"
																	select="RO_B004_R008/text()" />
																<xsl:variable name="transco_found"
																	select="$fichier_transcos/RO_B004_R008/transco[@code = $code]/text()" />
																<xsl:choose>
																	<xsl:when test="$transco_found">
																		<xsl:value-of select="$transco_found" />
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="$code" />
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</tr>
													</xsl:if>
													<xsl:if
														test="RO_B004_R009/text() and not(ancestor::RO_B001/RO_B001_R001 = '04')">
														<tr>
															<td id="labelNombreIndividusConcernesBlocAction">
																Nombre des individus concernés
															</td>
															<td id="dpNombreIndividusConcernesBlocAction"
																class="pr-10">:</td>
															<td id="valeurNombreIndividusConcernesBlocAction">
																<xsl:value-of select="RO_B004_R009" />
															</td>
														</tr>
													</xsl:if>
													<xsl:if
														test="RO_B004_R010/text() and not(ancestor::RO_B001/RO_B001_R001 = '04')">
														<tr>
															<td id="labelNombreContratsConcernesBlocAction">
																Nombre des contrats concernés
															</td>
															<td id="dpNombreContratsConcernesBlocAction"
																class="pr-10">:</td>
															<td id="valeurNombreContratsConcernesBlocAction">
																<xsl:value-of select="RO_B004_R010" />
															</td>
														</tr>
													</xsl:if>
													<xsl:if
														test="not(ancestor::RO_B001/RO_B001_R001 = '04')">
														<tr>
															<td id="labelControleBlocAction">
																Contrôle
															</td>
															<td id="dpControleBlocAction" class="pr-10">:</td>
															<td id="valeurControleBlocAction">
																<span id="texteControleBlocAction{$i}"
																	class="afficher-moins">
																	<div>
																		<xsl:call-template name="valoriser">
																			<xsl:with-param name="value">
																				<xsl:value-of select="RO_B004_R011" />
																			</xsl:with-param>
																		</xsl:call-template>
																	</div>
																</span>
																<a class="cursor-pointer afficher-plus-moins"
																	id="afficherPlusMoinsControleBlocAction{$i}">Afficher plus</a>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="RO_B004_R012/text()">
														<tr>
															<td id="labelReferenceReglementaireBlocAction">
																Référence réglementaire
															</td>
															<td id="dpReferenceReglementaireBlocAction"
																class="pr-10">:</td>
															<td id="valeurReferenceReglementaireBlocAction">
																<xsl:value-of select="RO_B004_R012" />
															</td>
														</tr>
													</xsl:if>
													<tr>
														<td id="labelActionAttendueBlocAction" class="titre">
															Action
															attendue
														</td>
														<td id="dpActionAttendueBlocAction" class="pr-10 titre">:</td>
														<td id="valeurActionAttendueBlocAction">
															<span id="texteActionAttendueBlocAction{$i}"
																class="afficher-moins titre">
																<div>
																	<xsl:call-template name="valoriser">
																		<xsl:with-param name="value">
																			<xsl:value-of select="RO_B004_R013" />
																		</xsl:with-param>
																	</xsl:call-template>
																</div>
															</span>
															<a class="cursor-pointer afficher-plus-moins"
																id="afficherPlusMoinsActionAttendueBlocAction{$i}">Afficher plus</a>
														</td>
													</tr>
													<xsl:if test="RO_B004_R014/text()">
														<tr>
															<td id="labelAideUtilisateurBlocAction">
																Aide à l'utilisateur
															</td>
															<td id="dpAideUtilisateurBlocAction" class="pr-10">:</td>
															<td id="valeurAideUtilisateurBlocAction">
																<xsl:value-of select="RO_B004_R014" />
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="RO_B004_R015/text()">
														<tr>
															<td id="labelCodeTraitementBlocAction">
																Conséquences en l'absence de mise à jour de la
																paie
															</td>
															<td id="dpConsequencesBlocAction" class="pr-10">:</td>
															<td id="valeurConsequencesBlocAction">
																<xsl:value-of select="RO_B004_R015" />
															</td>
														</tr>
													</xsl:if>
												</table>
												<br />

												<xsl:if
													test="RO_B005 and not(ancestor::RO_B001/RO_B001_R001 = '04')">
													<xsl:for-each select="RO_B005">

														<xsl:variable name="j" select="position()" />
														<div id="blocDetailAction">
															<fieldset>
																<legend id="legendBlocDetailAction"
																	class="sous-legend">
																	Détail de l'action (
																	<xsl:value-of select="$j" />
																	sur
																	<xsl:value-of select="last()" />
																	)
																</legend>

																<table id="tableBlocDetailAction">
																	<tr>
																		<td id="labelDetailAtypieBlocDetailAction"
																			width="200px">
																			Détail
																			de l'atypie
																		</td>
																		<td id="dpDetailAtypieBlocDetailAction"
																			class="pr-10">:</td>
																		<td id="valeurDetailAtypieBlocDetailAction">
																			<span
																				id="texteDetailAtypieBlocDetailAction{$i}{$j}"
																				class="afficher-moins">
																				<div>
																					<xsl:call-template
																						name="valoriser">
																						<xsl:with-param name="value">
																							<xsl:value-of select="RO_B005_R001" />
																						</xsl:with-param>
																					</xsl:call-template>
																				</div>
																			</span>
																			<a class="cursor-pointer afficher-plus-moins"
																				id="afficherPlusMoinsDetailAtypieBlocDetailAction{$i}{$j}">Afficher plus</a>
																		</td>
																	</tr>
																	<xsl:if test="RO_B005_R002/text()">
																		<tr>
																			<td id="labelDebutPeriodeAssocieeBlocDetailAction">
																				Début de la période associée
																			</td>
																			<td id="dpDebutPeriodeAssocieeBlocDetailAction"
																				class="pr-10">:</td>
																			<td
																				id="valeurDebutPeriodeAssocieeBlocDetailAction">
																				<xsl:call-template
																					name="formatDate">
																					<xsl:with-param name="date">
																						<xsl:value-of select="RO_B005_R002" />
																					</xsl:with-param>
																				</xsl:call-template>
																			</td>
																		</tr>
																	</xsl:if>
																	<xsl:if test="RO_B005_R003/text()">
																		<tr>
																			<td id="labelFinPeriodeAssocieeBlocDetailAction">
																				Fin de la période associée
																			</td>
																			<td id="dpFinPeriodeAssocieeBlocDetailAction"
																				class="pr-10">:</td>
																			<td id="valeurFinPeriodeAssocieeBlocDetailAction">
																				<xsl:call-template
																					name="formatDate">
																					<xsl:with-param name="date">
																						<xsl:value-of select="RO_B005_R003" />
																					</xsl:with-param>
																				</xsl:call-template>
																			</td>
																		</tr>
																	</xsl:if>
																</table>
																<br />
																<xsl:if test="RO_B006">
																	<table class="table table-striped table-bordered">
																		<tr>
																			<span class="titre-tableau">
																				Identifiants de l'individu ou du
																				contrat</span>
																		</tr>
																		<thead>
																			<xsl:if test="RO_B006/RO_B006_R005/text()">
																				<th>Matricule de l'individu dans l'entreprise</th>
																			</xsl:if>
																			<xsl:if test="RO_B006/RO_B006_R001/text()">
																				<th>Numéro d'inscription au répertoire</th>
																			</xsl:if>
																			<xsl:if test="RO_B006/RO_B006_R002/text()">
																				<th>Numéro technique temporaire</th>
																			</xsl:if>
																			<th>Nom de famille</th>
																			<th>Prénom</th>
																			<th>Date de naissance</th>
																			<xsl:if test="RO_B006/RO_B006_R006/text()">
																				<th>Date de début du contrat</th>
																			</xsl:if>
																			<xsl:if test="RO_B006/RO_B006_R007/text()">
																				<th>Numéro du contrat</th>
																			</xsl:if>
																		</thead>
																		<xsl:for-each select="RO_B006">

																			<tr>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B006/RO_B006_R005/text()">
																					<td>
																						<xsl:value-of select="RO_B006_R005" />
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B006/RO_B006_R001/text()">
																					<td>
																						<xsl:value-of select="RO_B006_R001" />
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B006/RO_B006_R002/text()">
																					<td>
																						<xsl:value-of select="RO_B006_R002" />
																					</td>
																				</xsl:if>
																				<td>
																					<xsl:call-template
																						name="valoriser">
																						<xsl:with-param name="value">
																							<xsl:value-of select="RO_B006_R003" />
																						</xsl:with-param>
																					</xsl:call-template>
																				</td>
																				<td>
																					<xsl:call-template
																						name="valoriser">
																						<xsl:with-param name="value">
																							<xsl:value-of select="RO_B006_R004" />
																						</xsl:with-param>
																					</xsl:call-template>
																				</td>
																				<td>
																					<xsl:call-template
																						name="valoriser">
																						<xsl:with-param name="value">
																							<xsl:call-template
																								name="formatDate">
																								<xsl:with-param name="date">
																									<xsl:value-of
																										select="RO_B006_R008" />
																								</xsl:with-param>
																							</xsl:call-template>
																						</xsl:with-param>
																					</xsl:call-template>
																				</td>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B006/RO_B006_R006/text()">
																					<td>
																						<xsl:call-template
																							name="formatDate">
																							<xsl:with-param name="date">
																								<xsl:value-of select="RO_B006_R006" />
																							</xsl:with-param>
																						</xsl:call-template>
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B006/RO_B006_R007/text()">
																					<td>
																						<xsl:value-of select="RO_B006_R007" />
																					</td>
																				</xsl:if>
																			</tr>
																		</xsl:for-each>
																	</table>
																</xsl:if>
																<xsl:if test="RO_B007">
																	<table class="table table-striped table-bordered">
																		<tr>
																			<span class="titre-tableau">
																				Donnée(s) DSN</span>
																		</tr>
																		<thead>
																			<tr>
																				<th>Code de la rubrique DSN</th>
																				<xsl:if test="RO_B007/RO_B007_R002/text()">
																					<th>Valeur déclarée</th>
																				</xsl:if>
																				<xsl:if test="RO_B007/RO_B007_R003/text()">
																					<th>Valeur corrigée ou préconisée</th>
																				</xsl:if>
																				<xsl:if test="RO_B007/RO_B007_R004/text()">
																					<th>Nature du montant</th>
																				</xsl:if>
																				<xsl:if test="RO_B007/RO_B007_R005/text()">
																					<th>Début de la période associée</th>
																				</xsl:if>
																				<xsl:if test="RO_B007/RO_B007_R006/text()">
																					<th>Fin de la période associée</th>
																				</xsl:if>
																				<xsl:if test="RO_B007/RO_B007_R007/text()">
																					<th>Date d'effet</th>
																				</xsl:if>
																				<xsl:if test="RO_B007/RO_B007_R008/text()">
																					<th>Date de fin d'effet</th>
																				</xsl:if>
																				<xsl:if test="RO_B007/RO_B007_R009/text()">
																					<th>Résultat du contrôle</th>
																				</xsl:if>
																				<xsl:if test="RO_B007/RO_B010">
																					<th>Valeurs acceptées</th>
																				</xsl:if>
																			</tr>
																		</thead>
																		<xsl:for-each select="RO_B007">
																			<tr>
																				<td>
																					<xsl:call-template
																						name="valoriser">
																						<xsl:with-param name="value">
																							<xsl:value-of select="RO_B007_R001" />
																						</xsl:with-param>
																					</xsl:call-template>
																				</td>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B007/RO_B007_R002/text()">
																					<td>
																						<xsl:value-of select="RO_B007_R002" />
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B007/RO_B007_R003/text()">
																					<td>
																						<xsl:value-of select="RO_B007_R003" />
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B007/RO_B007_R004/text()">
																					<td>
																						<xsl:variable name="code"
																							select="RO_B007_R004" />
																						<xsl:variable name="transco_found"
																							select="$fichier_transcos/RO_B007_R004/transco[@code = $code]/text()" />
																						<xsl:choose>
																							<xsl:when test="$transco_found">
																								<xsl:value-of
																									select="$transco_found" />
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:value-of select="$code" />
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B007/RO_B007_R005/text()">
																					<td>
																						<xsl:call-template
																							name="formatDate">
																							<xsl:with-param name="date">
																								<xsl:value-of select="RO_B007_R005" />
																							</xsl:with-param>
																						</xsl:call-template>
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B007/RO_B007_R006/text()">
																					<td>
																						<xsl:call-template
																							name="formatDate">
																							<xsl:with-param name="date">
																								<xsl:value-of select="RO_B007_R006" />
																							</xsl:with-param>
																						</xsl:call-template>
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B007/RO_B007_R007/text()">
																					<td>
																						<xsl:call-template
																							name="formatDate">
																							<xsl:with-param name="date">
																								<xsl:value-of select="RO_B007_R007" />
																							</xsl:with-param>
																						</xsl:call-template>
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B007/RO_B007_R008/text()">
																					<td>
																						<xsl:call-template
																							name="formatDate">
																							<xsl:with-param name="date">
																								<xsl:value-of select="RO_B007_R008" />
																							</xsl:with-param>
																						</xsl:call-template>
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B007/RO_B007_R009/text()">
																					<td>
																						<xsl:variable name="code"
																							select="RO_B007_R009" />
																						<xsl:variable name="transco_found"
																							select="$fichier_transcos/RO_B007_R009/transco[@code = $code]/text()" />
																						<xsl:choose>
																							<xsl:when test="$transco_found">
																								<xsl:value-of
																									select="$transco_found" />
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:value-of select="$code" />
																							</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</xsl:if>
																				<xsl:if
																					test="ancestor::RO_B005/RO_B007/RO_B010">
																					<td>
																						<xsl:call-template
																							name="valoriser">
																							<xsl:with-param name="value">
																								<xsl:for-each
																									select="RO_B010/RO_B010_R001">
																									<xsl:if test="text()">
																										<xsl:value-of select="text()" />
																										<xsl:if test="not(position() = last())">
																											\
																										</xsl:if>
																									</xsl:if>
																								</xsl:for-each>
																							</xsl:with-param>
																						</xsl:call-template>
																					</td>
																				</xsl:if>
																			</tr>
																		</xsl:for-each>
																	</table>
																</xsl:if>
															</fieldset>
														</div>
													</xsl:for-each>
												</xsl:if>

												<xsl:if test="ancestor::RO_B001/RO_B001_R001 = '04'">
													<div>
														<table class="table table-striped table-bordered">
															<tr>
																<span class="titre-tableau">
																	Paramètre à prendre en compte en paie</span>
															</tr>
															<thead>
																<th>Type de paramètre</th>
																<th>Valeur du paramètre</th>
																<th>Date d'effet</th>
																<xsl:if test="RO_B008/RO_B008_R004/text()">
																	<th>Date de fin d'effet</th>
																</xsl:if>
																<xsl:if test="RO_B008/RO_B008_R005/text()">
																	<th>Code de la rubrique DSN</th>
																</xsl:if>
																<xsl:if test="RO_B008/RO_B008_R006/text()">
																	<th>Date de calcul du paramètre</th>
																</xsl:if>
															</thead>
															<xsl:for-each select="RO_B008">
																<tr>
																	<td>
																		<xsl:variable name="code"
																			select="RO_B008_R001" />
																		<xsl:variable name="transco_found"
																			select="$fichier_transcos/RO_B008_R001/transco[@code = $code]/text()" />
																		<xsl:choose>
																			<xsl:when test="$transco_found">
																				<xsl:value-of select="$transco_found" />
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:call-template
																					name="valoriser">
																					<xsl:with-param name="value">
																						<xsl:value-of select="$code" />
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:otherwise>
																		</xsl:choose>
																	</td>
																	<td>
																		<xsl:call-template name="valoriser">
																			<xsl:with-param name="value">
																				<xsl:value-of select="RO_B008_R002" />
																			</xsl:with-param>
																		</xsl:call-template>
																	</td>
																	<td>
																		<xsl:call-template name="valoriser">
																			<xsl:with-param name="value">
																				<xsl:call-template
																					name="formatDate">
																					<xsl:with-param name="date">
																						<xsl:value-of select="RO_B008_R003" />
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:with-param>
																		</xsl:call-template>
																	</td>
																	<xsl:if
																		test="ancestor::RO_B004/RO_B008/RO_B008_R004/text()">
																		<td>
																			<xsl:call-template
																				name="formatDate">
																				<xsl:with-param name="date">
																					<xsl:value-of select="RO_B008_R004" />
																				</xsl:with-param>
																			</xsl:call-template>
																		</td>
																	</xsl:if>
																	<xsl:if
																		test="ancestor::RO_B004/RO_B008/RO_B008_R005/text()">
																		<td>
																			<xsl:value-of select="RO_B008_R005" />
																		</td>
																	</xsl:if>
																	<xsl:if
																		test="ancestor::RO_B004/RO_B008/RO_B008_R006/text()">
																		<td>
																			<xsl:call-template
																				name="formatDate">
																				<xsl:with-param name="date">
																					<xsl:value-of select="RO_B008_R006" />
																				</xsl:with-param>
																			</xsl:call-template>
																		</td>
																	</xsl:if>
																</tr>
															</xsl:for-each>
														</table>
													</div>
												</xsl:if>

												<xsl:if
													test="RO_B009 and ancestor::RO_B001/RO_B001_R001 = '01'">
													<br />
													<div>
														<table class="table table-striped table-bordered">
															<tr>
																<span class="titre-tableau">
																	Données d'identification de l'individu
																	en
																	écart</span>
															</tr>
															<thead>
																<xsl:if test="RO_B009/RO_B009_R010/text()">
																	<th>Matricule de l'individu dans l'entreprise</th>
																</xsl:if>
																<xsl:if test="RO_B009/RO_B009_R001/text()">
																	<th>Numéro d'inscription au répertoire déclaré</th>
																</xsl:if>
																<xsl:if test="RO_B009/RO_B009_R002/text()">
																	<th>Numéro technique temporaire déclaré</th>
																</xsl:if>
																<th>Numéro d'inscription au répertoire de référence</th>
																<th>Nom de famille déclaré</th>
																<th>Nom de famille de référence</th>
																<th>Prénom déclaré</th>
																<th>Prénom de référence</th>
																<th>Date de naissance déclarée</th>
																<th>Date de naissance de référence</th>
															</thead>
															<xsl:for-each select="RO_B009">
																<tr>
																	<xsl:if
																		test="ancestor::RO_B004/RO_B009/RO_B009_R010/text()">
																		<td>
																			<xsl:value-of select="RO_B009_R010" />
																		</td>
																	</xsl:if>
																	<xsl:if
																		test="ancestor::RO_B004/RO_B009/RO_B009_R001/text()">
																		<td>
																			<xsl:value-of select="RO_B009_R001" />
																		</td>
																	</xsl:if>
																	<xsl:if
																		test="ancestor::RO_B004/RO_B009/RO_B009_R002/text()">
																		<td>
																			<xsl:value-of select="RO_B009_R002" />
																		</td>
																	</xsl:if>
																	<td>
																		<xsl:call-template name="valoriser">
																			<xsl:with-param name="value">
																				<xsl:value-of select="RO_B009_R003" />
																			</xsl:with-param>
																		</xsl:call-template>
																	</td>
																	<td>
																		<xsl:call-template name="valoriser">
																			<xsl:with-param name="value">
																				<xsl:value-of select="RO_B009_R004" />
																			</xsl:with-param>
																		</xsl:call-template>
																	</td>
																	<td>
																		<xsl:call-template name="valoriser">
																			<xsl:with-param name="value">
																				<xsl:value-of select="RO_B009_R005" />
																			</xsl:with-param>
																		</xsl:call-template>
																	</td>
																	<td>
																		<xsl:call-template name="valoriser">
																			<xsl:with-param name="value">
																				<xsl:value-of select="RO_B009_R006" />
																			</xsl:with-param>
																		</xsl:call-template>
																	</td>
																	<td>
																		<xsl:call-template name="valoriser">
																			<xsl:with-param name="value">
																				<xsl:value-of select="RO_B009_R007" />
																			</xsl:with-param>
																		</xsl:call-template>
																	</td>
																	<td>
																		<xsl:call-template name="valoriser">
																			<xsl:with-param name="value">
																				<xsl:call-template
																					name="formatDate">
																					<xsl:with-param name="date">
																						<xsl:value-of select="RO_B009_R008" />
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:with-param>
																		</xsl:call-template>
																	</td>
																	<td>
																		<xsl:call-template name="valoriser">
																			<xsl:with-param name="value">
																				<xsl:call-template
																					name="formatDate">
																					<xsl:with-param name="date">
																						<xsl:value-of select="RO_B009_R009" />
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:with-param>
																		</xsl:call-template>
																	</td>
																</tr>
															</xsl:for-each>
														</table>
													</div>
												</xsl:if>
											</fieldset>
										</div>
									</div>
									<br />
								</xsl:for-each>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
			</body>
		</html>

		<script type="text/javascript">
			<xsl:text disable-output-escaping="yes">
				$(document)
					.ready(
							function() {
			
								var isIE = /* @cc_on!@ */false || !!document.documentMode;
								var afficherPlus = 'Afficher plus';
								var afficherMoins = 'Afficher moins';
			
								function getRows(selector) {
									selector.hide();
									selector.css('display', 'block');
									var height = $(selector).height();
									var line_height = $(selector).css('line-height');
									line_height = parseFloat(line_height)
									var rows = height / line_height;
									selector.css('display', 'none');
									selector.show();
									return Math.round(rows);
								}
			
								$('.afficher-moins')
										.each(
												function() {
													var texte = $('#' + this.id);
													var position = this.id.match(/(\d+)/);
			
													if (getRows(texte) > 2) {
			
														if (this.id
																.indexOf("ControleBlocAction") != -1) {
															var lienAfficher = document
																	.getElementById('afficherPlusMoinsControleBlocAction'
																			+ position[0]);
															if (isIE) {
																var id = "texteControleBlocAction"
																		+ position[0];
																var container = document
																		.querySelector('#'
																				+ id);
																var div = container
																		.querySelector('div');
																var fullText = document
																		.createElement('div');
																fullText.style.cssText = 'display: none';
																fullText.textContent = div.textContent;
																container
																		.appendChild(fullText);
																fullText.id = id + 'full';
																while (div.offsetHeight > 60) {
																	div.textContent = div.textContent
																			.replace(
																					/\W*\s(\S)*$/,
																					'...');
																	div.id = id + 'clamped';
																}
															}
														} else if (this.id
																.indexOf("ActionAttendueBlocAction") != -1) {
															var lienAfficher = document
																	.getElementById('afficherPlusMoinsActionAttendueBlocAction'
																			+ position[0]);
															if (isIE) {
																var id = "texteActionAttendueBlocAction"
																		+ position[0];
																var container = document
																		.querySelector('#'
																				+ id);
																var div = container
																		.querySelector('div');
																var fullText = document
																		.createElement('div');
																fullText.style.cssText = 'display: none';
																fullText.textContent = div.textContent;
																fullText.id = id + 'full';
																container
																		.appendChild(fullText);
																while (div.offsetHeight > 60) {
																	div.textContent = div.textContent
																			.replace(
																					/\W*\s(\S)*$/,
																					'...');
																	div.id = id + 'clamped';
																}
															}
														} else if (this.id
																.indexOf("DetailAtypieBlocDetailAction") != -1) {
															var lienAfficher = document
																	.getElementById('afficherPlusMoinsDetailAtypieBlocDetailAction'
																			+ position[0]);
															if (isIE) {
																var id = "texteDetailAtypieBlocDetailAction"
																		+ position[0];
																var container = document
																		.querySelector('#'
																				+ id);
																var div = container
																		.querySelector('div');
																var fullText = document
																		.createElement('div');
																fullText.style.cssText = 'display: none';
																fullText.textContent = div.textContent;
																fullText.id = id + 'full';
																container
																		.appendChild(fullText);
																while (div.offsetHeight > 60) {
																	div.textContent = div.textContent
																			.replace(
																					/\W*\s(\S)*$/,
																					'...');
																	div.id = id + 'clamped';
																}
															}
														}
			
														lienAfficher.style.display = 'block';
													}
												});
			
								$(".afficher-plus-moins")
										.click(
												function() {
			
													var position = this.id.match(/(\d+)/);
													var lienAfficher = document
															.getElementById(this.id);
			
													if (this.id
															.indexOf("ControleBlocAction") != -1) {
														var idTexte = 'texteControleBlocAction'
																+ position[0];
														var texte = $('#' + idTexte);
													} else if (this.id
															.indexOf("ActionAttendueBlocAction") != -1) {
														var idTexte = 'texteActionAttendueBlocAction'
																+ position[0];
														var texte = $('#' + idTexte);
													} else if (this.id
															.indexOf("DetailAtypieBlocDetailAction") != -1) {
														var idTexte = 'texteDetailAtypieBlocDetailAction'
																+ position[0];
														var texte = $('#' + idTexte);
													}
			
													if (lienAfficher.innerHTML == afficherMoins) {
														if (isIE) {
															var clampedText = $('#'
																	+ idTexte + 'clamped');
															var fullText = $('#' + idTexte
																	+ 'full');
															fullText.css('display', 'none');
															clampedText.css('display',
																	'block');
														} else {
															texte.css('overflow', 'hidden');
															texte.css('display',
																	'-webkit-box');
															texte.css('-webkit-line-clamp',
																	'2');
															texte.css('-webkit-box-orient',
																	'vertical');
														}
														lienAfficher.innerHTML = afficherPlus;
													} else {
														if (isIE) {
															var clampedText = $('#'
																	+ idTexte + 'clamped');
															var fullText = $('#' + idTexte
																	+ 'full');
															clampedText.css('display',
																	'none');
															fullText
																	.css('display', 'block');
														} else {
															texte.css('display', 'block');
														}
														lienAfficher.innerHTML = afficherMoins;
													}
												});
							});
				</xsl:text>
		</script>

	</xsl:template>

	<!-- Template formattage d'un SIRET -->
	<xsl:template name="formatSIRET">
		<xsl:param name="siret" />
		<xsl:if test="$siret/text() or $siret/*">
			<xsl:value-of
				select="concat(substring($siret,1,3),' ',substring($siret,4,3),' ',substring($siret,7,3),' ',substring($siret,10))" />
		</xsl:if>
	</xsl:template>

	<!-- Template formattage d'une date valorisé en DDMMYYYY -->
	<xsl:template name="formatDate">
		<xsl:param name="date" />
		<xsl:if test="$date/text() or $date/*">
			<xsl:choose>
				<xsl:when test="contains($date,'-')">
					<xsl:choose>
						<xsl:when test="contains($date,'T')">
							<xsl:choose>
								<xsl:when test="string-length($date) &gt; 20">
									<xsl:value-of
										select="concat(substring($date,9,2),'/',substring($date,6,2),'/',substring($date,1,4)),'à',substring($date,12,8),normalize-space(concat('UTC',translate(substring($date,20,3),'0','')))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat(substring($date,9,2),'/',substring($date,6,2),'/',substring($date,1,4)),'à',substring($date,12,8)" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of
								select="concat(substring($date,9),'/',substring($date,6,2),'/',substring($date,1,4))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select="concat(substring($date,1,2),'/',substring($date,3,2),'/',substring($date,5))" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="valoriser">
		<xsl:param name="value" />
		<xsl:if test="$value/text() or $value/*">
			<xsl:value-of select="$value" />
		</xsl:if>
		<xsl:if test="$value[not(node())] or not($value)">
			Non renseigné
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>