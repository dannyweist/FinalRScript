
Sys.sleep(rnorm(10, 1))


"https://www.nflweather.com/week/2022/pre-season-week-1" |> 
  rvest::read_html()  -> page

page |> 
  rvest::html_elements("div > div.col-12.col-lg-2.text-center.py-lg-0.game-kickoff-status.px-3 > div.fw-bold.text-wrap") |> 
  rvest::html_text2() -> datetime

page |> 
  rvest::html_elements(xpath = "/html/body/div[3]/div/div[3]/div/div[2]/div[1]/span") |> 
  rvest::html_text2() -> temp

page |> 
  rvest::html_elements(xpath = "/html/body/div[3]/div/div[3]/div/div[2]/div[2]/span") |> 
  rvest::html_text2() -> weather_info

page |> 
  rvest::html_elements("div > div.col-12.col-lg-3.text-center.flex-centered.flex-column.flex-lg-row > div > div:nth-child(3) > div.flex-centered.flex-column.flex-xxl-row.flex-grow-1 > div > span") |> 
  rvest::html_text2() -> home_team

df = data.frame(datetime, home_team,  temp, weather_info)

all_urls = vector()

for (year in 2019:2024) {
  urls = paste0(
    "https://www.nflweather.com/week/",
    year,
    "/week-",
    1:17
  )
  all_urls = c(all_urls, urls)
}
urls = paste0(
  "https://www.nflweather.com/week/",
  2019:2024,
  "/week-",
  1:17
)

all_urls




# * Tables ----------------------------------------------------------------


"https://www.nfl.com/injuries/league/2024/reg12" |> rvest::read_html_live() |> 
  rvest::html_elements("table") |> rvest::html_table() -> all_tables

#main-content > section:nth-child(4) > div > div > div > section:nth-child(2) > div:nth-child(2) > div.d3-o-section-sub-title > span

injuries_df = all_tables |> dplyr::bind_rows()
