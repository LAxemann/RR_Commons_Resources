/* Ironpack */
force force ace_medical_fatalDamageSource = 0; 					// Gibt es sofort tödliche Treffer? (Treffer in lebenswichtige Organe und den Kopf)
force force ace_medical_limping = 2;							// Man kann einstellen, ob man durch Wunden humpelt und wenn ja, ob Bandagieren das Humpeln stoppt
force force ace_medical_fractures = 1; 							// Gibt es Knochenbrüche? (aka braucht man Schienen und wie viel bringen sie?)
force force ace_medical_treatment_medicEpinephrine = 1; 		// Wer darf Epi benutzen?
force force ace_medical_treatment_medicPAK = 1; 				// Wer darf PAKs benutzen?
force force ace_medical_treatment_medicSurgicalKit = 1; 		// Wer darf das Surgical Kit (Nähzeug) benutzen?
force force ace_medical_treatment_timeCoefficientPAK = 2.5; 
force force ace_medical_treatment_woundReopening = true; 		// Können sich Wunden wieder öffnen?
force force ace_medical_statemachine_cardiacArrestTime = 720; 	// Wie lange es dauert, bis der Herzstillstand eintritt (nicht der Tod!)
force force ace_medical_statemachine_fatalInjuriesAI = 0; 		// Wann können KI-Einheiten sofort tödliche Verletzungen erleiden? (Immer, bei Herzstillstand, nie)
force force ace_medical_statemachine_fatalInjuriesPlayer = 1; 	// Wann können Spieler sofort tödliche Verletzungen erleiden? (Immer, bei Herzstillstand, nie)

force force ace_medical_treatment_cprSuccessChance = 0.5;		// Chance, dass der Herzschlag nach CPR wieder einsetzt

force force ace_medical_treatment_advancedBandages = 2;
force force ace_medical_treatment_advancedDiagnose = 1;
force force ace_medical_treatment_advancedMedication = true;
force force ace_medical_treatment_allowSelfIV = 1;
force force ace_medical_treatment_allowSelfStitch = 1;

force force ace_medical_treatment_clearTraumaAfterBandage = false;
force force ace_medical_treatment_consumePAK = 1;
force force ace_medical_treatment_consumeSurgicalKit = 0;

force force ace_medical_treatment_locationEpinephrine = 0;
force force ace_medical_treatment_locationPAK = 3;
force force ace_medical_treatment_locationsBoostTraining = false;
force force ace_medical_treatment_locationSurgicalKit = 0;

force force ace_medical_spontaneousWakeUpEpinephrineBoost = 8;	
force force ace_medical_ivFlowRate = 1.5;
force force ace_medical_spontaneousWakeUpChance = 0.03125;	
