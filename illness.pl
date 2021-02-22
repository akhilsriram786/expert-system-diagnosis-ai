/*Source code of expert system*/
/*top level query*/
go:-
assumption((Illness),CF),
write('As per the symptoms it seems like you have '),
write(Illness),
nl,
write('with confidence factor '),
write(CF),
nl,
medication((Illness),CF),
nl,
write('hope you get well soon,Take Care'),

undo.

/*assumption that should be tested*/
/* rules for identifying the illness*/
assumption((cold),90) :- 
check(headache),
check(runny_nose),
check(sneezing),
check(sore_throat),
check(nasal_congestion).

assumption((cold),80) :- 
\+(check(headache)),
check(runny_nose),
check(sneezing),
check(sore_throat).


assumption((typhoid),95) :- 
check(headache),
check(abdominal_pain),
check(poor_appetite),
check(high_fever),
check(weight_loss),
check(constipation),
check(weakness_and_fatigue).

assumption((typhoid),65) :- 
check(headache),
check(abdominal_pain),
check(poor_appetite),
check(high_fever),
\+(check(weight_loss)),
check(constipation),
check(weakness_and_fatigue).


assumption((malaria),80) :-
check(fever),
check(sweating),
check(headache),
check(nausea),
check(vomiting),
check(diarrhea).

assumption((malaria),60) :-
check(fever),
\+(check(sweating)),
check(headache),
check(nausea),
check(vomiting),
check(diarrhea).

assumption((flu),95) :- 
check(fever),
check(headache),
check(chills),
check(body_ache).

assumption((flu),75) :- 
check(fever),
\+(check(headache)),
check(chills),
check(body_ache).


assumption((tonsillitis),90) :- 
check(impaired_voice),
check(sore_throat),
check(earache),
check(swollen_tonsils),
check(high_temperature),
check(tender_lymph_nodes).

assumption((tonsillitis),70) :- 
check(impaired_voice),
check(sore_throat),
\+(check(earache)),
check(swollen_tonsils),
check(high_temperature),
check(tender_lymph_nodes).

assumption((measles),80) :- 
check(fever),
check(runny_nose),
check(rash),
check(conjunctivitis).

assumption((measles),70) :- 
check(fever),
\+(check(runny_nose)),
check(rash),
check(conjunctivitis).


assumption((asthma),90) :- 
check(chest_tightness),
check(shotness_of_breath),
check(wheezing_attacks),
check(trouble_sleeping).

assumption((asthma),50) :- 
check(chest_tightness),
check(shotness_of_breath),
\+(check(wheezing_attacks)),
check(trouble_sleeping).

assumption((chickenpox),90) :- 
check(mild_fever),
check(fatigue),
check(rashes),
check(spots),
check(blisters).

assumption((chickenpox),80) :- 
check(mild_fever),
\+(check(fatigue)),
check(rashes),
check(spots),
check(blisters).

assumption((insomnia),85) :- 
check(daytime_tiredness),
check(difficulty_in_falling_asleep),
check(unrefreshing_sleep),
check(unable_to_focus_on_task),
check(depression_or_anxiety),
check(waking_up_too_early),
check(waking_up_during_nights).

assumption((insomnia),75) :- 
check(daytime_tiredness),
check(difficulty_in_falling_asleep),
check(unrefreshing_sleep),
check(unable_to_focus_on_task),
\+(check(depression_or_anxiety)),
check(waking_up_too_early),
check(waking_up_during_nights).

assumption((kidney_infection),90) :- 
check(fever),
check(back_or_flak_pain),
check(abdominal_pain),
check(burning_sensation_while_urinating),
check(pus_or_blood_in_urine),
check(frequent_urination).

assumption((kidney_infection),50) :- 
check(fever),
\+(check(back_or_flak_pain)),
check(abdominal_pain),
check(burning_sensation_while_urinating),
\+(check(pus_or_blood_in_urine)),
check(frequent_urination).

assumption((sinusitis),85) :- 
check(facial_tenderness),
check(nasal_congestion),
check(sinus_headache),
check(runny_nose),
check(throat_irritation),
check(phlegm).

assumption((sinusitis),80) :- 
\+(check(facial_tenderness)),
check(nasal_congestion),
check(sinus_headache),
check(runny_nose),
check(throat_irritation),
check(phlegm).

assumption((indigestion),90) :- 
check(bloating),
check(nausea),
check(abdominal_pain),
check(belching_and_gas),
check(acidic_taste),
check(growling_stomach).

