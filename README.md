# pony.stringExt

A simple collection of string methods Pony.  While you are welcome to use this, it is not well tested nor necessarily meant for wide-spread use yet.

### String Formatting
```
let x:U32 = 42
let s = StringExt.format("Formatting %s is such an %s feeling", x, "awesome")
h.env.out.print(s)
```

### Parse PosixDate from String
```
let d = StringExt.parseDate("10/21/2019 6:27:20 PM", "%m/%d/%Y %I:%M:%S %p")
h.env.out.print(StringExt.format("%s/%s/%s %s:%s:%s", d.month, d.day_of_month, d.year, d.hour, d.min, d.sec))
```

## License

pony.sort is free software distributed under the terms of the MIT license, reproduced below. pony.sort may be used for any purpose, including commercial purposes, at absolutely no cost. No paperwork, no royalties, no GNU-like "copyleft" restrictions. Just download and enjoy.

Copyright (c) 2019 Rocco Bowling

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.