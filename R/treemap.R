#' Treemap density coloured by categorical variable
#' @param x A data.frame
#' @return highcharts viz
#' @section ctypes:
#' Cat
#' @examples
#'
#' hgch_treemap_Cat(sampleData("Cat", nrow = 10))
#'
#' @export hgch_treemap_Cat
hgch_treemap_Cat <- function(data, title = NULL, subtitle = NULL, caption = NULL,
                             minColor = "#E63917", maxColor= "#18941E", back_color = 'white', color_title = 'black',
                             reverse = TRUE, export = FALSE,...){
  # data <- sampleData("Cat-Num")
  f <- fringe(data)
  nms <- getClabels(f)

  title <-  title %||% nms[1]
  subtitle <- subtitle %||% ""
  caption <- caption %||% ""

  data <- f$d
  d <- data %>% na.omit() %>% dplyr::group_by(a) %>% dplyr::summarise(b = n())
  d$w <- map_chr(d$b, function(x) format(round(x,2), nsmall=(ifelse(count_pl(x)>2, 2, 0)), big.mark=","))


  hc <- hchart(d, "treemap", hcaes(x = a, value = b, color = b)) %>%
    hc_chart(backgroundColor = back_color) %>%
    hc_title(text = title, style = list(color = color_title, useHTML = TRUE)) %>%
    hc_subtitle(text = subtitle) %>%
    hc_credits(enabled = TRUE, text = caption) %>%
    hc_colorAxis(maxColor = maxColor, minColor = minColor) %>%
    hc_tooltip(
      pointFormat='
                     {point.a}: {point.w}
                  '
    )
  if(reverse) hc <- hc %>% hc_colorAxis(maxColor = minColor, minColor = maxColor)
  if(export) hc <- hc %>% hc_exporting(enabled = TRUE)
  hc
}

#' Treemap coloured by categorical variable
#' @param x A data.frame
#' @return highcharts viz
#' @section ctypes:
#' Cat
#' @examples
#'
#' hgch_treemap_discrete_color_Cat(sampleData("Cat", nrow = 10))
#'
#' @export hgch_treemap_discrete_color_Cat
hgch_treemap_discrete_color_Cat <-function(data, title = NULL, subtitle = NULL,  caption = NULL,
                                           back_color = 'white', color_title = 'black', export = FALSE){

  f <- fringe(data)
  nms <- getCnames(f)
  data <- f$d


  title <-  title %||% nms[1]
  subtitle <- subtitle %||% ""
  caption <- caption %||% ""


  data <- plyr::rename(data, c("a" = "name"))

  data_graph <- data %>%
    dplyr::group_by(name) %>%
    tidyr::drop_na(name) %>%
    dplyr::summarise(value = n())

  data_graph <- data_graph %>%
    dplyr::mutate(x = 0:(dim(data_graph)[1]-1),
                  y = 10 + x + 10 * sin(x),
                  y = round(y, 1),
                  z = (x*y) - median(x*y),
                  color = getPalette()[1:(dim(data_graph)[1])])

  hc <- highchart() %>%
    hc_chart(backgroundColor = back_color) %>%
    hc_title(text = title, style = list(color = color_title, useHTML = TRUE)) %>%
    hc_credits(enabled = TRUE, text = caption) %>%
    hc_subtitle(text = subtitle) %>%
    hc_chart(type = "treemap",
             polar = FALSE) %>%
    #hc_xAxis(Categories = data_graph$name) %>%
    hc_add_series(data_graph, showInLegend = FALSE)
  if (export)
    hc <- hc %>% hc_exporting(enabled = TRUE)
  hc
}


#' Treemap density by numeric variable
#' @param x A data.frame
#' @return highcharts viz
#' @section ctypes:
#' Cat-Num
#' @examples
#'
#' hgch_treemap_CatNum(sampleData("Cat-Num", nrow = 10))
#'
#' @export hgch_treemap_CatNum
hgch_treemap_CatNum <- function(data, title = NULL, subtitle = NULL, caption = NULL,
                                minColor = "#E63917", maxColor= "#18941E", back_color = 'white', color_title = 'black',
                                reverse = TRUE, export = FALSE,...){
  # data <- sampleData("Cat-Num")
  f <- fringe(data)
  nms <- getClabels(f)

  title <-  title %||% nms[2]
  subtitle <- subtitle %||% ""
  caption <- caption %||% ""

  data <- f$d
  d <- data %>% na.omit() %>% dplyr::group_by(a) %>% dplyr::summarise(b = mean(b))
  d$w <- map_chr(d$b, function(x) format(round(x,2), nsmall=(ifelse(count_pl(x)>2, 2, 0)), big.mark=","))


  hc <- hchart(d, "treemap", hcaes(x = a, value = b, color = b)) %>%
    hc_chart(backgroundColor = back_color) %>%
    hc_title(text = title, style = list(color = color_title, useHTML = TRUE)) %>%
    hc_subtitle(text = subtitle) %>%
    hc_credits(enabled = TRUE, text = caption) %>%
    hc_colorAxis(maxColor = maxColor, minColor = minColor) %>%
    hc_tooltip(
      pointFormat='
                     {point.a}: {point.w}
                  '
               )
  if(reverse) hc <- hc %>% hc_colorAxis(maxColor = minColor, minColor = maxColor)
  if(export) hc <- hc %>% hc_exporting(enabled = TRUE)
  hc
}



