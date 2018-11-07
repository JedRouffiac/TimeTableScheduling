
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Groupes                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/**
 * groupe(?Groupe, ?Effectif)
 *
 * @arg Groupe      Nom du groupe
 * @arg Effectif    Nombre d'étudiants dans le groupe
 **/
groupe(info,      62).
groupe(id,        24).
groupe(silr,      38).
groupe(silr1,     18).
groupe(silr2,     20).
groupe(anglais_A, 12).
groupe(anglais_B, 16).
groupe(anglais_C, 18).
groupe(anglais_D, 16).

/**
 * incomp(-G1, -G2)
 *
 * @arg G1     Nom du groupe 1
 * @arg G2     Nom du groupe 2
 */
incomp(id, info).
incomp(silr, info).
incomp(silr1, silr).
incomp(silr1, info).
incomp(silr2, silr).
incomp(silr2, info).
incomp(anglais_A, info).
incomp(anglais_B, info).
incomp(anglais_C, info).
incomp(anglais_D, info).

/**
 * incompatibles(-Groupe1, -Groupe2)
 *
 * Définit l'incompatibilité entre 2 groupes (si il y a des étudiants en commun)
 *
 * @arg Groupe1     Nom du groupe 1
 * @arg Groupe2     Nom du groupe 2
 */
% reflexive
incompatibles(X, X) :- !.

% symétrique
incompatibles(X, Y) :- incomp(X, Y), !.
incompatibles(X, Y) :- incomp(Y, X), !.

%
%%
%%%
%%%%%%%%%%%%%%% matiere INSA ROUEN GM %%%%%%%%%%%%%%%
%%%
%%
%
/**
 * subject(?subject)
 *
 * @arg matiere     Nom de la matière
 **/

%matiere GM3%
%

%s5%
subject(analyse_numerique_1).
subject(fortran).
subject(mesure_distribution).

subject(probabilite).
subject(signal_1).
subject(optimisation_discrete).

subject(C).
subject(algo).

%s6%
subject(analyse_numerique_2).
subject(analyse_fonctionnelle).
subject(algo_num_arith).

subject(statistiques1).
subject(analyse_donnees).
subject(equa_diff).

subject(langage_oriente_objet).
subject(syst_exploitation).




%matiere GM4%
%

%s7%
subject(mnedp1).
subject(edp).
subject(opti_lineaire).


subject(automatique).
subject(markov).
subject(statistiques2).

subject(java).
subject(algo_structure_donnees).

%s9%
subject(mnedp2).
subject(b_spline).

subject(signal2).
subject(opti_combinatoire).

subject(technoweb).
subject(c++).
subject(base_de_donnee).




%matiere GM5%
%

%s10%
subject(regression_non_lineaire).
subject(had).
subject(hamilton_jacobi).
subject(auto_non_lineaire).
subject(calcul_parallelle).
subject(programmation_logique_contrainte).
subject(opti_grande_dimension).

%s11%
subject(meth_iterative).
subject(machine_learning).
subject(traitement_image).
subject(calcul_sto).
subject(realite_virtuelle).
subject(finance).
subject(IA).




%huma
%
subject(anglais).
subject(gsf).
subject(sport).


%
%%
%%%
%%%%%%%%%%%%%%% PROFESSEUR INSA ROUEN GM %%%%%%%%%%%%%%%
%%%
%%
%

/**
 * prof(?Prof)
 *
 * @arg Prof     Nom de l'enseignant
 **/
professor(abdulrab).
professor(beveraggi).
professor(borel).
professor(boutigny).
professor(caputo).
professor(chaignaud).
professor(ciotir).
professor(dubois).
professor(el_assoudi).
professor(el_machkouri).
professor(forcadel).
professor(fortier).
professor(fourati).
professor(knippel).
professor(kotowicz).
professor(gleyse).
professor(godichon).
professor(gout).
professor(jaumat).
professor(itmi).
professor(merieux).
professor(marx).
professor(lemonnier).
professor(le_guyader).
professor(milou).
professor(portier).
professor(rennoux).
professor(tonnoir).
professor(vercouter).
professor(zanni_merk).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   Plages                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plage horaire

/**
 * plage(?Id, -Start, -End)
 *
 * @arg Id      Id de la plage horaire
 * @arg Start   Heure de début de la plage
 * @arg End     Heure de fin de la plage
 */
plage(1, '08h00', '09h30').
plage(2, '09h45', '11h15').
plage(3, '11h30', '13h00').
plage(4, '14h00', '15h30').
plage(5, '15h45', '17h15').
plage(6, '17h30', '19h00').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                    day                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/**
 * month(?Idmonth).
 *
 * @arg Idmonth  Id month
 */
month(1).
month(2).
month(3).
month(4).

/**
* daysPermonth(-Nb).
*
* @arg Nb  Number of days per month
*/
daysPermonth(20).

/**
* date(?IdDay, ?Idmonth)
*
* @arg IdDay  Id day
* @arg Idmonth  Id month
*/
date(J, M) :-
    month(M),
    daysPermonth(Max),
    between(1, Max, J).

/**
 * dateBefore(+J1, +M1, +J2, +M2)
 *
 * Test if date 1 < date 2
 * @arg J1  day date 1
 *
 * @arg M1  month date 1
 * @arg J2  day date 2
 * @arg M2  month date 2
 */
