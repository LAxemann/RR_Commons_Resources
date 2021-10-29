/* Basis */
force force ace_medical_fatalDamageSource = 0; 					// Gibt es sofort t�dliche Treffer? (Treffer in lebenswichtige Organe und den Kopf)
force force ace_medical_limping = 0;							// Man kann einstellen, ob man durch Wunden humpelt und wenn ja, ob Bandagieren das Humpeln stoppt
force force ace_medical_fractures = 0; 							// Gibt es Knochenbr�che? (aka braucht man Schienen und wie viel bringen sie?)
force force ace_medical_treatment_medicEpinephrine = 1; 		// Wer darf Epi benutzen?
force force ace_medical_treatment_medicPAK = 1; 				// Wer darf PAKs benutzen?
force force ace_medical_treatment_medicSurgicalKit = 1; 		// Wer darf das Surgical Kit (N�hzeug) benutzen?
force force ace_medical_treatment_timeCoefficientPAK = 1; 
force force ace_medical_treatment_woundReopening = false; 		// K�nnen sich Wunden wieder �ffnen?
force force ace_medical_statemachine_cardiacArrestTime = 420; 	// Wie lange es dauert, bis der Herzstillstand eintritt (nicht der Tod!)
force force ace_medical_statemachine_fatalInjuriesAI = 0; 		// Wann k�nnen KI-Einheiten sofort t�dliche Verletzungen erleiden? (Immer, bei Herzstillstand, nie)
force force ace_medical_statemachine_fatalInjuriesPlayer = 2; 	// Wann k�nnen Spieler sofort t�dliche Verletzungen erleiden? (Immer, bei Herzstillstand, nie)

force force ace_medical_treatment_cprSuccessChance = 1;			// Chance, dass der Herzschlag nach CPR wieder einsetzt

force force ace_medical_treatment_advancedBandages = 0;
force force ace_medical_treatment_advancedDiagnose = 0;
force force ace_medical_treatment_advancedMedication = false;
force force ace_medical_treatment_allowSelfIV = 1;
force force ace_medical_treatment_allowSelfStitch = 1;

force force ace_medical_treatment_clearTraumaAfterBandage = true;
force force ace_medical_treatment_consumePAK = 1;
force force ace_medical_treatment_consumeSurgicalKit = 0;

force force ace_medical_treatment_locationEpinephrine = 0;
force force ace_medical_treatment_locationPAK = 0;
force force ace_medical_treatment_locationsBoostTraining = false;
force force ace_medical_treatment_locationSurgicalKit = 0;

force force ace_medical_spontaneousWakeUpEpinephrineBoost = 30;	
force force ace_medical_ivFlowRate = 10;
force force ace_medical_spontaneousWakeUpChance = 0.25;	