assumption((indigestion),70) :- 
check(bloating),
check(nausea),
check(abdominal_pain),
\+(check(belching_and_gas)),
check(acidic_taste),
check(growling_stomach).

assumption((mouth_ulcer),90) :- 
check(bleeding_sore),
check(painful_sores_in_mouth),
check(swoolen_skin_around_sore),
check(irritation_of_sores),
check(problem_chewing).

assumption((mouth_ulcer),85) :- 
\+(check(bleeding_sore)),
check(painful_sores_in_mouth),
check(swoolen_skin_around_sore),
check(irritation_of_sores),
check(problem_chewing).

assumption((diabetes),90) :- 
check(slow_healing_of_wounds),
check(frequent_urinating),
check(blurred_vision),
check(feeling_very_thirsty),
check(feeling_very_tired),
check(weight_loss).

assumption((diabetes),80) :- 
check(slow_healing_of_wounds),
check(frequent_urinating),
check(blurred_vision),
check(feeling_very_thirsty),
\+(check(feeling_very_tired)),
check(weight_loss).

assumption((corona),90) :- 
check(fever),
check(dry_cough),
check(tiredness),
check(sore_throat),
check(loss_of_taste_or_smell),
check(difficulty_breathing_or_shortness_of_breath),
check(chest_pain).

assumption((corona),90) :- 
check(fever),
check(dry_cough),
\+(check(tiredness)),
check(sore_throat),
check(loss_of_taste_or_smell),
check(difficulty_breathing_or_shortness_of_breath),
check(chest_pain).

assumption(unknown,90). /* no diagnosis*/

/*rules for providing the medication to the illness*/
medication(cold,90) :- mcold, !.
medication(cold,80) :- mcold, !.
medication(typhoid,95) :- mtyphoid, !.
medication(typhoid,65) :- mtyphoid, !.
medication(malaria,80) :- mmalaria, !.
medication(malaria,60) :- mmalaria, !.
medication(flu,95) :- mflu, !.
medication(flu,75) :- mflu, !.
medication(tonsillitis,90) :- mtonsillitis, !.
medication(tonsillitis,70) :- mtonsillitis, !.
medication(measles,80) :- mmeasles, !.
medication(measles,70) :- mmeasles, !.
medication(asthma,90) :- masthma, !.
medication(asthma,50) :- masthma, !.
medication(chickenpox,90) :- mchickenpox, !.
medication(chickenpox,80) :- mchickenpox, !.
medication(insomnia,85) :- minsomnia, !.
medication(insomnia,75) :- minsomnia, !.
medication(kidney_infection,90) :- mkidney_infection , !.
medication(kidney_infection,50) :- mkidney_infection , !.
medication(sinusitis,85) :- msinusitis, !.
medication(sinusitis,80) :- msinusitis, !.
medication(indigestion,90) :- mindigestion, !.
medication(indigestion,70) :- mindigestion, !.
medication(mouth_ulcer,90) :- mmouth_ulcer, !.
medication(mouth_ulcer,85) :- mmouth_ulcer, !.
medication(diabetes,90) :- mdiabetes, !.
medication(diabetes,80) :- mdiabetes, !.
medication(corona,90) :- mcorona, !.
medication(corona,90) :- mcorona, !.


mcold :- mcoldprescription, !.

mcoldprescription:-

write('Prescription and Advice:'),
nl,
write('1: Cheston/tab'),
nl,
write('2: Acetaminophen/tab'),
nl,
write('3: Aleve/tab'),
nl,
write('4: Phenylephrine nasal spray'),
nl,
write('Please drink warm soup'),
nl.




mtyphoid :-

write('Prescription and Advice:'),
nl,
write('1: Ceftriaxone/tab'),
nl,
write('2: Ampicillin/tab'),
nl,
write('3: Zithromax/tab'),
nl,
write('4: ciprofloxacin/tab'),
nl,
write('Please take complete bed rest and take soft Diet and avoid outside food'),
nl.



mmalaria :-

write('Prescription and Advice:'),
nl,
write('1: Aralen/tab'),
nl,
write('2: Qualaquin/tab'),
nl,
write('3: Plaquenil/tab'),
nl,
write('4: Mefloquine'),
nl,
write('Wear clothes that cover most of the body,use mosquito  repellent lotions'),
nl.

mflu:-

