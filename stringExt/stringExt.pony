use "time"

// char * strptime(const char * restrict buf, const char * restrict format, struct tm * restrict timeptr);
use @strptime[Pointer[U8]](buffer:Pointer[U8] tag, format:Pointer[U8] tag, tm:NullablePointer[TM] ref)
use @timegm[I64](tm:NullablePointer[TM] ref)

struct TM
	var tm_sec:U32 = 0
	var tm_min:U32 = 0
	var tm_hour:U32 = 0
	var tm_mday:U32 = 0
	var tm_mon:U32 = 0
	var tm_year:U32 = 0
	var tm_wday:U32 = 0
	var tm_yday:U32 = 0
	var tm_isdst:U32 = 0

primitive StringExt


	fun parseDate(date:String, fmt:String):PosixDate =>
		// parse a date string into the PosixDate format
		var tm:TM ref = TM
		@strptime(date.cpointer(), fmt.cpointer(), NullablePointer[TM](tm))
		let time_t:I64 = @timegm(NullablePointer[TM](tm))
		PosixDate(time_t, 0)

		
		

	fun format(	fmt:String, 
				arg0:Stringable val = "",
				arg1:Stringable val = "", 
				arg2:Stringable val = "",
				arg3:Stringable val = "",
				arg4:Stringable val = "",
				arg5:Stringable val = "",
				arg6:Stringable val = "",
				arg7:Stringable val = "",
				arg8:Stringable val = "",
				arg9:Stringable val = ""):String val =>
		// I'm not super proud of this, but it works and it should be fairly efficient
		// StringExt.format("Such %s formatting", "awesome")
		let string0:String val = arg0.string()
		let string1:String val = arg1.string()
		let string2:String val = arg2.string()
		let string3:String val = arg3.string()
		let string4:String val = arg4.string()
		let string5:String val = arg5.string()
		let string6:String val = arg6.string()
		let string7:String val = arg7.string()
		let string8:String val = arg8.string()
		let string9:String val = arg9.string()
		
		let targetSize = 	fmt.size() + 
							string0.size() + 
							string1.size() + 
							string2.size() + 
							string3.size() + 
							string4.size() + 
							string5.size() + 
							string6.size() + 
							string7.size() + 
							string8.size() + 
							string9.size()
	
		recover val
			var newString = String(targetSize)
		
			try
				var i_arg:USize = 0
				var i:USize = 0
				while i < fmt.size() do
					let c = fmt(i)?
					if i == (fmt.size()-1) then
						newString.push(c)
					else
						let n = fmt(i+1)?
			
						if (c == '%') and (n == 's') then
							i = i + 1
							match i_arg
							| 0 => newString.append(string0)
							| 1 => newString.append(string1)
							| 2 => newString.append(string2)
							| 3 => newString.append(string3)
							| 4 => newString.append(string4)
							| 5 => newString.append(string5)
							| 6 => newString.append(string6)
							| 7 => newString.append(string7)
							| 8 => newString.append(string8)
							| 9 => newString.append(string9)
							end
							i_arg = i_arg + 1

						else
							newString.push(c)
						end
					end
					i = i + 1
				end
			else
				newString.append("(string format conversion failed)")
			end
		
			newString
		end
	