#' Treemap coloured by first variable
#' @param x A data.frame
#' @return highcharts viz
#' @section ctypes:
#' Cat-Num
#' @examples
#'
#' hgch_treemap_discrete_color_CatNum(sampleData("Cat-Num", nrow = 10))
#'
#' @export hgch_treemap_discrete_color_CatNum
hgch_treemap_discrete_color_CatNum <-function(data, title = NULL, subtitle = NULL,  caption = NULL,
                                              back_color = 'white', color_title = 'black', export = FALSE){

  f <- fringe(data)
  nms <- getCnames(f)
  data <- f$d


  title <-  title %||% nms[2]
  subtitle <- subtitle %||% ""
  caption <- caption %||% ""


  data <- plyr::rename(data, c("a" = "name"))

  data_graph <- data %>%
    dplyr::group_by(name) %>%
    tidyr::drop_na(name) %>%
    dplyr::summarise(value = mean(b, na.rm = TRUE ))

  data_graph <- data_graph %>%
    dplyr::mutate(x = 0:(dim(data_graph)[1]-1),
                  y = 10 + x + 10 * sin(x),
                  y = round(y, 1),
                  z = (x*y) - median(x*y),
                  color = getPalette()[1:(dim(data_graph)[1])])

  hc <- highchart() %>%
    hc_chart(backgroundColor = back_color) %>%
    hc_title(text = title, style = list(color = color_title, useHTML = TRUE)) %>%
    hc_credits(enabled = TRUE, text = caption) %>%
    hc_subtitle(text = subtitle) %>%
    hc_chart(type = "treemap",
             polar = FALSE) %>%
    hc_xAxis(Categories = data_graph$name) %>%
    hc_add_series(data_graph, showInLegend = FALSE)
  if (export)
    hc <- hc %>% hc_exporting(enabled = TRUE)
  hc
}

#' Treemap coloured by first variable and grouped by second variable
#' @param x A data.frame
#' @return highcharts viz
#' @section ctypes:
#' Cat-Cat-Num
#' @examples
#'
#' hgch_treemap_CatCatNum(sampleData("Cat-Cat-Num", nrow = 10))
#'
#' @export hgch_treemap_CatCatNum

hgch_treemap_CatCatNum  <- function(data,
                                     title = NULL,
                                     subtitle = NULL,
                                     caption = NULL,
                                     agg = "sum",
                                     theme = NULL,
                                     colors = NULL,
                                     export = FALSE, ...) {

  f <- fringe(data)
  nms <- getClabels(f)
  d <- f$d


  d <- d %>% group_by(a, b) %>% drop_na() %>%  summarise(c = agg(agg, c))

  Ngr <- length(unique(d$a))

  ColInt <- if (is.null(colors)) {
    getPalette()[1:Ngr]} else {
      colors <- colorRampPalette(colors)(Ngr)
    }


  dataInfo <- data.frame(id = unique(d$a), name = unique(d$a), color = ColInt)
  dataInfo <- dataInfo %>% map(function(x) as.character(x))

  d <- d %>% select(parent = a, name = b, value = c)
  dd <- bind_rows(dataInfo, d) %>% transpose()

  dd <- map(dd, function (x) x[!is.na(x)])

  hc <- highchart() %>%
         hc_title(text = title) %>%
          hc_subtitle(text = subtitle) %>%
           hc_credits(enabled = TRUE, text = caption) %>%
            hc_chart(type = "treemap",
                     layoutAlgorithm = 'stripes',
                     alternateStartingDirection= TRUE) %>%
              hc_add_series( data = dd,
                             levels= list(list(
                             level = 1,
                             layoutAlgorithm = 'sliceAndDice',
                             dataLabels = list(
                             enabled = TRUE,
                             align = 'left',
                             verticalAlign = 'top',
                             style = list(
                                     fontSize = '15px',
                                     fontWeight = 'bold'
                             ))))) %>%
    hc_add_theme(custom_theme(custom = theme))

  if (export) hc <- hc %>%
    hc_exporting(enabled = TRUE)
  hc
}

