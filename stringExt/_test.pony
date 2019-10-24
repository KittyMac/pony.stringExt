use "ponytest"
use "time"

actor Main is TestList
	new create(env: Env) => PonyTest(env, this)
	new make() => None

	fun tag tests(test: PonyTest) =>
	
		test(_TestFormatString)
		test(_TestParseDate)
		


class iso _TestFormatString is UnitTest
	fun name(): String => "format string"
	
	fun apply(h: TestHelper) =>
		let x:U32 = 42
		let s = StringExt.format("Formatting %s is such an %s feeling", x, "awesome")
		h.env.out.print(s)

class iso _TestParseDate is UnitTest
	fun name(): String => "parse date"

	fun apply(h: TestHelper) =>
		try
			let d = StringExt.parseDate("10/21/2019 6:27:20 PM", "%m/%d/%Y %I:%M:%S %p")?
			h.env.out.print(StringExt.format("%s/%s/%s %s:%s:%s", d.month, d.day_of_month, d.year, d.hour, d.min, d.sec))
		end