dateBefore( _, M1,  _, M2) :- M1 < M2, !.
dateBefore(J1, M1, J2, M2) :- M1 = M2, J1 < J2, !.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Type de cours                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/**
 * typeCours(?Type)
 *
 * @arg Type  Un type de cours
 */
typeCours(cm).
typeCours(td).
typeCours(tp).
typeCours(ds).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   ClassRoom                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/**
 * ClassRoom(?name, ?Effectif, ?Types)
 *
 * @arg name         name of the ClassRoom
 * @arg Effectif    nomber of available seat
 * @arg Types       List de types de cours
 **/

ClassRoom(Ma-H-R1-01, 60, [cm, ds]).
ClassRoom(Ma-H-R1-03, 60, [cm, ds]).
ClassRoom(Ma-B-RC-17, 50, [td, cm]).
ClassRoom(Ma-B-RC-01, 50, [td, cm]).
ClassRoom(Ma-G-RC-01-02-03, 150, [cm, ds]).
ClassRoom(Ma-I-R1-06, 35, [td]).
ClassRoom(Ma-I-R1-03, 35, [td]).
ClassRoom(Ma-I-R1-08, 35, [td]).
ClassRoom(Ma-E-R1-06, 60, [td, cm]).
ClassRoom(Ma-E-R1-01, 60, [td, cm]).
ClassRoom(Ma-G-RC-05, 30, [td]).
ClassRoom(Ma-G-RC-07, 30, [td]).
ClassRoom(Ma-C-RC-01, 65, [cm, ds]).

ClassRoom(DU-RJ-01, 30, [td]).
ClassRoom(DU-RJ-03, 30, [td]).
ClassRoom(DU-RJ-05, 30, [td]).
ClassRoom(DU-RJ-07, 30, [td]).
ClassRoom(DU-RJ-09, 30, [td]).
ClassRoom(DU-RJ-11, 30, [td]).
ClassRoom(DU-RJ-13, 30, [td]).
ClassRoom(DU-RJ-15, 30, [td]).
ClassRoom(DU-RJ-02, 100, [cm]).
ClassRoom(DU-RJ-06, 100, [cm]).
ClassRoom(DU-RJ-12, 100, [cm]).

ClassRoom(BO-R2-03, 35, [tp]).
ClassRoom(BO-R2-05, 35, [tp]).
ClassRoom(BO-R2-07, 35, [tp]).


/**
 * ClassRoom(?name, ?Effectif)
 *
 * @arg name         name de la ClassRoom
 * @arg Effectif    namebre de place disponibles
 **/

ClassRoom(S, N) :- ClassRoom(S, N, _). % TODO add tests


/**
 * accueille(+ClassRoom, ?TypeCours)
 *
 * @arg ClassRoom       name d'une ClassRoom
 * @arg TypeCours   Type de cours que la ClassRoom accueille
 */

