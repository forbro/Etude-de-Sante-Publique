--- Le ratio plus élevé Disponibilité alimentaire en protéine/Habitants ---
SELECT dispo.pays, round(sum((dispo.dispo_prot*365)/1000)) as ratio_en_Kg_par_habitant_par_an
	FROM dispo_alim dispo join population pop on (dispo.code_pays = pop.code_pays)
	group by dispo.pays, pop.habitant
	order by ratio_en_Kg_par_habitant_par_an desc
	limit 10;
	

--- Le ratio plus élevé Disponibilité alimentaire en kcal/Habitants ---
SELECT dispo.pays, round(sum(dispo.dispo_alim_kcal_p_j*365)) as ratio_en_Kcal_par_habitant_par_an
	FROM dispo_alim dispo join population pop on (dispo.code_pays = pop.code_pays) 
	group by dispo.pays, pop.habitant
	order by ratio_en_Kcal_par_habitant_par_an desc
	limit 10;
	
--- Le ratio moins élevé Disponibilité alimentaire en protéine/Habitants ---
SELECT dispo.pays, round(sum((dispo.dispo_prot*365)/1000)) as ratio_en_Kg_par_habitant_par_an
	FROM dispo_alim dispo join population pop on (dispo.code_pays = pop.code_pays)
	group by dispo.pays, pop.habitant
	order by ratio_en_Kg_par_habitant_par_an asc
	limit 10;
	
----- Quantité totale de produits perdus
SELECT SUM(pertes) as Pertes_alimentaire_en_Kg from equilibre_prod where annee = 2013


--- Les 10 pays pour lesquels la proportion de personnes sous-alimentées est la plus forte ----
SELECT sous.pays, sous.population*100/pop.habitant as proportion_p_sous_alimentees FROM sous_nutrition sous JOIN population pop
ON(sous.code_pays = pop.code_pays) order by proportion_p_sous_alimentees desc limit 10
	

----- Les 10 produits pour lesquels le ratio **Autres utilisation/ Disponibilité intérieure** est le plus élevé
SELECT produit, round(sum(autres_utilisations/dispo_int)) as ratio_autres_utilisation_tonnes_par_dispo_int_tonnes from equilibre_prod 
where dispo_int != 0 group by produit order by ratio_autres_utilisation_tonnes_par_dispo_int_tonnes desc limit 10
