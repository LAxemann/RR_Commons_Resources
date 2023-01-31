/* Medicsystem */
#include "\RR_commons_resources\modKonfigurationsTemplates\medicSettings\shared.h"
#ifdef RR_MEDICSYSTEM_BASIS
	#include "\RR_commons_resources\modKonfigurationsTemplates\medicSettings\basis.h"
#endif
#ifdef RR_MEDICSYSTEM_IRONPACK
	#include "\RR_commons_resources\modKonfigurationsTemplates\medicSettings\ironpack.h"
#endif
#ifdef RR_MEDICSYSTEM_IRONPACKPLUS
	#include "\RR_commons_resources\modKonfigurationsTemplates\medicSettings\ironpackplus.h"
#endif
#ifdef RR_MEDICSYSTEM_HARDCORE
	#include "\RR_commons_resources\modKonfigurationsTemplates\medicSettings\hardcore.h"
#endif


/* Logistiksystem */
#ifdef RR_LOGISTIKSYSTEM_STANDARD
	#include "\RR_commons_resources\modKonfigurationsTemplates\logistikSettings\standard.h"
#endif

#ifdef RR_LOGISTIKSYSTEM_ERWEITERT
	#include "\RR_commons_resources\modKonfigurationsTemplates\logistikSettings\erweitert.h"
#endif
