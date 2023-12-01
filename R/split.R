# ==============================================================================#
# package -----------------------------------------------------------------
# ==============================================================================#

# importing required packages
library(readxl)
library(writexl)
library(tidyverse)

# ==============================================================================#
# split excel to separate sheet -------------------------------------------
# ==============================================================================#

# function
#' readin excel and sum all sheets
#'
#' @param fname
#'
#' @return sheets name list
#' @export
#'
#' @examples
#' library(rSplitExcel)
#' multiplesheets(fname)
multiplesheets <- function(fname) {
  # getting info about all excel sheets
  sheets <- readxl::excel_sheets(fname)

  # output <- vector("character", length(sheets))
  output <- list(length(sheets))

  for (x in seq_along(sheets)) {
    tibble <- readxl::read_excel(fname, sheet = x)

    if (colnames(tibble)[1] == "...1") {
      tibble <- readxl::read_excel(fname, sheet = x, skip = 1)
    }

    output[x] <- list(colnames(tibble))
    # writexl::write_xlsx(tibble, paste0(sheets[x], ".xlsx"))
  }
  return(output)
}

# specifying the path name
# fname <- "./cpd_test.xlsx"

# ==============================================================================#
# merge same sheet into one -----------------------------------------------
# ==============================================================================#

# function
#' write sheets with same title to one file
#'
#' @param fname
#'
#' @return output excels
#' @export
#'
#' @examples
#' library(rSplitExcel)
#' multiplesheets_write(fname)
multiplesheets_write <- function(fname) {
  # get the function run
  cols <- multiplesheets(fname) %>% unique()

  # create output list
  for (y in seq_along(cols)) {
    assign(paste0("data_", y), list())
  }

  # getting info about all excel sheets
  sheets <- readxl::excel_sheets(fname)

  for (x in seq_along(sheets)) {
    tibble <- readxl::read_excel(fname, sheet = x) %>% as.data.frame()

    if (colnames(tibble)[1] == "...1") {
      tibble <- readxl::read_excel(fname, sheet = x, skip = 1) %>% as.data.frame()
    }

    match <- lapply(cols, function(z) {
      identical(z, colnames(tibble))
    }) %>%
      as.numeric() %>%
      as.data.frame() %>%
      rownames_to_column() %>%
      filter(. == 1) %>%
      pull(rowname)

    # get(paste0("data_", match)) <- list(tibble)
    assign(paste0("data_", match), get(paste0("data_", match)) %>% append(list(tibble)))
  }

  # for (file in seq_along(cols)) {
  #   writexl::write_xlsx(do.call(rbind, get(paste0("data_", file))), paste0("compound_", file, ".xlsx"))
  # }
}

# multiplesheets_write(fname)
