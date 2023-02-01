/* Medicsystem */
#include "\z\RR_commons\addons\main\modKonfigurationsTemplates\medicSettings\shared.h"
#ifdef RR_MEDICSYSTEM_BASIS
	#include "\z\RR_commons\addons\main\modKonfigurationsTemplates\medicSettings\basis.h"
#endif
#ifdef RR_MEDICSYSTEM_IRONPACK
	#include "\z\RR_commons\addons\main\modKonfigurationsTemplates\medicSettings\ironpack.h"
#endif
#ifdef RR_MEDICSYSTEM_IRONPACKPLUS
	#include "\z\RR_commons\addons\main\modKonfigurationsTemplates\medicSettings\ironpackplus.h"
#endif
#ifdef RR_MEDICSYSTEM_HARDCORE
	#include "\z\RR_commons\addons\main\modKonfigurationsTemplates\medicSettings\hardcore.h"
	#include "\z\RR_commons\addons\main\modKonfigurationsTemplates\medicSettings\kat.h"
#endif


/* Logistiksystem */
#ifdef RR_LOGISTIKSYSTEM_STANDARD
	#include "\z\RR_commons\addons\main\modKonfigurationsTemplates\logistikSettings\standard.h"
#endif

#ifdef RR_LOGISTIKSYSTEM_ERWEITERT
	#include "\z\RR_commons\addons\main\modKonfigurationsTemplates\logistikSettings\erweitert.h"
#endif
