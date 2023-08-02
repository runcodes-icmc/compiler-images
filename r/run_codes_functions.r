
##################################################################################
#                               RUN.CODES FUNCTIONS                              #
##################################################################################
require <- function(package, lib.loc = NULL, quietly = FALSE, 
	                warn.conflicts = TRUE, character.only = FALSE){
	
	if (!character.only){
        package <- as.character(substitute(package))
	}

	suppressMessages(
		base::require(package = package, 
			    lib.loc = lib.loc, 
			    quietly = TRUE, 
			    warn.conflicts = FALSE, 
			    character.only = TRUE
		)
	)
}

library <- function(package, help, pos = 2, lib.loc = NULL, character.only = FALSE,
    logical.return = FALSE, warn.conflicts = TRUE, quietly = FALSE,
    verbose = getOption("verbose")){

	if (!character.only){
        package <- as.character(substitute(package))
	}

	suppressMessages(
		base::library(package = package,
			     help = help,
			     pos = 2,
			     lib.loc = lib.loc,
			     character.only = character.only,
			     lib.loc = lib.loc,
			     warn.conflicts = FALSE,
			     quietly = TRUE,
			     verbose = FALSE
		)
	)
}
##################################################################################
#                             RUN.CODES FUNCTIONS END                            #
##################################################################################