write('Prescription and Advice:'),
nl,
write('1: Peramivir/tab'),
nl,
write('2: Baloxavir/tab'),
nl,
write('3: Zanamivir/tab'),
nl,
write('Gargle with salt water , eat a healthy diet'),
nl.



mtonsillitis :-

write('Prescription and Advice:'),
nl,
write('1: Acetaminophen/tab'),
nl,
write('2: Motrin/tab'),
nl,
write('3: Ibuproffen/tab'),
nl,
write('Drink warm tea with honey and take lozengers containing benzocaine'),
nl.


mmeasles :-

write(' Prescription and Advice:'),
nl,
write('1: Ribavirin/tab'),
nl,
write('2: Aleve/tab'),
nl,
write('3: Advil/tab'),
nl,
write('4: Vitamin A'),
nl,
write('Have a measles vaccine ,take plenty of fluids and Vitamin A supplements'),
nl.


masthma :-

write('Prescription and Advice:'),
nl,
write('1: Ventolin HFA/inhaler'),
nl,
write('2: Albuterol/inhaler'),
nl,
write('3: Levalbuterol/inhaler'),
nl,
write('4: Metaproterenol/tab'),
nl,
write('5: Terbutaline/tab'),
nl,
write('Always carry the inhaler and dont get exposed to any smoke'),
nl.



mchickenpox :-

write('Prescription and Advice:'),
nl,
write('1: Calamine lotion'),
nl,
write('2: Antihistamine'),
nl,
write('3: Tylenol/tab'),
nl,
write('4: Piriton/tab'),
nl,
write('Reduce the itching by  wearing loose clothes and stay at home untill its cured'),
nl.



minsomnia :-

write('Prescription and Advice:'),
nl,
write('1: Zaleplon/tab'),
nl,
write('2: Doxepin/tab'),
nl,
write('3: Rozerem/tab'),
nl,
write('4: Restoril/tab'),
nl,
write('Donot consume caffeine ,alcohol,take regular exercise and follow timings for sleeping'),
nl.



mkidney_infection :-

write('Prescription and Advice:'),
nl,
write('1: Ciprofloxacin/tab'),
nl,
write('2: Levaquin/tab'),
nl,
write('3: Ceftin/tab'),
nl,
write('4: Zosyn/tab'),
nl,
write('Drink fluids and dont try to delay the urine for long time and take probiotics'),
nl.


msinusitis :-

write('Prescription and Advice:'),
nl,
write('1: Cefdinir/tab'),
nl,
write('2: Levaquin/tab'),
nl,
write('3: Zithromax/tab'),
nl,
write('4: Bactrim/tab'),
nl,
write('Inhale steam ,avoid antihistamines and sleep with your head elevated'),
nl.



mindigestion :-

write('Prescription and Advice:'),
nl,
write('1: Zantac/tab'),
nl,
write('2: Prilosec/tab'),
nl,
write('3: Famotidine/tab'),
nl,
write('4: Kaopectate/tab'),
nl,
write('Avoid spicy and greasy food ,avoid caffeine, avoid alcohol,drink fluids and eat food by chewing well'),
nl.



mmouth_ulcer:-

write('Prescription and Advice:'),
nl,
write('1: Hydrocortisone buccal/tab'),
nl,
write('2: Boots Mouth Ulcer Gel'),
nl,
write('3: Kenalog Gel'),
nl,
write('4: Pediaderm TA Gel'),
nl,
write('Avoid hot food and drinks ,use soft toothbrush and eliminate food irritants'),
nl.



mdiabetes :-

write('Prescription and Advice:'),
nl,
write('1: Meglitinides/tab'),
nl,
write('2: Insulin/injection'),
nl,
write('3: Meglitinides/tab'),
nl,
write('4: Glycomet/tab'),
nl,
write('check your sugar levels, drink water frequently,increase fiber intake,control stress level and eat food with less Glycemic index'),
nl.



mcorona :-

write('Prescription and Advice:'),
nl,
write('1: Currently no medication is recommended but plasma tratment and hydroxychloroquine are being used in some countries'),
nl,
write('Wash hands often, use sanitizer, wear mask when you go out dont touch your eyes,nose and mouth..STAY HOME STAY SAFE..Social Distancing is the key'),
nl.

/* how to ask questions */
ask(Question) :-
write('Does the patient have following symptom:'),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
asserta(yes(Question)) ;
asserta(no(Question)), fail).

:- dynamic(yes/1, no/1). 
/*How to check something */
check(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))).
/* undo all yes no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.