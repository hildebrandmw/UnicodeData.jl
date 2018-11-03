# UnicodeData

<!--![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Build Status](https://travis-ci.org/hildebrandmw/UnicodeData.jl.svg?branch=master)](https://travis-ci.org/hildebrandmw/UnicodeData.jl)
[![codecov.io](http://codecov.io/github/hildebrandmw/UnicodeData.jl/coverage.svg?branch=master)](http://codecov.io/github/hildebrandmw/UnicodeData.jl?branch=master)

Detailed Unicode codepoint information taken directly from 
<https://github.com/unicode-table/unicode-table-data>. This package exports a single 
function:

```julia
udata(codepoint::T) where T <: Union{<:AbstractChar, <:Integer}) -> Union{String, Nothing}

Return a string containing information about `codepoint`. If `codepoint` has not been
assigned, return `nothing`.
```

## Usage

```julia
julia> ]

pkg> add https://github.com/hildebrandmw/UnicodeData.jl

julia> udata('A')
"Latin Capital Letter A"

julia> udata('㐁')
"Ideograph to lick; to taste, a mat, bamboo bark CJK : tim2 : tiàn"

julia> udata('\u03F5')
"Greek Lunate Epsilon Symbol : straight epsilon"

# Inform whether codepoints are assigned or not.
julia> udata('\uFF00') == nothing
true
```

## Updating the Unicode Database

To update the Unicode codepoint database, simply run

```
julia> ]

pkg> build UnicodeData
```
