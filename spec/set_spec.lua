describe("set", function()
  local icu_date = require "icu-date"
  local fields = icu_date.fields
  local date = icu_date.new()
  local format = date:pattern_format("YYYY-MM-dd'T'HH:mm:ss.SSSZZZZZ")

  before_each(function()
    date:set_millis(1507836727123)
    assert.equal("2017-10-12T19:32:07.123Z", date:format(format))
  end)

  it("setting era is a no-op", function()
    assert.equal(1, date:get(fields.ERA))
    date:set(fields.ERA, 0)
    assert.equal(1, date:get(fields.ERA))
    assert.equal("2017-10-12T19:32:07.123Z", date:format(format))
  end)

  it("sets year", function()
    assert.equal(2017, date:get(fields.YEAR))
    date:set(fields.YEAR, 2016)
    assert.equal(2016, date:get(fields.YEAR))
    assert.equal("2016-10-12T19:32:07.123Z", date:format(format))
  end)

  it("sets month", function()
    assert.equal(9, date:get(fields.MONTH))
    date:set(fields.MONTH, 0)
    assert.equal(0, date:get(fields.MONTH))
    assert.equal("2017-01-12T19:32:07.123Z", date:format(format))
  end)

  it("sets week of year", function()
    assert.equal(41, date:get(fields.WEEK_OF_YEAR))
    date:set(fields.WEEK_OF_YEAR, 1)
    assert.equal(1, date:get(fields.WEEK_OF_YEAR))
    assert.equal("2017-01-05T19:32:07.123Z", date:format(format))
  end)

  it("sets week of month", function()
    assert.equal(2, date:get(fields.WEEK_OF_MONTH))
    date:set(fields.WEEK_OF_MONTH, 1)
    assert.equal(1, date:get(fields.WEEK_OF_MONTH))
    assert.equal("2017-10-05T19:32:07.123Z", date:format(format))
  end)

  it("sets date", function()
    assert.equal(12, date:get(fields.DATE))
    date:set(fields.DATE, 1)
    assert.equal(1, date:get(fields.DATE))
    assert.equal("2017-10-01T19:32:07.123Z", date:format(format))
  end)

  it("sets day of year", function()
    assert.equal(285, date:get(fields.DAY_OF_YEAR))
    date:set(fields.DAY_OF_YEAR, 1)
    assert.equal(1, date:get(fields.DAY_OF_YEAR))
    assert.equal("2017-01-01T19:32:07.123Z", date:format(format))
  end)

  it("sets day of week", function()
    assert.equal(5, date:get(fields.DAY_OF_WEEK))
    date:set(fields.DAY_OF_WEEK, 1)
    assert.equal(1, date:get(fields.DAY_OF_WEEK))
    assert.equal("2017-10-08T19:32:07.123Z", date:format(format))
  end)

  it("sets day of week in month", function()
    assert.equal(2, date:get(fields.DAY_OF_WEEK_IN_MONTH))
    date:set(fields.DAY_OF_WEEK_IN_MONTH, 1)
    assert.equal(1, date:get(fields.DAY_OF_WEEK_IN_MONTH))
    assert.equal("2017-10-05T19:32:07.123Z", date:format(format))
  end)

  it("sets am/pm", function()
    assert.equal(1, date:get(fields.AM_PM))
    date:set(fields.AM_PM, 0)
    assert.equal(0, date:get(fields.AM_PM))
    assert.equal("2017-10-12T07:32:07.123Z", date:format(format))
  end)

  it("sets hour", function()
    assert.equal(7, date:get(fields.HOUR))
    date:set(fields.HOUR, 1)
    assert.equal(1, date:get(fields.HOUR))
    assert.equal("2017-10-12T13:32:07.123Z", date:format(format))
  end)

  it("sets hour of day", function()
    assert.equal(19, date:get(fields.HOUR_OF_DAY))
    date:set(fields.HOUR_OF_DAY, 1)
    assert.equal(1, date:get(fields.HOUR_OF_DAY))
    assert.equal("2017-10-12T01:32:07.123Z", date:format(format))
  end)

  it("sets minute", function()
    assert.equal(32, date:get(fields.MINUTE))
    date:set(fields.MINUTE, 1)
    assert.equal(1, date:get(fields.MINUTE))
    assert.equal("2017-10-12T19:01:07.123Z", date:format(format))
  end)

  it("sets second", function()
    assert.equal(7, date:get(fields.SECOND))
    date:set(fields.SECOND, 1)
    assert.equal(1, date:get(fields.SECOND))
    assert.equal("2017-10-12T19:32:01.123Z", date:format(format))
  end)

  it("sets millisecond", function()
    assert.equal(123, date:get(fields.MILLISECOND))
    date:set(fields.MILLISECOND, 1)
    assert.equal(1, date:get(fields.MILLISECOND))
    assert.equal("2017-10-12T19:32:07.001Z", date:format(format))
  end)

  it("sets zone offset", function()
    assert.equal(0, date:get(fields.ZONE_OFFSET))
    date:set(fields.ZONE_OFFSET, 3600000)
    assert.equal(0, date:get(fields.ZONE_OFFSET))
    assert.equal("2017-10-12T18:32:07.123Z", date:format(format))
  end)

  it("sets dst offset", function()
    assert.equal(0, date:get(fields.DST_OFFSET))
    date:set(fields.DST_OFFSET, -3600000)
    assert.equal(0, date:get(fields.DST_OFFSET))
    assert.equal("2017-10-12T20:32:07.123Z", date:format(format))
  end)

  it("sets year woy", function()
    assert.equal(2017, date:get(fields.YEAR_WOY))
    date:set(fields.YEAR_WOY, 2016)
    assert.equal(2016, date:get(fields.YEAR_WOY))
    assert.equal("2016-10-06T19:32:07.123Z", date:format(format))
  end)

  it("sets dow local", function()
    assert.equal(5, date:get(fields.DOW_LOCAL))
    date:set(fields.DOW_LOCAL, 1)
    assert.equal(1, date:get(fields.DOW_LOCAL))
    assert.equal("2017-10-08T19:32:07.123Z", date:format(format))
  end)

  it("sets extended year", function()
    assert.equal(2017, date:get(fields.EXTENDED_YEAR))
    date:set(fields.EXTENDED_YEAR, 2016)
    assert.equal(2016, date:get(fields.EXTENDED_YEAR))
    assert.equal("2016-10-12T19:32:07.123Z", date:format(format))
  end)

  it("sets julian day", function()
    assert.equal(2458039, date:get(fields.JULIAN_DAY))
    date:set(fields.JULIAN_DAY, 1)
    assert.equal(1, date:get(fields.JULIAN_DAY))
    assert.equal("-4712-01-02T19:32:07.123Z", date:format(format))
  end)

  it("sets milliseconds in day", function()
    assert.equal(70327123, date:get(fields.MILLISECONDS_IN_DAY))
    date:set(fields.MILLISECONDS_IN_DAY, 1)
    assert.equal(1, date:get(fields.MILLISECONDS_IN_DAY))
    assert.equal("2017-10-12T00:00:00.001Z", date:format(format))
  end)

  it("sets is leap month", function()
    assert.equal(0, date:get(fields.IS_LEAP_MONTH))
    date:set(fields.IS_LEAP_MONTH, 1)
    assert.equal(1, date:get(fields.IS_LEAP_MONTH))
    assert.equal("2017-10-12T19:32:07.123Z", date:format(format))
  end)

  it("sets day of month", function()
    assert.equal(12, date:get(fields.DAY_OF_MONTH))
    date:set(fields.DAY_OF_MONTH, 1)
    assert.equal(1, date:get(fields.DAY_OF_MONTH))
    assert.equal("2017-10-01T19:32:07.123Z", date:format(format))
  end)
end)
