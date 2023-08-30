<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:gipmds="http://www.gip-mds.fr/" xmlns:map="xalan://java.util.Map"
	extension-element-prefixes="map">
	<xsl:output method="xml" media-type="text/xml"
		encoding="UTF-8" indent="no" />

	<xsl:param name="path_fichier_transcos" />
	<xsl:param name="filtres" />
	<xsl:param name="crmtpt" />

	<xsl:variable name="fichier_transcos"
		select="document($path_fichier_transcos)/balises"
		xpath-default-namespace="https://gipmds/1.0" />

	<xsl:template match="/">
		<xsl:variable name="tailleColonne">
			<xsl:choose>
				<xsl:when test="$crmtpt = 1">
					380px
				</xsl:when>
				<xsl:otherwise>
					200px
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="$crmtpt = 0">
			<div id="blocRapport">
				<div>
					<fieldset>
						<legend id="legendBlocRapport">
							Rapport
						</legend>

						<table id="tableBlocRapport">
							<tr>
								<td id="labelTypeCrmBlocRapport" width="{$tailleColonne}">
									Type CRM
								</td>
								<td id="dpTypeCrmBlocRapport" class="pr-10">:</td>
								<td id="valeurTypeCrmBlocRapport">
									<xsl:call-template name="valoriser">
										<xsl:with-param name="value">
											<xsl:value-of select="gipmds:rapport/@type" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td id="labelVersionXsdBlocRapport">
									Version XSD
								</td>
								<td id="dpVersionXsdBlocRapport" class="pr-10">:</td>
								<td id="valeurVersionXsdBlocRapport">
									<xsl:call-template name="valoriser">
										<xsl:with-param name="value">
											<xsl:value-of select="gipmds:rapport/@version" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</table>

					</fieldset>
				</div>
			</div>

			<br />
		</xsl:if>

		<xsl:if test="not(ends-with($filtres, 'depot') or starts-with($filtres,'depot;') or contains($filtres,';depot;'))">
			<div id="blocDepot">
				<div>
					<fieldset>
						<legend id="legendBlocDepot">
							Dépôt
						</legend>

						<table id="tableBlocDepot">
							<tr>
								<td id="labelIdFluxBlocDepot" width="{$tailleColonne}">
									Identification du flux
								</td>
								<td id="labelIdFluxBlocRapport" class="pr-10">:</td>
								<td id="valeurIdFluxBlocRapport">
									<xsl:call-template name="valoriser">
										<xsl:with-param name="value">
											<xsl:value-of
												select="gipmds:rapport/envoi/envoi_identification/idflux" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
							<xsl:if test="not(contains($filtres,'depot_01'))">
								<tr>
									<td id="labelVersionNormeBlocDepot">
										Numéro de version de la norme utilisée
										<xsl:if test="$crmtpt = 1">
											(S10.G00.00.006)
										</xsl:if>
									</td>
									<td id="depNormeBlocDepot" class="pr-10">:</td>

									<td id="valeurVersionNormeBlocDepot">
										<xsl:call-template name="valoriser">
											<xsl:with-param name="value">
												<xsl:value-of
													select="gipmds:rapport/envoi/envoi_identification/version_norme" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td id="labelPointDepotBlocDepot">
										Point de dépôt
										<xsl:if test="$crmtpt = 1">
											(S10.G00.00.007)
										</xsl:if>
									</td>
									<td id="dpPointDepotBlocDepot" class="pr-10">:</td>
									<td id="valeurPointDepotBlocDepot">

										<xsl:if
											test="gipmds:rapport/envoi/envoi_identification/point_de_depot/text() or gipmds:rapport/envoi/envoi_identification/point_de_depot/*">
											<xsl:variable name="code"
												select="gipmds:rapport/envoi/envoi_identification/point_de_depot/text()" />
											<xsl:variable name="transco_found"
												select="$fichier_transcos/point_de_depot/transco[@code = $code]/text()"
												xpath-default-namespace="https://gipmds/1.0" />

											<xsl:choose>
												<xsl:when test="$transco_found">
													<xsl:value-of select="$transco_found" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="$code" />
												</xsl:otherwise>
											</xsl:choose>

										</xsl:if>
										<xsl:if
											test="gipmds:rapport/envoi/envoi_identification/point_de_depot[not(node())] or not(gipmds:rapport/envoi/envoi_identification/point_de_depot)">
											Non renseigné
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="$crmtpt = 1">
								<xsl:if test="not(contains($filtres,'depot_01'))">
									<tr>
										<td id="labelTypeEnvoiBlocDepot">
											Type d'envoi
											<xsl:if test="$crmtpt = 1">
												(S10.G00.00.008)
											</xsl:if>
										</td>
										<td id="dpTypeEnvoiBlocDepot" class="pr-10">:</td>
										<td id="valeurTypeEnvoiBlocDepot">
											<xsl:call-template name="valoriser">
												<xsl:with-param name="value">
													<xsl:value-of
														select="gipmds:rapport/envoi/envoi_identification/type_envoi" />
												</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td id="labelCodeEnvoiBlocDepot">
										Code d'envoi du fichier d'essai ou réel
										<xsl:if test="$crmtpt = 1">
											(S10.G00.00.005)
										</xsl:if>
									</td>
									<td id="dpCodeEnvoiBlocDepot" class="pr-10">:</td>
									<td id="valeurCodeEnvoiBlocDepot">

										<xsl:if
											test="gipmds:rapport/envoi/envoi_identification/essai_reel/text() or gipmds:rapport/envoi/envoi_identification/essai_reel/*">
											<xsl:variable name="code"
												select="gipmds:rapport/envoi/envoi_identification/essai_reel/text()" />
											<xsl:variable name="transco_found"
												select="$fichier_transcos/code_envoi/transco[@code = $code]/text()"
												xpath-default-namespace="https://gipmds/1.0" />

											<xsl:choose>
												<xsl:when test="$transco_found">
													<xsl:value-of select="$transco_found" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="$code" />
												</xsl:otherwise>
											</xsl:choose>

										</xsl:if>
										<xsl:if
											test="gipmds:rapport/envoi/envoi_identification/essai_reel[not(node())] or not(gipmds:rapport/envoi/envoi_identification/essai_reel)">
											Non renseigné
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td id="labelSiretEmetteurBlocDepot">
									SIRET émetteur
									<xsl:if test="$crmtpt = 1">
										(S10.G00.01.001, S10.G00.01.002)
									</xsl:if>
								</td>
								<td id="dpSiretEmetteurBlocDepot" class="pr-10">:</td>
								<td id="valeurSiretEmetteurBlocDepot">
									<xsl:if
										test="gipmds:rapport/envoi/envoi_identification/emetteur_siret/text() or gipmds:rapport/envoi/envoi_identification/emetteur_siret/*">
										<xsl:call-template name="formatSIRET">
											<xsl:with-param name="siret">
												<xsl:value-of
													select="gipmds:rapport/envoi/envoi_identification/emetteur_siret" />
											</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if
										test="gipmds:rapport/envoi/envoi_identification/emetteur_siret[not(node())] or not(gipmds:rapport/envoi/envoi_identification/emetteur_siret)">
										Non renseigné
									</xsl:if>
								</td>
							</tr>
							<xsl:if
								test="$crmtpt = 1 and not(contains($filtres,'depot_logiciel'))">
								<tr>
									<td id="labelNomLogicielBlocDepot">
										Nom du logiciel utilisé (S10.G00.00.001)
									</td>
									<td id="dpNomLogicielBlocDepot" class="pr-10">:</td>
									<td id="valeurNomLogicielBlocDepot">
										<xsl:call-template name="valoriser">
											<xsl:with-param name="value">
												<xsl:value-of
													select="gipmds:rapport/envoi/envoi_identification/nom_logiciel" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td id="labelNomEditeurBlocDepot">
										Nom de l'éditeur (S10.G00.00.002)
									</td>
									<td id="dpNomEditeurBlocDepot" class="pr-10">:</td>
									<td id="valeurNomEditeurBlocDepot">
										<xsl:call-template name="valoriser">
											<xsl:with-param name="value">
												<xsl:value-of
													select="gipmds:rapport/envoi/envoi_identification/editeur_logiciel" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td id="labelVersionLogicielBlocDepot">
										Numéro de version du logiciel utilisé
										(S10.G00.00.003)
									</td>
									<td id="dpVersionLogicielBlocDepot" class="pr-10">:</td>
									<td id="valeurVersionLogicielBlocDepot">
										<xsl:call-template name="valoriser">
											<xsl:with-param name="value">
												<xsl:value-of
													select="gipmds:rapport/envoi/envoi_identification/version_logiciel" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="$crmtpt = 0">
								<tr>
									<td id="labelRaisonSocialeBlocDepot">
										Raison sociale émetteur
									</td>
									<td id="dpRaisonSocialeBlocDepot" class="pr-10">:</td>
									<td id="valeurRaisonSocialeBlocDepot">
										<xsl:call-template name="valoriser">
											<xsl:with-param name="value">
												<xsl:value-of
													select="gipmds:rapport/envoi/envoi_identification/raison_sociale" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</table>
					</fieldset>
				</div>
			</div>
			<br />

		</xsl:if>

		<xsl:if test="not(contains($filtres,'bilanDepot'))">
			<div id="blocBilanDepot">
				<div>
					<fieldset>
						<legend id="legendBlocBilanDepot">
							Bilan dépôt
						</legend>

						<table id="tableBlocBilanDepot">
							<tr>
								<td id="" width="192px">État</td>
								<td id="" class="pr-10">:</td>
								<td id="">
									<xsl:call-template name="valoriser">
										<xsl:with-param name="value">
											<xsl:value-of
												select="gipmds:rapport/envoi/envoi_bilan/envoi_etat" />
										</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>
			</div>

			<br />
		</xsl:if>


		<!-- Bloc declaration -->
		<xsl:if test="gipmds:rapport/declaration">

			<xsl:variable name="nbDecls"
				select="count(gipmds:rapport/declaration)" />

			<xsl:for-each select="gipmds:rapport/declaration">

				<xsl:variable name="pos" select="position()" />

				<div id="">
					<div>
						<fieldset>
							<legend id="">
								Déclaration
								<xsl:if test="$crmtpt = 0">
									<xsl:value-of select="$pos" />
									sur
									<xsl:value-of select="$nbDecls" />
								</xsl:if>
							</legend>

							<fieldset>
								<legend class="sous-legend" id="">
									Identifiant de la
									déclaration
								</legend>

								<table id="">
									<xsl:if test="$crmtpt = 0">
										<tr>
											<td id="" width="{$tailleColonne}">Rang</td>
											<td id="" class="pr-10">:</td>
											<td id="">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="declaration_identification/rang" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="$crmtpt = 1">
										<tr>
											<td id="" width="{$tailleColonne}">Nature de la déclaration (S20.G00.05.001)</td>
											<td id="" class="pr-10">:</td>
											<td id="">
												<xsl:if
													test="declaration_identification/nature/text() or declaration_identification/nature/*">
													<xsl:variable name="code"
														select="declaration_identification/nature/text()" />
													<xsl:variable name="transco_found"
														select="$fichier_transcos/nature_declaration/transco[@code = $code]/text()"
														xpath-default-namespace="https://gipmds/1.0" />

													<xsl:choose>
														<xsl:when test="$transco_found">
															<xsl:value-of select="$transco_found" />
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="$code" />
														</xsl:otherwise>
													</xsl:choose>

												</xsl:if>
												<xsl:if
													test="declaration_identification/nature[not(node())] or not(declaration_identification/nature)">
													Non renseigné
												</xsl:if>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="not(contains($filtres,'declaration_01'))">
										<tr>
											<td id="" width="{$tailleColonne}">
												Type de la déclaration
												<xsl:if test="$crmtpt = 1">
													(S20.G00.05.002)
												</xsl:if>
											</td>
											<td id="" class="pr-10">:</td>
											<td id="">

												<xsl:if
													test="declaration_identification/type/text() or declaration_identification/type/*">
													<xsl:variable name="code"
														select="declaration_identification/type/text()" />
													<xsl:variable name="transco_found"
														select="$fichier_transcos/type_declaration/transco[@code = $code]/text()"
														xpath-default-namespace="https://gipmds/1.0" />

													<xsl:choose>
														<xsl:when test="$transco_found">
															<xsl:value-of select="$transco_found" />
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="$code" />
														</xsl:otherwise>
													</xsl:choose>

												</xsl:if>
												<xsl:if
													test="declaration_identification/type[not(node())] or not(declaration_identification/type)">
													Non renseigné
												</xsl:if>
											</td>
										</tr>
									</xsl:if>

									<xsl:if test="$crmtpt = 0">
										<tr>
											<td id="" width="{$tailleColonne}">Mois principal déclaré</td>
											<td id="" class="pr-10">:</td>
											<td id="">
												<xsl:if
													test="declaration_identification/mois[not(node())] or not(declaration_identification/mois)">
													Non renseigné
												</xsl:if>
												<xsl:if
													test="declaration_identification/mois/text() or declaration_identification/mois/*">
													<xsl:call-template name="formatDate">
														<xsl:with-param name="date">
															<xsl:value-of
																select="declaration_identification/mois" />
														</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>

										<tr>
											<td id="" width="{$tailleColonne}">Identifiant métier</td>
											<td id="" class="pr-10">:</td>
											<td id="">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="declaration_identification/identifiant_metier" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>

									<xsl:if
										test="$crmtpt = 1 and not(contains($filtres,'declaration_01'))">
										<tr>
											<td id="" width="{$tailleColonne}">Numéro de fraction de la déclaration
												(S20.G00.05.003)</td>
											<td id="" class="pr-10">:</td>
											<td id="">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="declaration_identification/fraction" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td id="" width="{$tailleColonne}">Numéro d'ordre de la déclaration
												(S20.G00.05.004)</td>
											<td id="" class="pr-10">:</td>
											<td id="">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="declaration_identification/ordre" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td id="" width="{$tailleColonne}">
											SIREN
											<xsl:if test="$crmtpt = 0">
												émetteur
											</xsl:if>
											<xsl:if test="$crmtpt = 1">
												(S21.G00.06.001)
											</xsl:if>
										</td>
										<td id="" class="pr-10">:</td>
										<td id="">
											<xsl:if
												test="declaration_identification/SIREN[not(node())] or not(declaration_identification/SIREN)">
												Non renseigné
											</xsl:if>
											<xsl:if
												test="declaration_identification/SIREN/text() or declaration_identification/SIREN/*">
												<xsl:call-template name="formatSIREN">
													<xsl:with-param name="siren">
														<xsl:value-of
															select="declaration_identification/SIREN" />
													</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
									<xsl:if
										test="$crmtpt = 1 and not(contains($filtres,'NICSiegedeclaration'))">
										<tr>
											<td id="" width="{$tailleColonne}">
												NIC siège (S21.G00.06.002)
											</td>
											<td id="" class="pr-10">:</td>
											<td id="">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="declaration_identification/nic_siege" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td id="" width="{$tailleColonne}">
											NIC d'affectation
											<xsl:if test="$crmtpt = 1">
												(S21.G00.11.001)
											</xsl:if>
										</td>
										<td id="" class="pr-10">:</td>
										<td id="">
											<xsl:call-template name="valoriser">
												<xsl:with-param name="value">
													<xsl:value-of
														select="declaration_identification/nic_affectation" />
												</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</table>
							</fieldset>

							<br />

							<xsl:if test="not(contains($filtres,'bilanDeclaration'))">
								<fieldset>
									<legend class="sous-legend" id="">
										Bilan de la déclaration
									</legend>

									<table id="">
										<tr>
											<td
												id="labelEtatBlocBilanDeclaration${boucleDeclarations.count}"
												width="192px">
												État
											</td>
											<td
												id="dpEtatBlocBilanDeclaration${boucleDeclarations.count}"
												class="pr-10">:</td>
											<td
												id="valeurEtatBlocBilanDeclaration${boucleDeclarations.count}">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of select="declaration_bilan/etat" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
										</tr>
										<xsl:if
											test="declaration_bilan/etat/text() = 'ANO' or declaration_bilan/etat/text() = 'KO'">
											<tr>
												<td
													id="labelNombreSalarieslocBilanDeclaration${boucleDeclarations.count}"
													width="192px">
													Nombre de salariés
												</td>
												<td
													id="dpNombreSalariesBlocBilanDeclaration${boucleDeclarations.count}"
													class="pr-10">:</td>
												<td
													id="valeurNombreSalariesBlocBilanDeclaration${boucleDeclarations.count}">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="declaration_bilan/declaration_contenu/salaries" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</table>
								</fieldset>

								<br />
							</xsl:if>

							<xsl:if
								test="$crmtpt = 1 and (declaration_anomalie/environnement/salarie/text() or declaration_anomalie/text())
								and (declaration_bilan/etat = 'ANO' or declaration_bilan/etat = 'KO')">
								<fieldset>
									<legend class="sous-legend" id="">
										Anomalie(s)
									</legend>

									<xsl:if
										test="declaration_anomalie[1]/environnement/salarie and not(contains($filtres,'ListeSalaries'))">
										<fieldset>
											<legend class="sous-legend" id="">
												Salarié
											</legend>
											<table id="" class="table table-striped table-bordered">
												<thead>
													<th id="">NIR/NTT</th>
													<th id="">Nom de Famille</th>
													<th id="">Prénom(s)</th>
												</thead>
												<tbody>
													<xsl:for-each
														select="declaration_anomalie[1]/environnement/salarie">
															<tr id="">
																<td id="">
																	<xsl:call-template name="valoriser">
																		<xsl:with-param name="value">
																			<xsl:choose>
																				<xsl:when test="NIR/text()">
																					<xsl:value-of select="NIR" />
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="NTT" />
																				</xsl:otherwise>
																			</xsl:choose>
																		</xsl:with-param>
																	</xsl:call-template>
																</td>
																<td id="">
																	<xsl:call-template name="valoriser">
																		<xsl:with-param name="value">
																			<xsl:value-of select="nom_famille" />
																		</xsl:with-param>
																	</xsl:call-template>
																</td>
																<td id="">
																	<xsl:call-template name="valoriser">
																		<xsl:with-param name="value">
																			<xsl:value-of select="prenoms" />
																		</xsl:with-param>
																	</xsl:call-template>
																</td>
															</tr>
													</xsl:for-each>
												</tbody>
											</table>

										</fieldset>
										<br />
									</xsl:if>
									<xsl:if test="declaration_anomalie">
										<fieldset>
											<legend class="sous-legend" id="">
												Liste Anomalies
											</legend>
											<table id="" class="table table-striped table-bordered">
												<thead>
													<th id="">Code</th>
													<xsl:if
														test="not(contains($filtres,'colAnomaliesCategorie'))">
														<th id="">Catégorie</th>
													</xsl:if>
													<th id="">Message</th>
													<xsl:if
														test="not(contains($filtres,'colAnomaliesNombre'))">
														<th id="">Nombre</th>
													</xsl:if>
												</thead>
												<tbody>
													<xsl:for-each select="declaration_anomalie">
														<tr id="">
															<td id="">
																<xsl:call-template name="valoriser">
																	<xsl:with-param name="value">
																		<xsl:value-of select="description/code" />
																	</xsl:with-param>
																</xsl:call-template>
															</td>
															<xsl:if
																test="not(contains($filtres,'colAnomaliesCategorie'))">
																<td id="">
																	<xsl:call-template name="valoriser">
																		<xsl:with-param name="value">
																			<xsl:value-of
																				select="description/categorie" />
																		</xsl:with-param>
																	</xsl:call-template>
																</td>
															</xsl:if>
															<td id="">
																<xsl:call-template name="valoriser">
																	<xsl:with-param name="value">
																		<xsl:value-of
																			select="description/message" />
																	</xsl:with-param>
																</xsl:call-template>
															</td>
															<xsl:if
																test="not(contains($filtres,'colAnomaliesNombre'))">
																<td id="">
																	<xsl:call-template name="valoriser">
																		<xsl:with-param name="value">
																			<xsl:value-of
																				select="description/nombre" />
																		</xsl:with-param>
																	</xsl:call-template>
																</td>
															</xsl:if>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>

										</fieldset>
									</xsl:if>
								</fieldset>

								<br />
							</xsl:if>

							<xsl:if test="$crmtpt = 0">
								<xsl:if test="declaration_bilan/contrat">
									<fieldset>
										<legend class="sous-legend" id="">
											Liste contrats
										</legend>

										<table id="" class="table table-striped table-bordered">
											<thead>
												<th id="">Date début contrat</th>
												<th id="">Numéro contrat</th>
												<th id="">Nature contrat</th>
												<th id="">Statut</th>
												<th id="">Libellé emploi</th>
												<th id="">Code régime</th>
											</thead>
											<tbody>
												<xsl:for-each
													select="declaration_bilan/contrat">
													<tr id="">
														<td id="">
															<xsl:if
																test="date_debut_contrat[not(node())] or not(date_debut_contrat)">
																Non renseigné
															</xsl:if>
															<xsl:if
																test="date_debut_contrat/text() or date_debut_contrat/*">
																<xsl:call-template name="formatDate">
																	<xsl:with-param name="date">
																		<xsl:value-of select="date_debut_contrat" />
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:if>
														</td>
														<td id="">
															<xsl:call-template name="valoriser">
																<xsl:with-param name="value">
																	<xsl:value-of select="num_contrat" />
																</xsl:with-param>
															</xsl:call-template>
														</td>
														<td id="">
															<xsl:if
																test="nature_contrat/text() or nature_contrat/*">
																<xsl:variable name="code"
																	select="nature_contrat/text()" />
																<xsl:variable name="transco_found"
																	select="$fichier_transcos/nature_contrat/transco[@code = $code]/text()"
																	xpath-default-namespace="https://gipmds/1.0" />

																<xsl:choose>
																	<xsl:when test="$transco_found">
																		<xsl:value-of select="$transco_found" />
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="$code" />
																	</xsl:otherwise>
																</xsl:choose>

															</xsl:if>
															<xsl:if
																test="nature_contrat[not(node())] or not(nature_contrat)">
																Non renseigné
															</xsl:if>
														</td>
														<td id="">
															<xsl:if
																test="statut_conventionnel_contrat/text() or statut_conventionnel_contrat/*">
																<xsl:variable name="code"
																	select="statut_conventionnel_contrat/text()" />
																<xsl:variable name="transco_found"
																	select="$fichier_transcos/statut_conventionnel_contrat/transco[@code = $code]/text()"
																	xpath-default-namespace="https://gipmds/1.0" />

																<xsl:choose>
																	<xsl:when test="$transco_found">
																		<xsl:value-of select="$transco_found" />
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="$code" />
																	</xsl:otherwise>
																</xsl:choose>

															</xsl:if>
															<xsl:if
																test="statut_conventionnel_contrat[not(node())] or not(statut_conventionnel_contrat)">
																Non renseigné
															</xsl:if>
														</td>
														<td id="">
															<xsl:call-template name="valoriser">
																<xsl:with-param name="value">
																	<xsl:value-of
																		select="libelle_emploi_contrat" />
																</xsl:with-param>
															</xsl:call-template>
														</td>
														<td id="">
															<xsl:if
																test="code_regime_maladie_contrat/text() or code_regime_maladie_contrat/*">
																<xsl:variable name="code"
																	select="code_regime_maladie_contrat/text()" />
																<xsl:variable name="transco_found"
																	select="$fichier_transcos/code_regime_maladie_contrat/transco[@code = $code]/text()"
																	xpath-default-namespace="https://gipmds/1.0" />

																<xsl:choose>
																	<xsl:when test="$transco_found">
																		<xsl:value-of select="$transco_found" />
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="$code" />
																	</xsl:otherwise>
																</xsl:choose>

															</xsl:if>
															<xsl:if
																test="code_regime_maladie_contrat[not(node())] or not(code_regime_maladie_contrat)">
																Non renseigné
															</xsl:if>
														</td>
													</tr>
												</xsl:for-each>

											</tbody>
										</table>

									</fieldset>
								</xsl:if>
								<xsl:if test="declaration_bilan/taux_AT">
									<xsl:variable name="nbTaux"
										select="count(declaration_bilan/taux_AT)" />
									<fieldset>
										<legend class="sous-legend" id="">
											Liste taux
										</legend>
										<xsl:for-each select="declaration_bilan/taux_AT">
											<fieldset>
												<legend id="">
													Taux
													<xsl:value-of select="position()" />
													sur
													<xsl:value-of select="$nbTaux" />
												</legend>
												<table id="">
													<tr>
														<td id="" width="183px">
															Code CTN
														</td>
														<td id="" class="pr-10">:</td>
														<td id="">
															<xsl:call-template name="valoriser">
																<xsl:with-param name="value">
																	<xsl:value-of select="code_ctn" />
																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td id="">
															Section
														</td>
														<td id="" class="pr-10">:</td>
														<td id="">
															<xsl:call-template name="valoriser">
																<xsl:with-param name="value">
																	<xsl:value-of select="section" />
																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td id="">
															Code risque
														</td>
														<td id="" class="pr-10">:</td>
														<td id="">
															<xsl:call-template name="valoriser">
																<xsl:with-param name="value">
																	<xsl:value-of select="code_risque" />
																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td id="">
															Bureau
														</td>
														<td id="" class="pr-10">:</td>
														<td id="">
															<xsl:call-template name="valoriser">
																<xsl:with-param name="value">
																	<xsl:value-of select="temoin_bureau" />
																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td id="">
															Taux
														</td>
														<td id="" class="pr-10">:</td>
														<td id="">
															<xsl:call-template name="valoriser">
																<xsl:with-param name="value">
																	<xsl:value-of
																		select="replace(taux,'[.]',',')" />
																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td id="">
															Date effet
														</td>
														<td id="" class="pr-10">:</td>
														<td id="">
															<xsl:value-of
																select="format-date(date_effet, '[D01]/[M01]/[Y0001]')" />
														</td>
													</tr>
													<tr>
														<td id="">
															Date de calcul
														</td>
														<td id="" class="pr-10">:</td>
														<td id="">
															<xsl:value-of
																select="format-date(date_calcul, '[D01]/[M01]/[Y0001]')" />
														</td>
													</tr>
												</table>
											</fieldset>
										</xsl:for-each>
									</fieldset>
								</xsl:if>
							</xsl:if>
						</fieldset>
					</div>
				</div>

				<br />
			</xsl:for-each>

			<br />
		</xsl:if>

		<!-- Fin bloc declaration -->

		<!-- bloc information atmp -->

		<xsl:if
			test="gipmds:rapport/communication/information_collective/@type='atmp'">

			<div id="blocInfoCollectiveAtmp">
				<fieldset class="card-block bordure-cadre">
					<legend id="legendInfoCollectiveAtmp">
						Information collective (atmp)
					</legend>
					<xsl:for-each
						select="gipmds:rapport/communication/information_collective/calcul">
						<div class="">
							<table id="">
								<tr>
									<td id="" class="pr-10">
										Date de génération
									</td>
									<td id="" class="pr-10">:</td>
									<td id="">
										<xsl:call-template name="valoriser">
											<xsl:with-param name="value">
												<xsl:value-of
													select="format-dateTime(@date_calcul, '[D01]/[M01]/[Y0001] à [H01]:[m01]:[s01]')" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<table id="" class="table table-striped table-bordered">
								<thead>
									<th id="">Section</th>
									<th id="">Date d'effet</th>
									<th id="">Code CTN</th>
									<th id="">Code risque</th>
									<th id="">Bureau</th>
									<th id="">Taux</th>
								</thead>
								<tbody>
									<xsl:for-each select="information">
										<tr id="">
											<td id="">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="donnees_clefs/rubriques/rubrique_string[@name='section']" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td id="">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="format-date(donnees_clefs/rubriques/rubrique_date[@name='dateDebutEffet'], '[D01]/[M01]/[Y0001]')" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td id="">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="donnees_declaration/rubriques/rubrique_string[@name='codeCtn']" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td id="">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="donnees_declaration/rubriques/rubrique_string[@name='codeRisque']" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td id="">
												<xsl:call-template name="valoriser">
													<xsl:with-param name="value">
														<xsl:value-of
															select="donnees_declaration/rubriques/rubrique_string[@name='temoinBureau']" />
													</xsl:with-param>
												</xsl:call-template>
											</td>
											<td id="">
												<xsl:value-of
													select="replace(donnees_paie/taux[@part='patronale'],'[.]',',')" />
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
						<br />

					</xsl:for-each>
					<!-- Fin forEach declaration -->
				</fieldset>
			</div>
		</xsl:if>
		<!-- Fin information atmp -->

		<!-- bloc information bmcc -->
		<xsl:if
			test="gipmds:rapport/communication/information_collective/@type='bmcc'">
			<div id="blocInfoCollectiveBmcc">
				<fieldset>
					<legend id="legendInfoCollectiveBmcc">
						Information collective (bmcc)
					</legend>
					<xsl:for-each
						select="gipmds:rapport/communication/information_collective/calcul">
						<div class="tableauCenter">
							<table id="">
								<tr>
									<td id="" class="pr-10">
										Date de génération
									</td>
									<td id="" class="pr-10">:</td>
									<td id="">
										<xsl:call-template name="valoriser">
											<xsl:with-param name="value">
												<xsl:value-of
													select="format-dateTime(@date_calcul, '[D01]/[M01]/[Y0001] à [H01]:[m01]:[s01]')" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td id="">
										Phase de calcul
									</td>
									<td id="" class="pr-10">:</td>
									<td id="">
										<xsl:call-template name="valoriser">
											<xsl:with-param name="value">
												<xsl:value-of select="@phase" />
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<div class="horizontal-scrolling">
								<table id="" class="table table-striped table-bordered">
									<thead>
										<th id="">Date effet</th>
										<th id="">Date de fin</th>
										<th id="">Taux</th>
										<th id="">Taux CCP</th>
										<th id="">Identifiant</th>
										<th id="">Détail taux</th>
										<th id="">Début info</th>
										<th id="">Fin info</th>
										<th id="">Info séparation</th>
										<th id="">Date calcul taux contribution	</th>
										<th id="">Motif exclusion</th>
										<th id="">Id régularisation</th>
										<th id="">Motif régularisation</th>
									</thead>
									<tbody>
										<xsl:for-each select="information">
											<tr id="">
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="format-date(donnees_clefs/rubriques/rubrique_date[@name='dateDebutEffet'], '[D01]/[M01]/[Y0001]')" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="format-date(donnees_clefs/rubriques/rubrique_date[@name='dateFinEffet'], '[D01]/[M01]/[Y0001]')" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td id="">
													<xsl:if
														test="not(donnees_paie/taux[@part='patronale'])">
														Non renseigné
													</xsl:if>
													<xsl:if test="donnees_paie/taux[@part='patronale']">
														<xsl:value-of
															select="replace(donnees_paie/taux[@part='patronale'],'[.]',',')" />
													</xsl:if>
												</td>
												<!-- GDA 40237  Bonus Malus Ajout Taux CCP -->
												<td id="">
													<xsl:if
														test="not(donnees_paie/taux[@part='CCP'])">
														Non renseigné
													</xsl:if>
													<xsl:if test="donnees_paie/taux[@part='CCP']">
														<xsl:value-of
															select="replace(donnees_paie/taux[@part='CCP'],'[.]',',')" />
													</xsl:if>
												</td>
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="donnees_declaration/rubriques/rubrique_string[@name='identifiantTaux']" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="donnees_complement/rubriques/rubrique_string[@name='codeTypeTauxDetail']" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="format-date(donnees_complement/rubriques/rubrique_date[@name='infoDateDebut'], '[D01]/[M01]/[Y0001]')" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="format-date(donnees_complement/rubriques/rubrique_date[@name='infoDateFin'], '[D01]/[M01]/[Y0001]')" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="donnees_complement/rubriques/rubrique_integer[@name='infoNombreSeparations']" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="format-date(donnees_declaration/rubriques/rubrique_date[@name='dateCalculTauxContribution'], '[D01]/[M01]/[Y0001]')" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="donnees_complement/rubriques/rubrique_string[@name='codeMotifExclusion']" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="donnees_complement/rubriques/rubrique_string[@name='identifiantRegularisation']" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td id="">
													<xsl:call-template name="valoriser">
														<xsl:with-param name="value">
															<xsl:value-of
																select="donnees_complement/rubriques/rubrique_string[@name='codeMotifRegularisation']" />
														</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</div>
						</div>

					</xsl:for-each>
				</fieldset>
			</div>
		</xsl:if>
		<!-- Fin information bmcc -->

	</xsl:template>

	<!-- Template formattage d'un SIRET -->
	<xsl:template name="formatSIRET">
		<xsl:param name="siret" />
		<xsl:value-of
			select="concat(substring($siret,1,3),' ',substring($siret,4,3),' ',substring($siret,7,3),' ',substring($siret,10))" />
	</xsl:template>

	<!-- Template formattage d'un SIREN -->
	<xsl:template name="formatSIREN">
		<xsl:param name="siren" />
		<xsl:value-of
			select="concat(substring($siren,1,3),' ',substring($siren,4,3),' ',substring($siren,7))" />
	</xsl:template>

	<!-- Template formattage d'une date valorisé en DDMMYYYY -->
	<xsl:template name="formatDate">
		<xsl:param name="date" />
		<xsl:value-of
			select="concat(substring($date,1,2),'/',substring($date,3,2),'/',substring($date,5))" />
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