#' Nested treemap grouped by categorical variable
#'
#' Nested treemap grouped by categorical variable
#'
#'
#' @param x A data.frame
#' @return highcharts viz
#' @section ctypes:
#' Cat-Cat-Num
#' @examples
#'
#' hgch_treemap_nested_grouped_CatCatNum(sampleData("Cat-Cat-Num", nrow = 10))
#'
#' @export hgch_treemap_nested_grouped_CatCatNum
hgch_treemap_nested_grouped_CatCatNum <- function(data, title = NULL, subtitle = NULL, caption = NULL, export = FALSE,...){
  f <- fringe(data)
  nms <- getClabels(f)

  title <-  title %||% f$name
  subtitle <- subtitle %||% ""
  caption <- caption %||% ""
  data <- f$d
  data <- data %>% dplyr::mutate(a = ifelse(is.na(a), "NA", a),
                                 b = ifelse(is.na(b), "NA", b))

  data <- data %>% drop_na(a, b) %>% dplyr::group_by(a, b) %>% dplyr::summarise(c = mean(c, na.rm = TRUE))

  tm <- treemap::treemap(data,
                         index = c("a", "b"),
                         vSize = "c",
                         vColor = "c",
                         palette = getPalette()[1:(dim(data)[1])],
                         draw = FALSE)
  hc <- hctreemap(tm, allowDrillToNode = TRUE, layoutAlgorithm = "squarified") %>%
    hc_title(text = title) %>%
    hc_subtitle(text = subtitle) %>%
    hc_credits(enabled = TRUE, text = caption) %>%
    hc_plotOptions(
      series = list(
        levels = list(
          level = 1,
          dataLabels = list(enabled = TRUE),
          borderWidth = 3
        )
      )
    )
  if(export) hc <- hc %>% hc_exporting(enabled = TRUE)
  hc
}


#' Nested treemap density
#'
#' Nested treemap density
#'
#'
#' @param x A data.frame
#' @return highcharts viz
#' @section ctypes:
#' Cat-Num-Num
#' @examples
#'
#' hgch_treemap_nested_CatNumNum(sampleData("Cat-Num-Num", nrow = 10))
#'
#' @export hgch_treemap_nested_CatNumNum
hgch_treemap_nested_CatNumNum <- function(data, title = NULL, subtitle = NULL, caption = NULL,
                                          minColor = "#440154", maxColor = "#FDE725", export = FALSE,...){
  f <- fringe(data)
  nms <- getClabels(f)

  title <-  title %||% f$name
  subtitle <- subtitle %||% ""
  caption <- caption %||% ""
  data <- f$d
  data <- data %>% dplyr::mutate(a = ifelse(is.na(a), "NA", a))
  data <- data %>%
    drop_na(a, b, c) %>%
    dplyr::group_by(a) %>%
    dplyr::summarise(b = sum(b, na.rm = TRUE), c = sum(c, na.rm = TRUE))

  hc_trm = with(environment(hc_add_series_treemap),
                ## Modified `hc_add_series_treemap`
                ## names colorValue correctly for connection to `hc_colorAxis`
                function (hc, tm, ...)
                {
                  assertthat::assert_that(is.highchart(hc), is.list(tm))
                  df <- tm$tm %>% tbl_df() %>% select_("-x0", "-y0", "-w",
                                                       "-h", "-stdErr", "-vColorValue") %>% rename_(value = "vSize",
                                                                                                    colorValue = "vColor") %>% purrr::map_if(is.factor, as.character) %>%
                    data.frame(stringsAsFactors = FALSE) %>% tbl_df()
                  ndepth <- which(names(df) == "value") - 1
                  ds <- map_df(seq(ndepth), function(lvl) {
                    df2 <- df %>% filter_(sprintf("level == %s", lvl)) %>%
                      rename_(name = names(df)[lvl]) %>% mutate_(id = "highcharter::str_to_id(name)")
                    if (lvl > 1) {
                      df2 <- df2 %>% mutate_(parent = names(df)[lvl - 1],
                                             parent = "highcharter::str_to_id(parent)")
                    }
                    else {
                      df2 <- df2 %>% mutate_(parent = NA)
                    }
                    df2
                  })
                  ds <- list_parse(ds)
                  ds <- map(ds, function(x) {
                    if (is.na(x$parent))
                      x$parent <- NULL
                    x
                  })
                  hc %>% hc_add_series(data = ds, type = "treemap", ...)
                }
  )


  tm <- treemap::treemap(data,
                         index = "a",
                         vSize = "b",
                         vColor = "c",
                         palette = c(minColor, maxColor),
                         type = "dens",
                         draw = FALSE)

  hc <- highchart()
  hc <- hc_trm(hc, tm, allowDrillToNode = TRUE, layoutAlgorithm = "squarified") %>%
    hc_title(text = title) %>%
    hc_subtitle(text = subtitle) %>%
    hc_credits(enabled = TRUE, text = caption) %>%
    hc_plotOptions(
      series = list(
        levels = list(
          level = 1,
          dataLabels = list(enabled = TRUE),
          borderWidth = 3
        )
      )
    ) %>%
    hc_colorAxis(maxColor = maxColor, minColor = minColor)
  if (export) hc <- hc %>% hc_exporting(enabled = TRUE)
  hc
}




