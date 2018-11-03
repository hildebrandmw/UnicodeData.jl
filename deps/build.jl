using LibGit2
using Serialization

unicode_url = "https://github.com/unicode-table/unicode-table-data.git"
local_path = joinpath(@__DIR__, "unicode-data")
serialized_file = joinpath(@__DIR__, "unicode-dict.serial")

# Check if local path already exists. If so, delete is
ispath(local_path) && rm(local_path, recursive = true)
LibGit2.clone(unicode_url, local_path)

# Path to the actual data
symbols_path = joinpath(local_path, "loc", "en", "symbols")

function add!(dict, str::String)
    # Filter out empty lines
    isempty(str) && return

    # Get the caracters up until the first colon, this is the codepoint for this entry
    ind = findfirst(":", str) 
    num = parse(UInt32, SubString(str, 1, prevind(str, first(ind))); base = 16)
    info = strip(SubString(str, nextind(str, last(ind)), lastindex(str)))

    # Add entry if it exists
    !isempty(info) && (dict[num] = info)
    return
end

function collect_codepoints(dir)
    dict = Dict{UInt32, String}()
    for (root, _, files) in walkdir(dir), file in files
        open(joinpath(root, file)) do f
            for ln in eachline(f)
                add!(dict, ln)
            end
        end
    end
    return dict
end

# Walk through and collect all of the code points.
codepoints = collect_codepoints(symbols_path)

# Save
open(io -> serialize(io, codepoints), serialized_file; write = true)
