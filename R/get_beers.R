#' Get Beers Function is All You Need
#'
#' \url{https://punkapi.com/documentation/v2}
#'
#' \code{get_beers} Wrapper function to return data from the Punk API. This is a collection of beer brewing recipes from the brewer Brewdog. It is regularly published in a less programmatically queriable form as the DIY Dog
#'
#' @param one_beer Integer. Returns a single beer from the api using the beers id. Use this only without any other parameters present.
#'
#' @param abv_gt Integer. Returns all beers with ABV greater than the supplied number
#'
#' @param abv_lt Integer. Returns all beers with ABV less than the supplied number
#'
#' @param ibu_gt Integer. Returns all beers with IBU greater than the supplied number
#'
#' @param ibu_lt Integer. Returns all beers with IBU less than the supplied number
#'
#' @param ebc_gt Integer. Returns all beers with EBC greater than the supplied number
#'
#' @param ebc_lt Integer. Returns all beers with EBC less than the supplied number
#'
#' @param beer_name String. Returns all beers matching the supplied name (this will match partial strings as well so e.g punk will return Punk IPA), if you need to add spaces just add an underscore (_).
#'
#' @param yeast String. Returns all beers matching the supplied yeast name, this performs a fuzzy match, if you need to add spaces just add an underscore (_).
#'
#' @param brewed_before String. Returns all beers brewed before this date, the date format is mm/yyyy e.g 10/2011
#'
#' @param brewed_after String. Returns all beers brewed after this date, the date format is mm/yyyy e.g 10/2011
#'
#' @param hops String. Returns all beers matching the supplied hops name, this performs a fuzzy match, if you need to add spaces just add an underscore (_).
#'
#' @param malt String. Returns all beers matching the supplied malt name, this performs a fuzzy match, if you need to add spaces just add an underscore (_).
#'
#' @param food String. Returns all beers matching the supplied food string, this performs a fuzzy match, if you need to add spaces just add an underscore (_).
#'
#' @param ids String. Returns all beers matching the supplied ID's. You can pass in multiple ID's by separating them with a | symbol.
#'
#' @param per_page Integer. Number of recipes to return from the query. Defaults to the maximum of 80.
#'
#' @return Beer recpies to brew your own. Returns a dataframe. With some nested lists.
#'
#' @export
#'
#' @examples
#'
#' get_beers(12)
#'
#' get_beers(abv_gt = 8)
#'
#' get_beers(abv_gt = 8,
#'           yeast = "Wyeast",
#'           brewed_after = "09/2013",
#'           hops = "Fuggle")
#'

get_beers <-
  function(one_beer = NULL,
           abv_gt = NULL,
           abv_lt = NULL,
           ibu_gt = NULL,
           ibu_lt = NULL,
           ebc_gt = NULL,
           ebc_lt = NULL,
           beer_name = NULL,
           yeast = NULL,
           brewed_before = NULL,
           brewed_after = NULL,
           hops = NULL,
           malt = NULL,
           food = NULL,
           ids = NULL,
           per_page = 80) {

    if (!is.null(one_beer)) {
      one_beer_uri <-
        paste0("https://api.punkapi.com/v2/beers/", one_beer)

      beer_results <-
        jsonlite::fromJSON(RCurl::getForm(one_beer_uri,
                                          .checkParams = FALSE))

    } else {

      beer_results <-
        jsonlite::fromJSON(RCurl::getForm(
          "https://api.punkapi.com/v2/beers",
          .params = c(
            abv_gt = abv_gt,
            abv_lt = abv_lt,
            ibu_gt = ibu_gt,
            ibu_lt = ibu_lt,
            ebc_gt = ebc_gt,
            ebc_lt = ebc_lt,
            beer_name = beer_name,
            yeast = yeast,
            brewed_before = brewed_before,
            brewed_after = brewed_after,
            hops = hops,
            malt = malt,
            food = food,
            ids = ids,
            per_page = 80
          )
        ))
    }

    return(beer_results)

  }