accueille(S, T) :-
    ClassRoom(S, _, L),
    member(T, L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  Séances                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
 * seances(?name, ?Mat, ?Prof, ?Type, ?group, ?Ids).
 *
 * Définition de plusieurs séances à la volée
 *
 * @arg name     name des séances
 * @arg Mat     Id Matière
 * @arg Prof    Id Prof
 * @arg Type    Type de cours
 * @arg group  Id group
 * @arg Ids     Liste d'atomes servant d'ids pour ces séances
 */

/*
 * Systèmes d'information et de connaissances
 * INFO
 */

seances('CM BDD', connaissances_bdd, raschia, cm, info, [
    cm_bdd_1, cm_bdd_2, cm_bdd_3, cm_bdd_4,
    cm_bdd_5, cm_bdd_6, cm_bdd_7, cm_bdd_8
]).

seances('TD BDD', connaissances_bdd, raschia, td, id, [
    td_bdd_id_1,
    td_bdd_id_2,
       td_bdd_id_3,
    td_bdd_id_4,
    td_bdd_id_5
]).

seances('TP BDD', connaissances_bdd, raschia, tp, id, [
    tp_bdd_id_1,
    tp_bdd_id_2,
    tp_bdd_id_3,
    tp_bdd_id_4,
    tp_bdd_id_5,
    tp_bdd_id_6
]).

seances('TD BDD', connaissances_bdd, nachouki, td, silr1, [
    td_bdd_silr1_1,
    td_bdd_silr1_2,
    td_bdd_silr1_3,
    td_bdd_silr1_4,
    td_bdd_silr1_5
]).

seances('TP BDD', connaissances_bdd, nachouki, tp, silr1, [
    tp_bdd_silr1_1,
    tp_bdd_silr1_2,
    tp_bdd_silr1_3,
    tp_bdd_silr1_4,
    tp_bdd_silr1_5,
    tp_bdd_silr1_6
]).

seances('TD BDD', connaissances_bdd, nachouki, td, silr2, [
    td_bdd_silr2_1,
    td_bdd_silr2_2,
    td_bdd_silr2_3,
    td_bdd_silr2_4,
    td_bdd_silr2_5
]).

seances('TP BDD', connaissances_bdd, nachouki, tp, silr2, [
    tp_bdd_silr2_1,
    tp_bdd_silr2_2,
    tp_bdd_silr2_3,
    tp_bdd_silr2_4,
    tp_bdd_silr2_5,
    tp_bdd_silr2_6
]).

seances('DS BDD', connaissances_bdd, raschia, ds, info, [
    ds_bdd
]).

seances('TP mini project IA', connaissances_project_ia, lecapitaine, tp, id, [
    tp_project_ia_id_1,
    tp_project_ia_id_2,
    tp_project_ia_id_3,
    tp_project_ia_id_4,
    tp_project_ia_id_5,
    tp_project_ia_id_6
]).

seances('TP mini project IA', connaissances_project_ia, lecapitaine, tp, silr1, [
    tp_project_ia_silr1_1,
    tp_project_ia_silr1_2,
    tp_project_ia_silr1_3,
    tp_project_ia_silr1_4,
    tp_project_ia_silr1_5,
    tp_project_ia_silr1_6
]).

seances('TP mini project IA', connaissances_project_ia, raschia, tp, silr2, [
    tp_project_ia_silr2_1,
    tp_project_ia_silr2_2,
    tp_project_ia_silr2_3,
    tp_project_ia_silr2_4,
    tp_project_ia_silr2_5,
    tp_project_ia_silr2_6
]).

seances('CM IA', connaissances_ia, martinez, cm, info, [
    cm_IA_1,
    cm_IA_2,
    cm_IA_3,
    cm_IA_4,
    cm_IA_5,
    cm_IA_6
]).

seances('TD IA', connaissances_ia, lecapitaine, td, id, [
    td_IA_id_1,
    td_IA_id_2,
    td_IA_id_3
]).

seances('TD IA', connaissances_ia, martinez, td, silr1, [
    td_IA_silr1_1,
    td_IA_silr1_2,
    td_IA_silr1_3
]).

seances('TD IA', connaissances_ia, raschia, td, silr2, [
    td_IA_silr2_1,
    td_IA_silr2_2,
    td_IA_silr2_3
]).

seances('DS IA', connaissances_ia, martinez, ds, info, [
    ds_ia
]).


/*
 * Ingenierie logicielle
 * INFO
 */

seances('CM multimédia', logiciel_multimedia, jpeg, cm, id, [
    cm_multimedia_1,
    cm_multimedia_2,
    cm_multimedia_3,
    cm_multimedia_4
]).

seances('CM multimédia', logiciel_multimedia, gelgon, cm, id, [
    cm_multimedia_5,
    cm_multimedia_6,
    cm_multimedia_7,
    cm_multimedia_8
]).

seances('TP multimédia', logiciel_multimedia, gelgon, tp, id, [
    tp_multimedia_1,
    tp_multimedia_2,
    tp_multimedia_3,
    tp_multimedia_4,
    tp_multimedia_5,
    tp_multimedia_6
]).

seances('DS multimedia', logiciel_multimedia, [jpeg, gelgon], ds, info, [
    ds_multimedia
]).

seances('CM optimisation et meta heuristique', logiciel_meta_heuristique, kuntz, cm, id, [
    cm_meta_heuristique_1,
    cm_meta_heuristique_2,
    cm_meta_heuristique_3,
    cm_meta_heuristique_4,
    cm_meta_heuristique_5,
    cm_meta_heuristique_6,
    cm_meta_heuristique_7
]).

seances('DS optimisation et meta heuristique', logiciel_meta_heuristique, kuntz, ds, id, [
    ds_meta_heuristique
]).

seances('CM C++', logiciel_c, picarougne, cm, info, [
    cm_c_1,
    cm_c_2,
    cm_c_3,
    cm_c_4,
    cm_c_5,
    cm_c_6,
    cm_c_7,
    cm_c_8,
    cm_c_9,
    cm_c_10
]).

seances('TP C++', logiciel_c, soufiane, tp, id, [
    tp_c_id_1,
    tp_c_id_2,
    tp_c_id_3,
    tp_c_id_4,
    tp_c_id_5,
    tp_c_id_6,
    tp_c_id_7,
    tp_c_id_8,
    tp_c_id_9,
    tp_c_id_10
]).

seances('TP C++', logiciel_c, milliat, tp, silr1, [
    tp_c_silr1_1,
    tp_c_silr1_2,
    tp_c_silr1_3,
    tp_c_silr1_4,
    tp_c_silr1_5,
    tp_c_silr1_6,
    tp_c_silr1_7,
    tp_c_silr1_8,
    tp_c_silr1_9,
    tp_c_silr1_10
]).

seances('TP C++', logiciel_c, picarougne, tp, silr2, [
    tp_c_silr2_1,
    tp_c_silr2_2,
    tp_c_silr2_3,
    tp_c_silr2_4,
    tp_c_silr2_5,
    tp_c_silr2_6,
    tp_c_silr2_7,
    tp_c_silr2_8,
    tp_c_silr2_9,
    tp_c_silr2_10
]).

seances('DS C++', logiciel_c, picarougne, ds, info, [
    ds_c
]).

seances('CM Mini-project C++', logiciel_project_c, picarougne, cm, info, [
    cm_project_c_1,
    cm_project_c_2
]).

seances('CM outils ingénierie logiciel', logiciel_outils, cohen, cm, silr, [
    cm_outils_ingenierie_silr_1,
    cm_outils_ingenierie_silr_2
]).

seances('TP outils ingénierie logiciel', logiciel_outils, cohen, tp, silr1, [
    tp_outils_ingenierie_silr1_1,
    tp_outils_ingenierie_silr1_2,
    tp_outils_ingenierie_silr1_3,
    tp_outils_ingenierie_silr1_4,
    tp_outils_ingenierie_silr1_5,
    tp_outils_ingenierie_silr1_6
]).

seances('TP outils ingénierie logiciel', logiciel_outils, vigier, tp, silr2, [
    tp_outils_ingenierie_silr2_1,
    tp_outils_ingenierie_silr2_2,
    tp_outils_ingenierie_silr2_3,
    tp_outils_ingenierie_silr2_4,
    tp_outils_ingenierie_silr2_5,
    tp_outils_ingenierie_silr2_6
]).

seances('DS outils ingénierie logiciel', logiciel_outils, cohen, ds, silr, [
    ds_outils_ingenierie
]).

/*
 * Mathématiques de la décision
 * ID
 */

seances('CM analyse de données', math_analyse_donnees, kuntz, cm, id, [
    cm_analyse_donnees_1,
    cm_analyse_donnees_2,
    cm_analyse_donnees_3,
    cm_analyse_donnees_4,
    cm_analyse_donnees_5,
    cm_analyse_donnees_6,
    cm_analyse_donnees_7
]).

seances('TD analyse de données', math_analyse_donnees, lecapitaine, td, id, [
    td_analyse_donnees_1,
    td_analyse_donnees_2,
    td_analyse_donnees_3
]).

seances('TP analyse de données', math_analyse_donnees, [lecapitaine, peter], tp, id, [
    tp_analyse_donnees_1,
    tp_analyse_donnees_2,
    tp_analyse_donnees_3,
    tp_analyse_donnees_4,
    tp_analyse_donnees_5,
    tp_analyse_donnees_6
]).

seances('DS analyse de données', math_analyse_donnees, kuntz, ds, id, [
    ds_analyse_donnees
]).

seances('CM architecture para et parallélisation de données', math_archi_parallèle, martinez, cm, id, [
    cm_archi_parallèle_1,
    cm_archi_parallèle_2
]).

seances('TD architecture para et parallélisation de données', math_archi_parallèle, martinez, td, id, [
    td_archi_parallèle_1,
    td_archi_parallèle_2
]).

seances('DS architecture para et parallélisation de données', math_archi_parallèle, martinez, ds, id, [
    ds_archi_parallèle
]).

seances('TD comptabilite', math_compta, goncalves, td, id, [
    td_compta_1,
    td_compta_2,
    td_compta_3,
    td_compta_4,
    td_compta_5,
    td_compta_6,
    td_compta_7
]).

seances('DS comptabilite', math_compta, goncalves, ds, id, [
    ds_compta
]).

/*
 * Mathématiques de la décision & réseau
 * Info
 */

seances('CM crypto', math_crypto, parrein, cm, info, [
    cm_crypto_1,
    cm_crypto_2,
    cm_crypto_3,
    cm_crypto_4,
    cm_crypto_5,
    cm_crypto_6
]).

seances('TD crypto', math_crypto, raschia, td, id, [
    td_crypto_id_1,
    td_crypto_id_2,
    td_crypto_id_3,
    td_crypto_id_4
]).

seances('TD crypto', math_crypto, normand, td, silr1, [
    td_crypto_silr1_1,
    td_crypto_silr1_2,
    td_crypto_silr1_3,
    td_crypto_silr1_4
]).

seances('TD crypto', math_crypto, parrein, td, silr2, [
    td_crypto_silr2_1,
    td_crypto_silr2_2,
    td_crypto_silr2_3,
    td_crypto_silr2_4
]).

seances('DS crypto', math_crypto, parrein, ds, info, [
    ds_crypto
]).

/*
 * Réseaux, multimédias 1
 * Silr
 */

seances('CM réseaux', logiciel_reseau, lehn, cm, silr, [
    cm_reseaux_1,
    cm_reseaux_2,
    cm_reseaux_3,
    cm_reseaux_4,
    cm_reseaux_5,
    cm_reseaux_6,
    cm_reseaux_7
]).

seances('TP réseaux', logiciel_reseau, [leman, parrein], tp, silr1, [
    tp_reseaux_silr1_1,
    tp_reseaux_silr1_2,
    tp_reseaux_silr1_3,
    tp_reseaux_silr1_4,
    tp_reseaux_silr1_5,
    tp_reseaux_silr1_6,
    tp_reseaux_silr1_7,
    tp_reseaux_silr1_8
]).

seances('TP réseaux', logiciel_reseau, [leman, parrein], tp, silr2, [
    tp_reseaux_silr2_1,
    tp_reseaux_silr2_2,
    tp_reseaux_silr2_3,
    tp_reseaux_silr2_4,
    tp_reseaux_silr2_5,
    tp_reseaux_silr2_6,
    tp_reseaux_silr2_7,
    tp_reseaux_silr2_8
]).

seances('DS réseaux', logiciel_reseau, lehn, ds, silr, [
    ds_reseaux
]).

seances('CM traitement d\'image', logiciel_traitement_image, jpeg, cm, silr, [
    cm_traitement_image_1,
    cm_traitement_image_2,
    cm_traitement_image_3,
    cm_traitement_image_4,
    cm_traitement_image_5,
    cm_traitement_image_6,
    cm_traitement_image_7,
    cm_traitement_image_8,
    cm_traitement_image_9,
    cm_traitement_image_10,
    cm_traitement_image_11,
    cm_traitement_image_12
]).

seances('TP traitement d\'image', logiciel_traitement_image, [gelgon, perreira], tp, silr1, [
    tp_traitement_image_silr1_1,
    tp_traitement_image_silr1_2,
    tp_traitement_image_silr1_3,
    tp_traitement_image_silr1_4,
    tp_traitement_image_silr1_5,
    tp_traitement_image_silr1_6,
    tp_traitement_image_silr1_7
]).

seances('TP traitement d\'image', logiciel_traitement_image, marcus, tp, silr2, [
    tp_traitement_image_silr2_1,
    tp_traitement_image_silr2_2,
    tp_traitement_image_silr2_3,
    tp_traitement_image_silr2_4,
    tp_traitement_image_silr2_5,
    tp_traitement_image_silr2_6,
    tp_traitement_image_silr2_7
]).

seances('DS traitement d\'image', logiciel_traitement_image, jpeg, ds, silr, [
    ds_traitement_image
]).

seances('CM traitement du signal', logiciel_signal, le_callet, cm, silr, [
    cm_traitement_signal_1,
    cm_traitement_signal_2,
    cm_traitement_signal_3,
    cm_traitement_signal_4,
    cm_traitement_signal_5,
    cm_traitement_signal_6
]).

seances('TD traitement du signal', logiciel_signal, le_callet, td, silr2, [
    td_traitement_signal_silr1_1,
    td_traitement_signal_silr1_2,
    td_traitement_signal_silr1_3,
    td_traitement_signal_silr1_4,
    td_traitement_signal_silr1_5,
    td_traitement_signal_silr1_6
]).

seances('TD traitement du signal', logiciel_signal, ricordel, td, silr2, [
    td_traitement_signal_silr2_1,
    td_traitement_signal_silr2_2,
    td_traitement_signal_silr2_3,
    td_traitement_signal_silr2_4,
    td_traitement_signal_silr2_5,
    td_traitement_signal_silr2_6
]).

seances('TP traitement du signal', logiciel_signal, [le_callet, vigier], tp, silr1, [
    tp_traitement_signal_silr1_1,
    tp_traitement_signal_silr1_2,
    tp_traitement_signal_silr1_3,
    tp_traitement_signal_silr1_4,
    tp_traitement_signal_silr1_5,
    tp_traitement_signal_silr1_6
]).

seances('TP traitement du signal', logiciel_signal, ricordel, tp, silr2, [
    tp_traitement_signal_silr2_1,
    tp_traitement_signal_silr2_2,
    tp_traitement_signal_silr2_3,
    tp_traitement_signal_silr2_4,
    tp_traitement_signal_silr2_5,
    tp_traitement_signal_silr2_6
]).

seances('DS traitement du signal', logiciel_signal, le_callet, ds, silr, [
    ds_traitement_signal
]).

/*
 * HES
 * Info
 */

seances('CM marketing', hes_marketing, moreau, cm, silr, [
    cm_marketing_silr_1
]).Matiere

seances('CM marketing', hes_marketing, oili, cm, silr, [
    cm_marketing_silr_2
]).

seances('CM marketing', hes_marketing, moreau, cm, id, [
    cm_marketing_id_1
]).

seances('CM marketing', hes_marketing, oili, cm, silr, [
    cm_marketing_id_2
]).

seances('TD marketing', hes_marketing, oili, cm, silr, [
    td_marketing_silr_1,
    td_marketing_silr_2,
    td_marketing_silr_3,
    td_marketing_silr_4,
    td_marketing_silr_5,
    td_marketing_silr_6,
    td_marketing_silr_7
]).

seances('TD marketing', hes_marketing, oili, cm, id, [
    td_marketing_id_1,
    td_marketing_id_2,
    td_marketing_id_3,
    td_marketing_id_4,
    td_marketing_id_5,
    td_marketing_id_6,
    td_marketing_id_7
]).

seances('DS marketing', hes_marketing, [moreau, oili], ds, info, [
    ds_marketing
]).


seances('TD anglais', hes_anglais, prof_anglais1, td, anglais_A, [
    td_anglais_A_1,
    td_anglais_A_2,
    td_anglais_A_3,
    td_anglais_A_4,
    td_anglais_A_5,
    td_anglais_A_6,
    td_anglais_A_7,
    td_anglais_A_8,
    td_anglais_A_9,
    td_anglais_A_10,
    td_anglais_A_11,
    td_anglais_A_12
]).

seances('TD anglais', hes_anglais, prof_anglais2, td, anglais_B, [
    td_anglais_B_1,
    td_anglais_B_2,
    td_anglais_B_3,
    td_anglais_B_4,
    td_anglais_B_5,
    td_anglais_B_6,
    td_anglais_B_7,
    td_anglais_B_8,
    td_anglais_B_9,
    td_anglais_B_10,
    td_anglais_B_11,
    td_anglais_B_12
]).

seances('TD anglais', hes_anglais, prof_anglais3, td, anglais_C, [
    td_anglais_C_1,
    td_anglais_C_2,
    td_anglais_C_3,
    td_anglais_C_4,
    td_anglais_C_5,
    td_anglais_C_6,
    td_anglais_C_7,
    td_anglais_C_8,
    td_anglais_C_9,
    td_anglais_C_10,
    td_anglais_C_11,
    td_anglais_C_12
]).

seances('TD anglais', hes_anglais, prof_anglais4, td, anglais_D, [
    td_anglais_D_1,
    td_anglais_D_2,
    td_anglais_D_3,
    td_anglais_D_4,
    td_anglais_D_5,
    td_anglais_D_6,
    td_anglais_D_7,
    td_anglais_D_8,
    td_anglais_D_9,
    td_anglais_D_10,
    td_anglais_D_11,
    td_anglais_D_12
]).

/*
 * Stages et projects
 * Info
 */

seances('CM génie logiciel gestion projects', project_genie_logiciel, marcus, cm, info, [
    cm_genie_logi_1,
    cm_genie_logi_2,
    cm_genie_logi_3
]).

seances('CM génie logiciel gestion projects', project_genie_logiciel, prie, cm, info, [
    cm_genie_logi_4,
    cm_genie_logi_5,
    cm_genie_logi_6
]).

seances('TD génie logiciel gestion projects', project_genie_logiciel, marcus, td, id, [
    td_genie_logi_id_1,
    td_genie_logi_id_2,
    td_genie_logi_id_3
]).

seances('TD génie logiciel gestion projects', project_genie_logiciel, nachouki, td, silr1, [
    td_genie_logi_silr1_1,
    td_genie_logi_silr1_2,
    td_genie_logi_silr1_3
]).

seances('TD génie logiciel gestion projects', project_genie_logiciel, prie, td, silr2, [
    td_genie_logi_silr2_1,
    td_genie_logi_silr2_2,
    td_genie_logi_silr2_3
]).

seances('TP génie logiciel gestion projects', project_genie_logiciel, marcus, tp, id, [
    tp_genie_logi_id_1
]).

seances('TP génie logiciel gestion projects', project_genie_logiciel, marcus, tp, silr1, [
    tp_genie_logi_silr1_1
]).

seances('TP génie logiciel gestion projects', project_genie_logiciel, marcus, tp, silr2, [
    tp_genie_logi_silr2_1
]).

seances('DS génie logiciel gestion projects', project_genie_logiciel, [marcus, prie], ds, info, [
    ds_genie_logi
]).

seances('CM patrons conception', logiciel_patrons, pigeau, cm, info, [
    cm_patrons_1,
    cm_patrons_2,
    cm_patrons_3
]).

seances('TD patrons conception', logiciel_patrons, marcus, td, id, [
    td_patrons_id_1,
    td_patrons_id_2
]).

seances('TD patrons conception', logiciel_patrons, prie, td, silr1, [
    td_patrons_silr1_1,
    td_patrons_silr1_2
]).

seances('TD patrons conception', logiciel_patrons, pigeau, td, silr2, [
    td_patrons_silr2_1,
    td_patrons_silr2_2
]).

seances('TP patrons conception', logiciel_patrons, marcus, tp, id, [
    tp_patrons_id_1,
    tp_patrons_id_2
]).

seances('TP patrons conception', logiciel_patrons, prie, tp, silr1, [
    tp_patrons_silr1_1,
    tp_patrons_silr1_2
]).

seances('TP patrons conception', logiciel_patrons, pigeau, tp, silr2, [
    tp_patrons_silr2_1,
    tp_patrons_silr2_2
]).

seances('DS patrons conception', logiciel_patrons, pigeau, ds, info, [
    ds_patrons
]).

seances('CM project transversal', project_transversal, jpeg, cm, info, [
    cm_project_transversal_1
]).

seances('CM project transversal', project_transversal, marcus, cm, info, [
    cm_project_transversal_2
]).

seances('project project transversal', project_transversal, prof_ptrans_id, project, id, [
    project_transversal_id_1,
    project_transversal_id_2,
    project_transversal_id_3,
    project_transversal_id_4,
    project_transversal_id_5,
    project_transversal_id_6,
    project_transversal_id_7,
    project_transversal_id_8,
    project_transversal_id_9,
    project_transversal_id_10,
    project_transversal_id_11,
    project_transversal_id_12,
    project_transversal_id_13,
    project_transversal_id_14,
    project_transversal_id_15,
    project_transversal_id_16,
    project_transversal_id_17,
    project_transversal_id_18,
    project_transversal_id_19,
    project_transversal_id_20,
    project_transversal_id_21,
    project_transversal_id_22,
    project_transversal_id_23,
    project_transversal_id_24,
    project_transversal_id_25,
    project_transversal_id_26,
    project_transversal_id_27,
    project_transversal_id_28,
    project_transversal_id_29,
    project_transversal_id_30,
    project_transversal_id_31,
    project_transversal_id_32,
    project_transversal_id_33
]).

seances('project project transversal', project_transversal, prof_ptrans_silr, project, silr, [
    project_transversal_silr_1,
    project_transversal_silr_2,
    project_transversal_silr_3,
    project_transversal_silr_4,
    project_transversal_silr_5,
    project_transversal_silr_6,
    project_transversal_silr_7,
    project_transversal_silr_8,
    project_transversal_silr_9,
    project_transversal_silr_10,
    project_transversal_silr_11,
    project_transversal_silr_12,
    project_transversal_silr_13,
    project_transversal_silr_14,
    project_transversal_silr_15,
    project_transversal_silr_16,
    project_transversal_silr_17,
    project_transversal_silr_18,
    project_transversal_silr_19,
    project_transversal_silr_20,
    project_transversal_silr_21,
    project_transversal_silr_22,
    project_transversal_silr_23,
    project_transversal_silr_24,
    project_transversal_silr_25,
    project_transversal_silr_26,
    project_transversal_silr_27,
    project_transversal_silr_28,
    project_transversal_silr_29,
    project_transversal_silr_30,
    project_transversal_silr_31,
    project_transversal_silr_32,
    project_transversal_silr_33
]).


/**
<<<<<<< HEAD
 * seance(?Id, ?TypeCours, ?subject, ?name)
=======
 * seance(?Id, ?TypeCours, ?subject, ?Nom)
>>>>>>> 0aff67dbf960ff83bb00c8ca0b18523c8f573001
 *
 * @arg Id          Id de la séance
 * @arg TypeCours   Type de cours de la séance
 * @arg subject     subject à laquelle la séance appartient
<<<<<<< HEAD
 * @arg name         name de la séance
=======
 * @arg Nom         Nom de la séance
>>>>>>> 0aff67dbf960ff83bb00c8ca0b18523c8f573001
*/
:- dynamic seance/4.

/**
 * groupSeance(?group, ?Seance)
 *
 * Définit la participation d'un group à une séance
 *
 * @arg group      name du group
 * @arg Seance      Id de la séance
 */
:- dynamic groupSeance/2.

/**
 * profSeance(?Prof, ?Seance)
 *
 * Définit la participation d'un enseignant à une séance
 *
 * @arg Prof        name de l'enseignant
 * @arg Seance      Id de la séance
 */
:- dynamic profSeance/2.

/**
 * suitSeance(+Seance_suivante, ?Seance_suivie)
 *
 * On remarque que le prédicat nous permet également d'implémenter la relation
 * de suite entre les matière (dernière séance matière 1 - première séance
 * matière 2)
 *
 * @arg Seance_suivante     Id de la séance qui suit
 * @arg Seance_suivie       Id de la séance suivit
 */
:- dynamic suitSeance/2.
suitSeance(td_bdd_id_1, cm_bdd_8).
suitSeance(tp_bdd_id_1, cm_bdd_8).
suitSeance(td_bdd_silr1_1, cm_bdd_8).
suitSeance(tp_bdd_silr1_1, cm_bdd_8).
suitSeance(td_bdd_silr2_1, cm_bdd_8).
suitSeance(tp_bdd_silr2_1, cm_bdd_8).

suitSeance(td_IA_silr2_1, cm_IA_6).
suitSeance(td_IA_silr1_1, cm_IA_6).
suitSeance(td_IA_id_1, cm_IA_6).

suitSeance(tp_project_ia_silr2_1, td_IA_silr2_3).
suitSeance(tp_project_ia_silr1_1, td_IA_silr1_3).
suitSeance(tp_project_ia_id_1, td_IA_id_3).

suitSeance(tp_multimedia_1, cm_multimedia_8).
suitSeance(tp_multimedia_1, cm_multimedia_4).

suitSeance(tp_c_id_1, cm_c_10).
suitSeance(tp_c_silr1_1, cm_c_10).
suitSeance(tp_c_silr2_1, cm_c_10).

suitSeance(cm_project_c_1, tp_c_id_10).
suitSeance(cm_project_c_1, tp_c_silr1_10).
suitSeance(cm_project_c_1, tp_c_silr2_10).

suitSeance(tp_outils_ingenierie_silr2_1, cm_outils_ingenierie_silr_2).
suitSeance(tp_outils_ingenierie_silr1_1, cm_outils_ingenierie_silr_2).

suitSeance(td_analyse_donnees_1, cm_analyse_donnees_7).
suitSeance(tp_analyse_donnees_1, td_analyse_donnees_3).

suitSeance(td_archi_parallèle_1, cm_archi_parallèle_2).

suitSeance(td_crypto_silr2_1, cm_crypto_6).
suitSeance(td_crypto_silr1_1, cm_crypto_6).
suitSeance(td_crypto_id_1, cm_crypto_6).

suitSeance(tp_reseaux_silr1_1, cm_reseaux_7).
suitSeance(tp_reseaux_silr2_1, cm_reseaux_7).

suitSeance(tp_traitement_image_silr2_1, cm_traitement_image_12).
suitSeance(tp_traitement_image_silr1_1, cm_traitement_image_12).

suitSeance(td_traitement_signal_silr1_1, cm_traitement_signal_6).
suitSeance(td_traitement_signal_silr2_1, cm_traitement_signal_6).
suitSeance(tp_traitement_signal_silr1_1, cm_traitement_signal_6).
suitSeance(tp_traitement_signal_silr2_1, cm_traitement_signal_6).

suitSeance(cm_marketing_id_2, cm_marketing_id_1).
suitSeance(cm_marketing_silr_2, cm_marketing_silr_1).
suitSeance(td_marketing_id_1, cm_marketing_id_2).
suitSeance(td_marketing_silr_1, cm_marketing_silr_2).

suitSeance(td_genie_logi_id_1, cm_genie_logi_6).
suitSeance(td_genie_logi_silr1_1, cm_genie_logi_6).
suitSeance(td_genie_logi_silr2_1, cm_genie_logi_6).
suitSeance(tp_genie_logi_id_1, cm_genie_logi_6).
suitSeance(tp_genie_logi_silr1_1, cm_genie_logi_6).
suitSeance(tp_genie_logi_silr2_1, cm_genie_logi_6).

suitSeance(td_patrons_id_1, cm_patrons_3).
suitSeance(td_patrons_silr1_1, cm_patrons_3).
suitSeance(td_patrons_silr2_1, cm_patrons_3).
suitSeance(tp_patrons_id_1, td_patrons_id_2).
suitSeance(tp_patrons_silr1_1, td_patrons_silr1_2).
suitSeance(tp_patrons_silr2_1, td_patrons_silr2_2).

suitSeance(cm_project_transversal_2, cm_project_transversal_1).
suitSeance(project_transversal_id_1, cm_project_transversal_2).
suitSeance(project_transversal_silr_1, cm_project_transversal_2).

/**
 * suitSeance(?Seance_suivante, ?Seance_suivie, ?tempsMin, ?tempsMax)
 *
 * @arg Seance_suivante     Id de la séance qui suit
 * @arg Seance_suivie       Id de la séance suivit
 * @arg tempsMin            namebre de days min avant la prochaine séance
 * @arg tempsMax            namebre de days max avant la prochaine séance
 */
suitSeance(ds_bdd, tp_bdd_id_6, 7, 12).
suitSeance(ds_bdd, tp_bdd_silr1_6, 7, 12).
suitSeance(ds_bdd, tp_bdd_silr2_6, 7, 12).

suitSeance(ds_ia, td_IA_id_3, 7, 12).
suitSeance(ds_ia, td_IA_silr1_3, 7, 12).
suitSeance(ds_ia, td_IA_silr2_3, 7, 12).

suitSeance(ds_multimedia, tp_multimedia_6, 7, 12).

suitSeance(ds_meta_heuristique, cm_meta_heuristique_7, 7, 12).

suitSeance(ds_c, tp_c_id_10, 7, 12).
suitSeance(ds_c, tp_c_silr2_10, 7, 12).
suitSeance(ds_c, tp_c_silr1_10, 7, 12).

suitSeance(ds_outils_ingenierie, tp_outils_ingenierie_silr2_6, 7, 12).
suitSeance(ds_outils_ingenierie, tp_outils_ingenierie_silr1_6, 7, 12).

suitSeance(ds_analyse_donnees, tp_analyse_donnees_6, 7, 12).

suitSeance(ds_archi_parallèle, td_archi_parallèle_2, 7, 12).

suitSeance(ds_compta, td_compta_7, 7, 12).

suitSeance(ds_crypto, td_crypto_id_4, 7, 12).
suitSeance(ds_crypto, td_crypto_silr1_4, 7, 12).
suitSeance(ds_crypto, td_crypto_silr2_4, 7, 12).

suitSeance(ds_reseaux, tp_reseaux_silr1_8, 7, 12).
suitSeance(ds_reseaux, tp_reseaux_silr2_8, 7, 12).

suitSeance(ds_traitement_image, tp_traitement_image_silr1_7, 7, 12).
suitSeance(ds_traitement_image, tp_traitement_image_silr2_7, 7, 12).

suitSeance(ds_traitement_signal, tp_traitement_signal_silr1_6, 7, 12).
suitSeance(ds_traitement_signal, tp_traitement_signal_silr2_6, 7, 12).

suitSeance(ds_marketing, td_marketing_id_7, 7, 12).
suitSeance(ds_marketing, td_marketing_silr_7, 7, 12).

suitSeance(ds_genie_logi, td_genie_logi_id_3, 5, 20).
suitSeance(ds_genie_logi, td_genie_logi_silr1_3, 5, 20).
suitSeance(ds_genie_logi, td_genie_logi_silr2_3, 5, 20).
suitSeance(ds_genie_logi, tp_genie_logi_id_1, 5, 20).
suitSeance(ds_genie_logi, tp_genie_logi_silr1_1, 5, 20).
suitSeance(ds_genie_logi, tp_genie_logi_silr2_1, 5, 20).

suitSeance(ds_patrons, tp_patrons_id_2, 7, 12).
suitSeance(ds_patrons, tp_patrons_silr1_2, 7, 12).
suitSeance(ds_patrons, tp_patrons_silr2_2, 7, 12).


suitSeance(cm_project_c_2, cm_project_c_1, 7, 12).

% Écriture dynamique de la base de donnée -------------------------------------

/**
 * computeProfSeance(+P, +Seance)
 *
 * assert profSeance
 *
 * @arg P       Un enseignant ou une liste d'enseignants
 * @arg Seance  Une séance
 */
computeProfSeance(P, Seance) :-
    \+ is_list(P),
    assertz(profSeance(P, Seance)).
computeProfSeance([], _).
computeProfSeance([P|Profs], Seance) :- % si plusieurs profs par séance
    computeProfSeance(P, Seance),
    computeProfSeance(Profs, Seance).

/**
 * computeSeance(+name, +Mat, +Profs, +Type, +group, +S)
 *
 * @arg name     name de la séance
 * @arg Mat     Matière
 * @arg Profs   Enseignant ou liste d'enseignants
 * @arg Type    Type de cours
 * @arg group
 * @arg Ss      Listes d'id de séances
 */
computeSeance(name, Mat, Profs, Type, group, [X]) :-
    computeProfSeance(Profs, X),
    assertz(groupSeance(group, X)),
    assertz(seance(X, Type, Mat, name)).
computeSeance(name, Mat, Profs, Type, group, [X, Y|S]) :-
    (suitSeance(Y, X, _, _); assertz(suitSeance(Y, X))),
    computeSeance(name, Mat, Profs, Type, group, [X]),
    computeSeance(name, Mat, Profs, Type, group, [Y|S]).

% On génère la base de donnée dynamique des séances et des prédicats en lien
:- forall(
    seances(name, Mat, Prof, Type, group, Ids),
    (
        computeSeance(name, Mat, Prof, Type, group, Ids)
    )
).
